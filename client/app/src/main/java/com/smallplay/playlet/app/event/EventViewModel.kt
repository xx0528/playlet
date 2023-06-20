package com.smallplay.playlet.app.event

import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.callback.livedata.event.EventLiveData

/**
 * 描述　:APP全局的ViewModel，可以在这里发送全局通知替代EventBus，LiveDataBus等
 */
class EventViewModel : BaseViewModel() {

    //添加TODO通知
    val todoEvent = EventLiveData<Boolean>()

    var navigationIdx = EventLiveData<Int>()

}