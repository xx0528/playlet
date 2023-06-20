package com.smallplay.playlet.data.model.bean
import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

/**
 * 描述　: 账户信息
 */
@SuppressLint("ParcelCreator")
@Parcelize
data class UserInfo(
var userName: String,
var userId: String,
var password: String,
var uuid: String,
var guestId: String,
var phone: String,
var recharge: Double,
var curGold: Long,
var buyVideos: String,
var registerTime: String,
var lastLoginTime: String,
var likeVideos: String,
var enable: Int,
var token: String,
var check: Boolean,
var chatServer: String,
var rechargeDesc: String,
var expiresAt: Long) : Parcelable
