package com.smallplay.playlet.ui.adapter

import android.widget.ImageView
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseQuickAdapter
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.google.gson.Gson
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil

class VideoParkAdapter(data: MutableList<VideoResponse>?) :
    BaseQuickAdapter<VideoResponse, BaseViewHolder>(
        R.layout.item_park_video, data
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

            var likeIcon = holder.getView<ImageView>(R.id.item_park_like_icon)
            likeIcon.setOnClickListener{
                appViewModel.likeVideo(ID)
            }
            val likeVideos = Gson().fromJson(appViewModel.likeVideos.value ?: "", Map::class.java)
            if (likeVideos != null) {
                var episode = (likeVideos[ID.toString()] as? Double)?.toInt()
                if (episode != null && episode >= 1) {
                    likeIcon.setImageResource(R.mipmap.ic_shoucangxiao2)

                } else {
                    likeIcon.setImageResource(R.mipmap.ic_shoucangxiao)
                }
            }
        }
    }

    fun setLikeVideo(likeVideosStr : String) {
        val likeVideos =
            Gson().fromJson(likeVideosStr, Map::class.java) ?: return
        for (i in 0 until itemCount) {
            var likeIcon = getViewByPosition(i, R.id.item_park_like_icon) as ImageView
            var item = getItem(i)
            var episode = (likeVideos[item.ID.toString()] as? Double)?.toInt()
            if (episode != null && episode >= 1) {
                likeIcon.setImageResource(R.mipmap.ic_shoucangxiao2)

            } else {
                likeIcon.setImageResource(R.mipmap.ic_shoucangxiao)
            }
        }
    }
}


