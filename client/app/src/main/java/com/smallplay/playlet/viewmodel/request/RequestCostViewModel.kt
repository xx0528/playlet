package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.network.stateCallback.ListDataUiState
import com.smallplay.playlet.app.network.stateCallback.UpdateUiState
import com.smallplay.playlet.data.model.bean.CostResponse
import me.hgj.jetpackmvvm.ext.request

/**
 * 描述　:
 */
class RequestCostViewModel : BaseViewModel() {

    var pageNo = 1

    //列表集合数据
    var costDataState = MutableLiveData<ListDataUiState<CostResponse>>()

    //删除的回调数据
    var delDataState = MutableLiveData<UpdateUiState<Int>>()

    //完成的回调数据
    var doneDataState = MutableLiveData<UpdateUiState<Int>>()

    //添加修改的回调数据
    var updateDataState = MutableLiveData<UpdateUiState<Int>>()


    fun getCostData(isRefresh: Boolean) {
        if (isRefresh) {
            pageNo = 1
        }
        request({ apiService.getCostData(pageNo) }, {
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
            costDataState.value = listDataUiState
        }, {
            //请求失败
            val listDataUiState =
                ListDataUiState(
                    isSuccess = false,
                    errMessage = it.errorMsg,
                    isRefresh = isRefresh,
                    listData = arrayListOf<CostResponse>()
                )
            costDataState.value = listDataUiState
        })
    }

}

