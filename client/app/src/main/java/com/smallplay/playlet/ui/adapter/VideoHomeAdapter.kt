package com.smallplay.playlet.ui.adapter

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.viewpager.widget.PagerAdapter
import com.bumptech.glide.Glide
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.ui.video.render.VideoItemView
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction

class VideoHomeAdapter(
    /**
     * 数据源
     */
    private var mVideoBeans: List<VideoResponse>?
) :
    PagerAdapter() {
    /**
     * View缓存池，从ViewPager中移除的item将会存到这里面，用来复用
     */
    private val mViewPool: MutableList<View> = ArrayList()

    private val TAG = "VideoHomeAdapter------==== "

    fun setList(videoBeans: List<VideoResponse>?) {
        mVideoBeans = videoBeans
    }

    override fun getCount(): Int {
        return if (mVideoBeans == null) 0 else mVideoBeans!!.size
    }

    override fun isViewFromObject(view: View, o: Any): Boolean {
        return view === o
    }

    override fun instantiateItem(container: ViewGroup, position: Int): Any {
        val context = container.context
        var view: View? = null
        if (mViewPool.size > 0) { //取第一个进行复用
            view = mViewPool[0]
            mViewPool.removeAt(0)
        }
        val viewHolder: ViewHolder
        if (view == null) {
            view = LayoutInflater.from(context).inflate(R.layout.item_home_video, container, false)
            viewHolder = ViewHolder(view)
        } else {
            viewHolder = view.tag as ViewHolder
        }
        val (_, videoName, _, _, _, _, _, _, _, imgUrl, videoUrl) = mVideoBeans!![position]
        //开始预加载
        PreloadManager.getInstance(context)!!.addPreloadTask(videoUrl, position)
        Glide.with(context)
            .load(imgUrl)
            .placeholder(android.R.color.white)
            .into(viewHolder.mThumb)
        viewHolder.mTitle.text = videoName
        viewHolder.mBtnChange.setOnClickListener {
            appViewModel.setNextVideo()
        }
        viewHolder.mCurEpisode.text = "第${position + 1}集"
        viewHolder.mAllEpisode.text = "共${count}集"
        viewHolder.mPosition = position
        viewHolder.mBtnOpenDialog.setOnClickListener{
            appViewModel.dialogVisible.value = 1
        }
        Log.d(TAG, "初始化------ $videoName  第 $position 集")
        container.addView(view)
        return view!!
    }

    override fun destroyItem(container: ViewGroup, position: Int, `object`: Any) {
        val itemView = `object` as View
        container.removeView(itemView)
        val (_, _, _, _, _, _, _, _, _, _, videoUrl) = mVideoBeans!![position]
        //取消预加载
        PreloadManager.getInstance(container.context)!!.removePreloadTask(videoUrl)
        //保存起来用来复用
        mViewPool.add(itemView)
    }

    /**
     * 借鉴ListView item复用方法
     */
    class ViewHolder internal constructor(itemView: View?) {
        var mPosition = 0
        var mTitle : TextView//标题
        var mThumb : ImageView //封面图
        var mCurEpisode: TextView //第几集
        var mAllEpisode: TextView //共几集
        var mBtnOpenDialog: View    //
        var mVideoItemView: VideoItemView
        var mPlayerContainer: FrameLayout
        var mBtnChange: Button

        init {
            mVideoItemView = itemView!!.findViewById(R.id.home_video_View)
            mTitle = mVideoItemView.findViewById(R.id.tv_title)
            mThumb = mVideoItemView.findViewById(R.id.iv_thumb)
            mAllEpisode = mVideoItemView.findViewById(R.id.episode_text)
            mCurEpisode = mVideoItemView.findViewById(R.id.tv_cur_episodes)
            mPlayerContainer = itemView.findViewById(R.id.home_video_container)
            mBtnOpenDialog = itemView.findViewById(R.id.btn_episode)
            mBtnChange = itemView.findViewById(R.id.btn_change)
            itemView.tag = this
        }
    }
}


