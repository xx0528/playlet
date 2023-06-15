package com.smallplay.playlet.app.event

import android.util.Log
import androidx.lifecycle.MutableLiveData
import com.blankj.utilcode.util.ToastUtils
import com.kunminx.architecture.ui.callback.UnPeekLiveData
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import me.hgj.jetpackmvvm.base.appContext
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.callback.livedata.event.EventLiveData
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.data.model.bean.UserInfo
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.data.repository.request.HttpRequestCoroutine
import me.hgj.jetpackmvvm.ext.request

/**
 * 描述　:APP全局的ViewModel，可以存放公共数据，当他数据改变时，所有监听他的地方都会收到回调,也可以做发送消息
 * 比如 全局可使用的 地理位置信息，账户信息,App的基本配置等等，
 */
class AppViewModel : BaseViewModel() {

    private val TAG = "AppViewModel--------"
    //App的账户信息
    var userInfo = UnPeekLiveData.Builder<UserInfo>().setAllowNullValue(true).create()

    //App主题颜色 中大型项目不推荐以这种方式改变主题颜色，比较繁琐耦合，且容易有遗漏某些控件没有设置主题色
    var appColor = EventLiveData<Int>()

    //App状态栏透明
    var statusBarColor = EventLiveData<Int>()

    //App 列表动画
    var appAnimation = EventLiveData<Int>()

    //页面 视频数据页面从0开始
    var pageNo = 0

    //剧场视频列表数据
    var videoParkDataState: MutableLiveData<ListDataUiState<VideoResponse>> = MutableLiveData()

    //首页视频列表数据
    var videoHomeDataState:  MutableLiveData<ListDataUiState<VideoResponse>> = MutableLiveData()

    //当前选中视频
    var curPlayVideoNo : MutableLiveData<Int> = MutableLiveData()

    //App状态栏透明
    var dialogVisible = EventLiveData<Int>()

    //当前页面
    var curPage = EventLiveData<String>()

    var likeVideos = EventLiveData<String>()

    init {
        //默认值保存的账户信息，没有登陆过则为null
        userInfo.value = CacheUtil.getUser()
        likeVideos.value = userInfo.value?.likeVideos
        //默认值颜色
        appColor.value = SettingUtil.getColor(appContext)
        //初始化列表动画
        appAnimation.value = SettingUtil.getListMode()
    }

    /**
     * 获取首页视频列表数据
     * @param isRefresh 是否是刷新，即第一页
     */
    fun getVideoData(isRefresh: Boolean, isHomePage : Boolean = false) {
        if (isRefresh) {
            pageNo = 0
        }
        request({ HttpRequestCoroutine.getVideoData(pageNo) }, {
            //请求成功
            pageNo++
            var listData: ArrayList<VideoResponse> = arrayListOf()
            listData = if (isRefresh) {
                it.list
            } else {
                videoParkDataState.value?.listData?.addAll(it.list)
                videoParkDataState.value?.listData!!
            }
            val listDataUiState =
                ListDataUiState(
                    isSuccess = true,
                    isRefresh = isRefresh,
                    isEmpty = it.isEmpty(),
                    hasMore = it.hasMore(),
                    isFirstEmpty = isRefresh && it.isEmpty(),
                    listData = listData
                )

            videoParkDataState.value = listDataUiState
            if (isHomePage) {
                setCurVideo(it.list[0].ID)
            }
        }, {
            //请求失败
            val listDataUiState =
                ListDataUiState(
                    isSuccess = false,
                    errMessage = it.errorMsg,
                    isRefresh = isRefresh,
                    listData = arrayListOf<VideoResponse>()
                )
            videoParkDataState.value = listDataUiState
        })
    }

    fun setNextVideo() {
        for (i in 0 until (videoParkDataState.value?.listData?.size ?: 0)) {
            val item = videoParkDataState.value?.listData?.get(i)
            if (item != null) {
                if (item.ID == (videoHomeDataState.value?.listData?.get(0)?.ID ?: 0)) {
                    var idx = i + 1
                    if (idx >= videoParkDataState.value?.listData?.size!!) {
                        idx = 0
                    }
                    videoParkDataState.value?.listData?.get(idx)?.ID?.let { setCurVideo(it) }
                    break
                }
            }
        }
    }

    fun setCurVideo(videoID : Int) {
        //通过选中的视频构造整部数据
        var videoInfo = getVideoByID(videoID) ?: return
        Log.d(TAG, "设置 当前播放视频 $videoID 根据ID获取到 视频名 ${videoInfo.videoName}")
        val arrayList = arrayListOf<VideoResponse>()

        if (videoInfo != null) {
            for (i in 1 until videoInfo.count+1) {
                val newVideo = videoInfo.copy(imgUrl = "${videoInfo.videoUrl}/cover.png", videoUrl = "${videoInfo.videoUrl}/$i.mp4")
                arrayList.add(newVideo)
            }
        }
        val listDataUiState =
            ListDataUiState(
                isSuccess = true,
                isRefresh = false,
                isEmpty = false,
                hasMore = true,
                isFirstEmpty = false,
                listData = arrayList
            )
        videoHomeDataState.value = listDataUiState
        curPlayVideoNo.value = 0
    }

    private fun getVideoByID(ID : Int) : VideoResponse? {
        Log.d(TAG, "当前视频的个数 -- ${videoParkDataState.value?.listData?.size} 要和获取的ID $ID")
        for(item in videoParkDataState.value?.listData!!) {
            Log.d(TAG,"itemID -- ${item.ID} - 名字 - ${item.videoName}")
            if (item.ID == ID) {
                return item
            }
        }
        return null
    }

    fun likeVideo(ID: Int) {
        request({ HttpRequestCoroutine.likeVideo(ID) }, {
            Log.d(TAG, "likevideos -- ${userInfo.value?.likeVideos}")
            likeVideos.value = it.likeVideos
            userInfo.value?.likeVideos = it.likeVideos
            Log.d(TAG, "likevideos 改变之后 -- ${userInfo.value?.likeVideos}")
        }, {
        })
    }

    fun playVideo(ID: Int, episode: Int) {
        request({ HttpRequestCoroutine.playVideo(ID, episode) }, {
            if (it.code == 4) {
                ToastUtils.showShort(it.msg)
                return@request
            }
            if (it.code == 3) {
                //购买解锁
                userInfo.value = it.userInfo
                likeVideos.value = it.userInfo.likeVideos
            }
            ToastUtils.showShort(it.msg)
            curPlayVideoNo.value = it.episode
        }, {
        })
    }

    fun reqPlay(position: Int) {
        var videoId = videoHomeDataState.value?.listData?.get(0)?.ID
        if (videoId != null) {
            appViewModel.playVideo(videoId, position)
        }
    }

}