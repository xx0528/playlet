package com.smallplay.playlet.viewmodel.state

import android.view.View
import androidx.databinding.ObservableField
import androidx.databinding.ObservableInt
import androidx.lifecycle.map
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.callback.databind.BooleanObservableField
import me.hgj.jetpackmvvm.callback.databind.StringObservableField
import me.hgj.jetpackmvvm.callback.livedata.StringLiveData
import me.hgj.jetpackmvvm.ext.util.logd

/**
 * 描述　:登录注册的ViewModel
 */
class BindViewModel : BaseViewModel() {

    //用户名
    var username = StringObservableField()


}