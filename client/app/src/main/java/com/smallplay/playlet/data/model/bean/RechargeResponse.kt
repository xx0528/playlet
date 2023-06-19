package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize


/**
 * 视频
 */
@SuppressLint("ParcelCreator")
@Parcelize
data class RechargeResponse(
     var ID: Int,
     var userName: String,
     var userId: String,
     var recharge: Long,
     var time: String,
     var buyGold: Long,
     var giveGold: Long,
     var leftGold: Long,
     var adminId: Int
) : Parcelable

