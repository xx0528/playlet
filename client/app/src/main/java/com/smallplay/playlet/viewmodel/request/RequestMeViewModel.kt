package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import com.smallplay.playlet.data.model.bean.RechargeData
import com.smallplay.playlet.data.model.bean.UserInfo
import com.smallplay.playlet.data.repository.request.HttpRequestCoroutine
import me.hgj.jetpackmvvm.ext.request
import me.hgj.jetpackmvvm.state.ResultState

/**
 * 描述　:
 */
class RequestMeViewModel : BaseViewModel() {

    var meData = MutableLiveData<ResultState<UserInfo>>()

    var meVip = MutableLiveData<ListDataUiState<RechargeData>>()
    fun getUserInfo() {
        request({ apiService.getUserInfo() }, meData)
    }

    fun getVipInfo() {
        request({ HttpRequestCoroutine.getVipData(1) }, {
            //请求成功
            val listDataUiState =
                ListDataUiState(
                    isSuccess = true,
                    isRefresh = false,
                    isEmpty = it.isEmpty(),
                    hasMore = it.hasMore(),
                    isFirstEmpty = false,
                    listData = it.list
                )

            meVip.value = listDataUiState
        })
    }

}