package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize


/**
 * 视频
 */
@SuppressLint("ParcelCreator")
@Parcelize
data class CostResponse(
     var ID: Int,
     var userName: String,
     var userId: String,
     var costGold: Long,
     var time: String,
     var leftGold: Long,
     var buyVideo: String
) : Parcelable

