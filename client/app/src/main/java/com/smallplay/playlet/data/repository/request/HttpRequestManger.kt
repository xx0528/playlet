package com.smallplay.playlet.data.repository.request

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import com.smallplay.playlet.app.network.ApiService
import com.smallplay.playlet.app.network.NetworkApi
import com.smallplay.playlet.app.network.apiService
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.data.model.bean.*
import me.hgj.jetpackmvvm.network.AppException

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
     * 获取首页文章数据
     */
    suspend fun getHomeData(pageNo: Int): ApiResponse<ApiPagerResponse<ArrayList<AriticleResponse>>> {
        //同时异步请求2个接口，请求完成后合并数据
        return withContext(Dispatchers.IO) {
            val listData = async { apiService.getAritrilList(pageNo) }
            //如果App配置打开了首页请求置顶文章，且是第一页
            if (CacheUtil.isNeedTop() && pageNo == 0) {
                val topData = async { apiService.getTopAritrilList() }
                listData.await().data.list.addAll(0, topData.await().data)
                listData.await()
            } else {
                listData.await()
            }
        }
    }

    /**
     * 注册并登陆
     */
    suspend fun register(username: String, password: String): ApiResponse<UserInfo> {
//        val registerData = apiService.register(username, password, password)
//        //判断注册结果 注册成功，调用登录接口
//        if (registerData.isSucces()) {
//            return apiService.login(username, password)
//        } else {
//            //抛出错误异常
//            throw AppException(registerData.code, registerData.msg)
//        }

        return apiService.login(username, password)
    }

    /**
     * 收藏视频
     */
    suspend fun likeVideo(ID: Int): ApiResponse<String> {
        return apiService.likeVideo(ID)
    }

    /**
     * 播放视频
     */
    suspend fun playVideo(ID: Int, episode: Int): ApiResponse<PlayVideoResponse> {
        return apiService.playVideo(ID, episode)
    }


    /**
     * 获取项目标题数据
     */
    suspend fun getProjectData(
        pageNo: Int,
        cid: Int = 0,
        isNew: Boolean = false
    ): ApiResponse<ApiPagerResponse<ArrayList<AriticleResponse>>> {
        return if (isNew) {
            apiService.getProjecNewData(pageNo)
        } else {
            apiService.getProjecDataByType(pageNo, cid)
        }
    }
}