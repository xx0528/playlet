package com.smallplay.playlet.viewmodel.state

import android.view.View
import androidx.databinding.ObservableField
import androidx.databinding.ObservableInt
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.map
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.data.model.bean.UserInfo
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.callback.databind.BooleanObservableField
import me.hgj.jetpackmvvm.callback.databind.StringObservableField
import me.hgj.jetpackmvvm.callback.livedata.StringLiveData
import me.hgj.jetpackmvvm.ext.request
import me.hgj.jetpackmvvm.ext.util.logd
import me.hgj.jetpackmvvm.state.ResultState

/**
 * 描述　:登录注册的ViewModel
 */
class BindViewModel : BaseViewModel() {

    //用户名
    var bind_phone = StringObservableField()
}