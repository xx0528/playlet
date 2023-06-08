package com.smallplay.playlet.app.event

import androidx.lifecycle.MutableLiveData
import com.kunminx.architecture.ui.callback.UnPeekLiveData
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

    //App的账户信息
    var userInfo = UnPeekLiveData.Builder<UserInfo>().setAllowNullValue(true).create()

    //App主题颜色 中大型项目不推荐以这种方式改变主题颜色，比较繁琐耦合，且容易有遗漏某些控件没有设置主题色
    var appColor = EventLiveData<Int>()

    //App 列表动画
    var appAnimation = EventLiveData<Int>()

    //页面 视频数据页面从0开始
    var pageNo = 0

    //首页视频列表数据
    var videoDataState: MutableLiveData<ListDataUiState<VideoResponse>> = MutableLiveData()

    init {
        //默认值保存的账户信息，没有登陆过则为null
        userInfo.value = CacheUtil.getUser()
        //默认值颜色
        appColor.value = SettingUtil.getColor(appContext)
        //初始化列表动画
        appAnimation.value = SettingUtil.getListMode()
    }

    /**
     * 获取首页视频列表数据
     * @param isRefresh 是否是刷新，即第一页
     */
    fun getVideoData(isRefresh: Boolean) {
        if (isRefresh) {
            pageNo = 0
        }
        request({ HttpRequestCoroutine.getVideoData(pageNo) }, {
            //请求成功
            pageNo++
            val listDataUiState =
                ListDataUiState(
                    isSuccess = true,
                    isRefresh = isRefresh,
                    isEmpty = it.isEmpty(),
                    hasMore = it.hasMore(),
                    isFirstEmpty = isRefresh && it.isEmpty(),
                    listData = it.list
                )
            videoDataState.value = listDataUiState
        }, {
            //请求失败
            val listDataUiState =
                ListDataUiState(
                    isSuccess = false,
                    errMessage = it.errorMsg,
                    isRefresh = isRefresh,
                    listData = arrayListOf<VideoResponse>()
                )
            videoDataState.value = listDataUiState
        })
    }
}