package com.smallplay.playlet.ui.adapter

import android.text.TextUtils
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseDelegateMultiAdapter
import com.chad.library.adapter.base.delegate.BaseMultiTypeDelegate
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.app.weight.customview.CollectView

class VideoAdapter(data: MutableList<VideoResponse>?) :
    BaseDelegateMultiAdapter<VideoResponse, BaseViewHolder>(data) {

    private var collectAction: (item: VideoResponse, v: CollectView, position: Int) -> Unit =
        { _: VideoResponse, _: CollectView, _: Int -> }

    init {
        setAdapterAnimation(SettingUtil.getListMode())
    }

    override fun convert(holder: BaseViewHolder, item: VideoResponse) {

    }

    fun setCollectClick(inputCollectAction: (item: VideoResponse, v: CollectView, position: Int) -> Unit) {
        this.collectAction = inputCollectAction
    }

}


