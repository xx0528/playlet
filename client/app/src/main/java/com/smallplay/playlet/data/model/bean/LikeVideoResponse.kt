package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize


@SuppressLint("ParcelCreator")
@Parcelize
data class LikeVideoResponse(var likeVideos: String): Parcelable
