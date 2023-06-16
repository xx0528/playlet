package com.smallplay.playlet.ui.adapter

import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.data.model.bean.LocalLikeVideos

class MeLikeVideosAdapter(data: MutableList<LocalLikeVideos>?) :
    BaseQuickAdapter<LocalLikeVideos, BaseViewHolder>(
        R.layout.item_me_like_video, data
    ) {

    override fun convert(holder: BaseViewHolder, item: LocalLikeVideos) {

                //项目布局的赋值
                item.run {
                    holder.setText(R.id.item_me_like_video_title, videoName)
                    holder.setText(R.id.item_me_like_video_episodes, String.format(context.getString(R.string.text_me_item_episode), episode+1))

                    Glide.with(context).load(imgUrl)
                        .transition(DrawableTransitionOptions.withCrossFade(500))
                        .into(holder.getView(R.id.item_me_like_imageview))
                }

    }
}


