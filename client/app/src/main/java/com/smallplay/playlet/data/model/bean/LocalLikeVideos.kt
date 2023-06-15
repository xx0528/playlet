package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@SuppressLint("ParcelCreator")
@Parcelize
data class LocalLikeVideos(
    var ID: Int,			//短剧id
    var videoName: String,			//短剧名
    var videoType: Int,			//短剧分类
    var typeName: String,			//分类名
    var videoDesc: String,			//简介
    var finish: Int,			//是否完结 1 完结 0 更新
    var count: Int,			//集数
    var episode: Int,       //观看集数
    var time: Int,          //观看到多少秒
    var imgUrl: String,			//图片
    var videoUrl: String			//视频地址
) : Parcelable
