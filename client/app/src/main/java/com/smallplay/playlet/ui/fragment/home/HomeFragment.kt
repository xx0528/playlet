package com.smallplay.playlet.ui.fragment.home

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewParent
import android.widget.FrameLayout
import androidx.lifecycle.Observer
import androidx.viewpager.widget.ViewPager.SimpleOnPageChangeListener
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.activity.EpisodesDialog
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.VerticalViewPager
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.ui.video.render.VideoController
import com.smallplay.playlet.ui.video.render.VideoRenderViewFactory
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import kotlinx.android.synthetic.main.fragment_home.*
import xyz.doikki.videoplayer.player.VideoView
import xyz.doikki.videoplayer.util.L


/**
 * 描述　:
 */
class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private var videoHomeAdapter: VideoHomeAdapter? = null
    private var mPreloadManager: PreloadManager? = null
    private var mController: VideoController? = null
    private var mVideoView: VideoView? = null
    private var mCurPos: Int = 0
    private var mEpisodeDialog: EpisodesDialog? = null

    override fun initView(savedInstanceState: Bundle?) {

        initViewPager()
        initVideoView()

        mPreloadManager = context?.let { PreloadManager.getInstance(it) }
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
        //请求视频列表数据 第一次要去请求下
        appViewModel.getVideoData(true)
    }

    override fun createObserver() {
        appViewModel.run {

            //监听首页视频列表请求的数据变化
            videoHomeDataState.observe(viewLifecycleOwner, Observer {
                vvp.adapter = null
                videoHomeAdapter = VideoHomeAdapter(it.listData)
                initViewPager()
            })
//
            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                //定为到要预览的位置
                if (mEpisodeDialog != null) {
                    mEpisodeDialog?.dismiss()
                    mEpisodeDialog = null
                }
                vvp.currentItem = it
                videoHomeAdapter?.notifyDataSetChanged()
                vvp.post(Runnable { startPlay(it) })
            })
            appViewModel.dialogVisible.observeInFragment(this@HomeFragment, Observer {
                if (it == 1) {
                    mEpisodeDialog = EpisodesDialog()
                    mEpisodeDialog?.show(childFragmentManager, "EpisodesDialog")
                }
            })
        }
    }


    private fun initVideoView() {
        mVideoView = context?.let { VideoView(it) }
        mVideoView!!.setLooping(true)

        //以下只能二选一，看你的需求
        mVideoView!!.setRenderViewFactory(VideoRenderViewFactory.create())
        //        mVideoView.setScreenScaleType(VideoView.SCREEN_SCALE_CENTER_CROP);
        mController = context?.let { VideoController(it) }
        mVideoView!!.setVideoController(mController)
        mVideoView!!.parent
    }

    private fun initViewPager() {
        vvp.offscreenPageLimit = 4
        vvp.adapter = videoHomeAdapter
        vvp!!.overScrollMode = View.OVER_SCROLL_NEVER
        vvp!!.setOnPageChangeListener(object : SimpleOnPageChangeListener() {
            private var mCurItem = 0

            /**
             * VerticalViewPager是否反向滑动
             */
            private var mIsReverseScroll = false
            override fun onPageScrolled(
                position: Int,
                positionOffset: Float,
                positionOffsetPixels: Int
            ) {
                super.onPageScrolled(position, positionOffset, positionOffsetPixels)
                if (position == mCurItem) {
                    return
                }
                mIsReverseScroll = position < mCurItem
            }

            override fun onPageSelected(position: Int) {
                super.onPageSelected(position)
                if (position == mCurPos) return
                startPlay(position)
            }

            override fun onPageScrollStateChanged(state: Int) {
                super.onPageScrollStateChanged(state)
                if (state == VerticalViewPager.SCROLL_STATE_DRAGGING) {
                    mCurItem = vvp!!.currentItem
                }
                if (state == VerticalViewPager.SCROLL_STATE_IDLE) {
                    mPreloadManager!!.resumePreload(mCurPos, mIsReverseScroll)
                } else {
                    mPreloadManager!!.pausePreload(mCurPos, mIsReverseScroll)
                }
            }
        })
    }

    open fun startPlay(position: Int) {
        val count = vvp!!.childCount
        for (i in 0 until count) {
            val itemView = vvp!!.getChildAt(i)
            val viewHolder: VideoHomeAdapter.ViewHolder = itemView.tag as VideoHomeAdapter.ViewHolder
            if (viewHolder.mPosition === position) {
                mVideoView?.release()
                if (mVideoView != null && mVideoView!!.parent != null) {
                    val parent: ViewParent = mVideoView!!.parent
                    if (parent is FrameLayout) {
                        parent.removeView(mVideoView)
                    }
                }

                val videoBean: VideoResponse? = appViewModel.videoHomeDataState.value?.listData?.get(position)
                if (videoBean != null) {
                    val playUrl = mPreloadManager!!.getPlayUrl(videoBean.videoUrl)
                    L.i("startPlay: position: $position  url: $playUrl")
                    mVideoView?.setUrl(playUrl)
                    //请点进去看isDissociate的解释
                    mController!!.addControlComponent(viewHolder.mVideoItemView, true)
                    viewHolder.mPlayerContainer.addView(mVideoView, 0)
                    mVideoView?.start()
                    mCurPos = position
                }
                break
            }
        }
    }


    override fun onResume() {
        super.onResume()
        if (mVideoView != null) {
            mVideoView!!.resume()
        }
    }


    override fun onPause() {
        super.onPause()
        if (mVideoView != null) {
            mVideoView!!.pause()
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        if (mVideoView != null) {
            mVideoView!!.release()
        }
    }

    open fun onBackPressed() {
        if (mVideoView == null || !mVideoView!!.onBackPressed()) {
//            super.onBackPressed()
        }
    }
}