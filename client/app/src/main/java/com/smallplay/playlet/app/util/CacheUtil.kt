package com.smallplay.playlet.app.util

import android.text.TextUtils
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.smallplay.playlet.data.model.bean.LocalLikeVideos
import com.smallplay.playlet.data.model.bean.UserInfo
import com.tencent.mmkv.MMKV

object CacheUtil {
    /**
     * 获取保存的账户信息
     */
    fun getUser(): UserInfo? {
        val kv = MMKV.mmkvWithID("app")
        val userStr = kv.decodeString("user")
        return if (TextUtils.isEmpty(userStr)) {
           null
        } else {
            Gson().fromJson(userStr, UserInfo::class.java)
        }
    }

    /**
     * 设置账户信息
     */
    fun setUser(userResponse: UserInfo?) {
        val kv = MMKV.mmkvWithID("app")
        if (userResponse == null) {
            kv.encode("user", "")
            setIsLogin(false)
        } else {
            kv.encode("user", Gson().toJson(userResponse))
            setIsLogin(true)
        }

    }

    /**
     * 获取本地视频观看记录
     */
    fun getLocalVideos() : ArrayList<LocalLikeVideos>? {
        val kv = MMKV.mmkvWithID("app")
        val videosStr = kv.decodeString("localLikeVideos")
        return if (TextUtils.isEmpty(videosStr)) {
            arrayListOf()
        } else {
            val type = object : TypeToken<ArrayList<LocalLikeVideos>>() {}.type
            Gson().fromJson<ArrayList<LocalLikeVideos>>(videosStr, type)
        }
    }

    /**
     * 设置本地视频观看记录
     */
    fun setLocalVideos(localLikeVideos: ArrayList<LocalLikeVideos>?) {
        val kv = MMKV.mmkvWithID("app")
        if (localLikeVideos == null) {
            kv.encode("localLikeVideos", "")
        } else {
            kv.encode("localLikeVideos", Gson().toJson(localLikeVideos))
        }
    }

    /**
     * 是否已经登录
     */
    fun isLogin(): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.decodeBool("login", false)
    }

    /**
     * 设置是否已经登录
     */
    fun setIsLogin(isLogin: Boolean) {
        val kv = MMKV.mmkvWithID("app")
        kv.encode("login", isLogin)
    }

    /**
     * 是否已经绑定手机号
     */
    fun isBind(): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.decodeBool("bind", false)
    }

    /**
     * 设置是否已经绑定手机号
     */
    fun setIsBind(isBind: Boolean) {
        val kv = MMKV.mmkvWithID("app")
        kv.encode("bind", isBind)
    }

    /**
     * 是否是第一次登陆
     */
    fun isFirst(): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.decodeBool("first", true)
    }
    /**
     * 是否是第一次登陆
     */
    fun setFirst(first:Boolean): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.encode("first", first)
    }

    /**
     * 首页是否开启获取指定文章
     */
    fun isNeedTop(): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.decodeBool("top", true)
    }
    /**
     * 设置首页是否开启获取指定文章
     */
    fun setIsNeedTop(isNeedTop:Boolean): Boolean {
        val kv = MMKV.mmkvWithID("app")
        return kv.encode("top", isNeedTop)
    }
    /**
     * 获取搜索历史缓存数据
     */
    fun getSearchHistoryData(): ArrayList<String> {
        val kv = MMKV.mmkvWithID("cache")
        val searchCacheStr =  kv.decodeString("history")
        if (!TextUtils.isEmpty(searchCacheStr)) {
            return Gson().fromJson(searchCacheStr
                , object : TypeToken<ArrayList<String>>() {}.type)
        }
        return arrayListOf()
    }

    fun setSearchHistoryData(searchResponseStr: String) {
        val kv = MMKV.mmkvWithID("cache")
        kv.encode("history",searchResponseStr)
    }
}