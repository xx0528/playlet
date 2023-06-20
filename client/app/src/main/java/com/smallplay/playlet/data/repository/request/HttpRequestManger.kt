package com.smallplay.playlet.data.repository.request

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.data.model.bean.*

/**
 * 描述　: 处理协程的请求类
 */

val HttpRequestCoroutine: HttpRequestManger by lazy(mode = LazyThreadSafetyMode.SYNCHRONIZED) {
    HttpRequestManger()
}

class HttpRequestManger {
    /**
     * 获取首页视频数据
     */
    suspend fun getVideoData(pageNo: Int): ApiResponse<ApiPagerResponse<ArrayList<VideoResponse>>> {
        return apiService.getVideoList(pageNo)
    }

    /**
     * 获取充值数据
     */
    suspend fun getVipData(pageNo: Int): ApiResponse<ApiPagerResponse<ArrayList<RechargeData>>> {
        return apiService.getVipInfo(pageNo)
    }

    /**
     * 设置昵称密码
     */
    suspend fun setPswNickname(username: String, password: String) : ApiResponse<UserInfo> {
        return apiService.setPswNickname(username, password)
    }
    /**
     * 注册并登陆
     */
    suspend fun registerAndlogin(username: String, password: String): ApiResponse<UserInfo> {
//        val registerData = apiService.register(username, password, password)
//        //判断注册结果 注册成功，调用登录接口
//        if (registerData.isSucces()) {
//            return apiService.login(username, password)
//        } else {
//            //抛出错误异常
//            throw AppException(registerData.code, registerData.msg)
//        }

        return apiService.registAndLogin(username, password)
    }

    /**
     * 收藏视频
     */
    suspend fun likeVideo(ID: Int): ApiResponse<LikeVideoResponse> {
        return apiService.likeVideo(ID)
    }

    /**
     * 播放视频
     */
    suspend fun playVideo(ID: Int, episode: Int): ApiResponse<PlayVideoResponse> {
        return apiService.playVideo(ID, episode)
    }
}