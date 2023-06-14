package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize


@SuppressLint("ParcelCreator")
@Parcelize
data class PlayVideoResponse(var code: Int, var msg: String, var ID: Int,  var episode: Int, var userInfo: UserInfo): Parcelable
