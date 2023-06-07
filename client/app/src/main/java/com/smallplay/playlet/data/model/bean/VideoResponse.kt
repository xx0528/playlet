package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize


/**
 * 视频
 */
@SuppressLint("ParcelCreator")
@Parcelize
data class VideoResponse(
     var ID: Int,			//短剧id
     var videoName: String,			//短剧名
     var videoType: Int,			//短剧分类
     var typeName: String,			//分类名
     var videoDesc: String,			//简介
     var likeCount: Int,			//收藏人数
     var playCount: Int,			//播放次数
     var finish: Int,			//是否完结 1 完结 0 更新
     var count: Int,			//集数
     var imgUrl: String,			//图片
     var videoUrl: String,			//视频地址
     var createTime: String,			//上架时间
     var freeCount: Int,			//免费集数
     var lockCount: Int			//解锁集数
) : Parcelable

