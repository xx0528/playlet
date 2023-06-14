package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.data.model.bean.IntegralResponse
import com.smallplay.playlet.data.model.bean.UserInfo
import me.hgj.jetpackmvvm.ext.request
import me.hgj.jetpackmvvm.state.ResultState

/**
 * 描述　:
 */
class RequestMeViewModel : BaseViewModel() {

    var meData = MutableLiveData<ResultState<UserInfo>>()

    fun getUserInfo() {
        request({ apiService.getUserInfo() }, meData)
    }
}