package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import com.smallplay.playlet.data.model.bean.AriticleResponse
import com.smallplay.playlet.data.model.bean.BannerResponse
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.data.repository.request.HttpRequestCoroutine
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.ext.request
import me.hgj.jetpackmvvm.state.ResultState

class RequestVideoViewModel: BaseViewModel() {

    //页码 首页数据页码从0开始
    var pageNo = 0

    //首页视频列表数据
    var videoDataState: MutableLiveData<ListDataUiState<VideoResponse>> = MutableLiveData()

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