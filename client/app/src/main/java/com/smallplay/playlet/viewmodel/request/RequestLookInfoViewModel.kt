package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import com.smallplay.playlet.data.model.bean.AriticleResponse
import com.smallplay.playlet.data.model.bean.ShareResponse
import me.hgj.jetpackmvvm.ext.request

/**
 * 描述　:
 */
class RequestLookInfoViewModel : BaseViewModel() {

    var pageNo = 1

    var shareListDataUistate = MutableLiveData<ListDataUiState<AriticleResponse>>()

    var shareResponse = MutableLiveData<ShareResponse>()

    fun getLookinfo(id: Int, isRefresh: Boolean) {
        if (isRefresh) {
            pageNo = 1
        }
        request({ apiService.getShareByidData(id, pageNo) }, {
            //请求成功
            pageNo++
            shareResponse.value = it
            val listDataUiState =
                ListDataUiState(
                    isSuccess = true,
                    isRefresh = it.shareArticles.isRefresh(),
                    isEmpty = it.shareArticles.isEmpty(),
                    hasMore = it.shareArticles.hasMore(),
                    isFirstEmpty = isRefresh && it.shareArticles.isEmpty(),
                    listData = it.shareArticles.list
                )
            shareListDataUistate.value = listDataUiState
        }, {
            //请求失败
            val listDataUiState =
                ListDataUiState(
                    isSuccess = false,
                    errMessage = it.errorMsg,
                    isRefresh = isRefresh,
                    listData = arrayListOf<AriticleResponse>()
                )
            shareListDataUistate.value = listDataUiState
        })
    }
}