package com.smallplay.playlet.app.network

import com.smallplay.playlet.data.model.bean.*
import retrofit2.http.*

/**
 * 描述　: 网络API
 */
interface ApiService {

    companion object {
//        const val SERVER_URL = "http://47.90.250.28:8086/api/"
//        const val SERVER_URL = "http://192.168.0.106:8080/api/"
//        const val SERVER_URL = "http://192.168.3.67:8080/api/"
        const val SERVER_URL = "http://47.245.100.227:8082/api/"
    }

    /**
     * 登录
     */
    @FormUrlEncoded
    @POST("plUserVideo/plLogin")
    suspend fun registAndLogin(
        @Field("username") username: String,
        @Field("password") pwd: String
    ): ApiResponse<UserInfo>

    /**
     * 登录
     */
    @FormUrlEncoded
    @POST("plUser/plLoginByPhone")
    suspend fun loginByPhone(
        @Field("phone") phone: String,
        @Field("password") pwd: String
    ): ApiResponse<UserInfo>


    /**
     * 设置昵称密码
     */
    @FormUrlEncoded
    @POST("plUser/plSetPswNickname")
    suspend fun setPswNickname(
        @Field("username") username: String,
        @Field("password") pwd: String
    ): ApiResponse<UserInfo>

    /**
     * 获取playlet用户信息
     */
    @GET("plUser/plGetUserInfo")
    suspend fun getUserInfo(): ApiResponse<UserInfo>

    /**
     * 获取vip配置
     */
    @GET("plVip/getPlVipList")
    suspend fun getVipInfo(@Query("page") pageNo: Int): ApiResponse<ApiPagerResponse<ArrayList<RechargeData>>>
    /**
     * 播放一个视频
     */
    @FormUrlEncoded
    @POST("plUser/playVideo")
    suspend fun playVideo(
        @Field("id") id: Int,
        @Field("episode") episode: Int
    ): ApiResponse<PlayVideoResponse>

    /**
     * 收藏视频
     */
    @FormUrlEncoded
    @POST("plUser/likeVideo")
    suspend fun likeVideo(
        @Field("id") id: Int
    ): ApiResponse<LikeVideoResponse>

    /**
     * 获取视频数据
     */
    @GET("plVideo/getPlUserVideoList")
    suspend fun getVideoList(@Query("page") pageNo: Int): ApiResponse<ApiPagerResponse<ArrayList<VideoResponse>>>

    /**
     * 获取Cost列表数据 根据完成时间排序
     */
    @GET("plCost/getPlCostData")
    suspend fun getCostData(@Query("page") page: Int): ApiResponse<ApiPagerResponse<ArrayList<CostResponse>>>

    /**
     * 获取Cost列表数据 根据完成时间排序
     */
    @GET("plRecharge/getPlRechargeData")
    suspend fun getRechargeData(@Query("page") page: Int): ApiResponse<ApiPagerResponse<ArrayList<RechargeResponse>>>

    /**
     * 绑定手机号
     */
    @GET("plUser/plBindPhone")
    suspend fun bind(@Query("phone") phone: String): ApiResponse<UserInfo>

    /**
     * 获取banner数据
     */
    @GET("banner/json")
    suspend fun getBanner(): ApiResponse<ArrayList<BannerResponse>>

}