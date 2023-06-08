package com.smallplay.playlet.ui.adapter

import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseQuickAdapter
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil

class VideoParkAdapter(data: MutableList<VideoResponse>?) :
    BaseQuickAdapter<VideoResponse, BaseViewHolder>(
        R.layout.item_video_list, data
    ) {

    init {
        setAdapterAnimation(SettingUtil.getListMode())
    }

    override fun convert(holder: BaseViewHolder, item: VideoResponse) {
        item.run {

            holder.setText(R.id.item_video_list_name, videoName)
            holder.setText(R.id.item_video_lsit_watch, context.getString(R.string.video_watch_text, likeCount))
            when (finish) {
                1 -> {
                    holder.setText(R.id.item_video_list_episodes,  context.getString(R.string.video_finish_text, count))
                }
                0 -> {
                    holder.setText(R.id.item_video_list_episodes,  context.getString(R.string.video_update_text, count))
                }
            }
            Glide.with(context).load("${videoUrl}/cover.png")
                .transition(DrawableTransitionOptions.withCrossFade(500))
                .into(holder.getView(R.id.item_video_list_imageview))
        }
    }
}


