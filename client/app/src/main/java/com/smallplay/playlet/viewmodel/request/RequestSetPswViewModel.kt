package com.smallplay.playlet.viewmodel.request

import androidx.lifecycle.MutableLiveData
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.data.model.bean.UserInfo
import com.smallplay.playlet.data.repository.request.HttpRequestCoroutine
import me.hgj.jetpackmvvm.ext.request
import me.hgj.jetpackmvvm.state.ResultState

/**
 * 描述　:登录注册的请求ViewModel
 */
class RequestSetPswViewModel : BaseViewModel() {

    //方式1  自动脱壳过滤处理请求结果，判断结果是否成功
    var setPswResult = MutableLiveData<ResultState<UserInfo>>()

    //方式2  不用框架帮脱壳，判断结果是否成功
//    var loginResult2 = MutableLiveData<ResultState<ApiResponse<UserInfo>>>()

    fun loginReq(username: String, password: String) {
        //1.这种是在 Activity/Fragment的监听回调中拿到已脱壳的数据（项目有基类的可以用）
       request(
            { apiService.registAndLogin(username, password) }//请求体
            , setPswResult,//请求的返回结果，请求成功与否都会改变该值，在Activity或fragment中监听回调结果，具体可看loginActivity中的回调
            true,//是否显示等待框，，默认false不显示 可以默认不传
            "正在设置中..."//等待框内容，可以默认不填请求网络中...
        )
    }

    fun setPswNickname(username: String, password: String) {
        request(
            { HttpRequestCoroutine.setPswNickname(username, password) }
            , setPswResult,
            true,
            "正在联网中..."
        )
    }
}