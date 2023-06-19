package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import com.smallplay.playlet.app.network.stateCallback.UpdateUiState
import com.smallplay.playlet.data.model.bean.RechargeResponse
import me.hgj.jetpackmvvm.ext.request

/**
 * 描述　:
 */
class RequestRechargeViewModel : BaseViewModel() {

    var pageNo = 1

    //列表集合数据
    var rechargeDataState = MutableLiveData<ListDataUiState<RechargeResponse>>()


    fun getRechargeData(isRefresh: Boolean) {
        if (isRefresh) {
            pageNo = 1
        }
        request({ apiService.getRechargeData(pageNo) }, {
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
            rechargeDataState.value = listDataUiState
        }, {
            //请求失败
            val listDataUiState =
                ListDataUiState(
                    isSuccess = false,
                    errMessage = it.errorMsg,
                    isRefresh = isRefresh,
                    listData = arrayListOf<RechargeResponse>()
                )
            rechargeDataState.value = listDataUiState
        })
    }

}

