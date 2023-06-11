package com.smallplay.playlet.ui.adapter

import android.view.View
import android.view.ViewParent
import android.widget.Button
import android.widget.FrameLayout
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.ui.video.render.VideoController
import com.smallplay.playlet.ui.video.render.VideoItemView
import com.smallplay.playlet.ui.video.render.VideoRenderViewFactory
import me.hgj.jetpackmvvm.base.appContext
import xyz.doikki.videoplayer.player.VideoView


class VideoHomeAdapter(data: MutableList<VideoResponse>?) :
    BaseQuickAdapter<VideoResponse, BaseViewHolder>(
        R.layout.item_home_video, data
    ) {

    private var mVideoView: VideoView? = null
    private var mController: VideoController? = null


    init {
        setAdapterAnimation(SettingUtil.getListMode())
    }

    fun initVideo() {
        //init video
        mVideoView = VideoView(appContext)
        mVideoView?.setRenderViewFactory(VideoRenderViewFactory.create())
        mVideoView?.setLooping(true)
        mController = VideoController(appContext)
        mVideoView?.setVideoController(mController)

    }

    override fun convert(holder: BaseViewHolder, item: VideoResponse) {
        var pos = getItemPosition(item)
        item.run {

            //iv_thumb 和 tv_title 是layout_video_controller里的 不是item_home_video
            PreloadManager.getInstance(appContext)?.addPreloadTask(videoUrl, pos)
            Glide.with(appContext).load(imgUrl)
                .transition(DrawableTransitionOptions.withCrossFade(100))
                .placeholder(android.R.color.white)
                .into(holder.getView(R.id.iv_thumb))

            holder.setText(R.id.tv_title, videoName)
            holder.setText(R.id.tv_cur_episodes, "第${pos}集")
            holder.getView<FrameLayout>(R.id.home_video_container).tag = holder
        }

        holder.getView<View>(R.id.btn_episode).setOnClickListener {
            appViewModel.dialogVisible.value = 1
        }
    }

    fun playVideo(position : Int, recyclerView: RecyclerView) {

        val itemView = recyclerView.getChildAt(0)
        val viewHolder: BaseViewHolder = itemView.tag as BaseViewHolder

        mVideoView!!.release()
        if ( mVideoView != null) {
            val parent: ViewParent? = mVideoView?.parent
            if (parent is FrameLayout) {
                parent.removeView(mVideoView)
            }
        }
        var item = getItem(position)
        val playUrl: String? = PreloadManager.getInstance(appContext)?.getPlayUrl(item.videoUrl)
        mVideoView!!.setUrl(playUrl)
        //请点进去看isDissociate的解释
        //请点进去看isDissociate的解释
        mController!!.addControlComponent(viewHolder.getView<VideoItemView>(R.id.park_video_View), true)
        viewHolder.getView<FrameLayout>(R.id.home_video_container).addView(mVideoView, 0)
        mVideoView!!.start()

    }

    fun resume() {
        mVideoView?.resume()
    }

    fun pause() {
        mVideoView?.pause()
    }

    fun release() {
        mVideoView?.release()
    }

    fun onBackPressed() {
        mVideoView?.onBackPressed()
    }
}


