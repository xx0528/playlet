package com.smallplay.playlet.ui.adapter

import android.text.TextUtils
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseDelegateMultiAdapter
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.delegate.BaseMultiTypeDelegate
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.app.weight.customview.CollectView
import com.smallplay.playlet.data.model.bean.CollectResponse
import com.smallplay.playlet.data.model.bean.LocalLikeVideos
import com.smallplay.playlet.data.model.bean.VideoResponse
import me.hgj.jetpackmvvm.ext.util.toHtml

class MeLikeVideosAdapter(data: MutableList<LocalLikeVideos>?) :
    BaseQuickAdapter<LocalLikeVideos, BaseViewHolder>(
        R.layout.item_me_like_video, data
    ) {

    override fun convert(holder: BaseViewHolder, item: LocalLikeVideos) {

                //项目布局的赋值
                item.run {
                    holder.setText(R.id.item_me_like_video_title, videoName)
                    holder.setText(R.id.item_me_like_video_episodes, "您看到了第${episode}集")

                    Glide.with(context).load(imgUrl)
                        .transition(DrawableTransitionOptions.withCrossFade(500))
                        .into(holder.getView(R.id.item_project_imageview))
                }

    }
}


