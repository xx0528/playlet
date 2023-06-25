package com.smallplay.playlet.ui.fragment.play

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewParent
import android.widget.FrameLayout
import androidx.activity.OnBackPressedCallback
import androidx.lifecycle.Observer
import androidx.viewpager.widget.ViewPager.SimpleOnPageChangeListener
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.jumpByBind
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.data.model.bean.LocalLikeVideos
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.databinding.FragmentPlayBinding
import com.smallplay.playlet.ui.activity.EpisodesDialog
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.VerticalViewPager
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.ui.video.render.VideoController
import com.smallplay.playlet.ui.video.render.VideoRenderViewFactory
import com.smallplay.playlet.viewmodel.state.PlayViewModel
import me.hgj.jetpackmvvm.ext.nav
import xyz.doikki.videoplayer.player.BaseVideoView.SimpleOnStateChangeListener
import xyz.doikki.videoplayer.player.VideoView
import xyz.doikki.videoplayer.util.L


/**
 * 描述　:
 */
class PlayFragment : BaseFragment1<PlayViewModel, FragmentPlayBinding>() {

    private var mPreloadManager: PreloadManager? = null
    private var mController: VideoController? = null
    private var mVideoView: VideoView? = null
    private var mCurPos: Int = 0
    private var mVideoID: Int = 0
    private var mEpisodeDialog: EpisodesDialog? = null
    private var isInit: Boolean = false

    private val TAG = "PlayFragment---------"

    override fun initView(savedInstanceState: Bundle?) {

        appViewModel.curPage.value = "PlayFragment"

        initViewPager()
        initVideoView()

        mPreloadManager = context?.let { PreloadManager.getInstance(it) }

        mCurPos = arguments?.getInt("curPos")!!
        isInit = true
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {

        requireActivity().onBackPressedDispatcher.addCallback(this,
            object : OnBackPressedCallback(true) {
                override fun handleOnBackPressed() {
                    for (i in 0 until 10) {
                        nav().navigateUp()
                    }
                }
            })
        mViewBind.vvp.currentItem = mCurPos
        appViewModel.reqPlay(mCurPos)

        if (appViewModel.dialogVisible.value == 1) {
            mEpisodeDialog = EpisodesDialog()
            mEpisodeDialog?.show(childFragmentManager, "EpisodesDialog")
        }

    }

    override fun createObserver() {
        appViewModel.run {
            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                //定为到要预览的位置
                Log.d(TAG, "监听到 播放 $it")
                if (mEpisodeDialog != null && appViewModel.dialogVisible.value == 0) {
                    mEpisodeDialog?.dismiss()
                    mEpisodeDialog = null
                }
                mViewBind.vvp.currentItem = it
                Log.d(TAG, "监听当前播放curPlayVideo 触发 startPlay")
                startPlay(it)
            })
            appViewModel.dialogVisible.observeInFragment(this@PlayFragment, Observer {
                if (it == 1 && isInit) {
                    if (mEpisodeDialog == null) {
                        mEpisodeDialog = EpisodesDialog()
                        mEpisodeDialog?.show(childFragmentManager, "EpisodesDialog")
                    } else {
                        Log.e(TAG, "已经创建了dialog")
                    }
                } else if (it == 0) {
                    if (mEpisodeDialog != null) {
                        mEpisodeDialog?.dismiss()
                        mEpisodeDialog = null
                    }
                }
            })
        }
    }


    private fun initVideoView() {
        mVideoView = context?.let { VideoView(it) }
        mVideoView!!.setLooping(false)

        //以下只能二选一，看你的需求
        mVideoView!!.setRenderViewFactory(VideoRenderViewFactory.create())
        mController = context?.let { VideoController(it) }
        mVideoView!!.setVideoController(mController)
        mVideoView!!.parent

        //监听播放结束
        mVideoView!!.addOnStateChangeListener(object : SimpleOnStateChangeListener() {
            override fun onPlayStateChanged(playState: Int) {
                if (playState == VideoView.STATE_PLAYBACK_COMPLETED) {
                    Log.d(TAG, "自动播放下一条， 当前是 ${appViewModel.curPlayVideoNo.value}")
                    var pos = appViewModel.curPlayVideoNo.value?.plus(1) ?: appViewModel.curPlayVideoNo.value!!
                    var freeCount = appViewModel.videoHomeDataState.value?.listData?.get(pos)?.freeCount
                    if (pos >= freeCount!! && !CacheUtil.isBind()) {
                        nav().jumpByBind{}
                        return
                    }
                    appViewModel.reqPlay(pos)
//                    appViewModel.curPlayVideoNo.value = appViewModel.curPlayVideoNo.value?.plus(
//                        1
//                    )
                    Log.d(TAG, "改变后是--  ${appViewModel.curPlayVideoNo.value}")
                }
            }
        })
    }

    private fun initViewPager() {
        mViewBind.vvp.offscreenPageLimit = 4
        var videoAdapter = VideoHomeAdapter(appViewModel.videoHomeDataState.value?.listData)
        videoAdapter.run {
            setBackClick { ->
                run {
                    //不知为什么dialog返不回去 这里多反几次
                    for (i in 0 until 10) {
                        nav().navigateUp()
                    }
                }
            }
        }
        mViewBind.vvp.adapter = videoAdapter
        mViewBind.vvp.overScrollMode = View.OVER_SCROLL_NEVER
        mViewBind.vvp.setOnPageChangeListener(object : SimpleOnPageChangeListener() {
            private var mCurItem = 0

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
                var freeCount = appViewModel.videoHomeDataState.value?.listData?.get(position)?.freeCount
                if (position >= freeCount!! && !CacheUtil.isBind()) {
                    nav().jumpByBind{}
                    return
                }
                appViewModel.reqPlay(position)
            }

            override fun onPageScrollStateChanged(state: Int) {
                super.onPageScrollStateChanged(state)
                Log.d(TAG, " onPageScrollStateChanged 状态变化 $state")
                if (state == VerticalViewPager.SCROLL_STATE_DRAGGING) {
                    mCurItem = mViewBind.vvp!!.currentItem
                    Log.d(TAG, "设置当前curItem ------- ")
                }
                if (state == VerticalViewPager.SCROLL_STATE_IDLE) {
                    mPreloadManager!!.resumePreload(mCurPos, mIsReverseScroll)
                } else {
                    mPreloadManager!!.pausePreload(mCurPos, mIsReverseScroll)
                }
            }
        })
    }

    private fun startPlay(position: Int) {
        val count = mViewBind.vvp!!.childCount
        Log.d(TAG, " startPlay 播放--position $position")
        for (i in 0 until count) {
            val itemView = mViewBind.vvp!!.getChildAt(i)
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
                    Log.d(TAG, "获取到的 position = $position  videoBean 的 videoName = ${videoBean.videoName} videoUrl = ${videoBean.videoUrl}")

                    val playUrl = mPreloadManager!!.getPlayUrl(videoBean.videoUrl)
                    L.i("startPlay: position: $position  url: $playUrl")
                    mVideoView?.setUrl(playUrl)
                    //请点进去看isDissociate的解释
                    mController!!.addControlComponent(viewHolder.mVideoItemView, true)
                    viewHolder.mPlayerContainer.addView(mVideoView, 0)

                    mController!!.setCurProgress(appViewModel.curPlayVideoTime.value!!)

                    mVideoView?.start()
                    mCurPos = position
                    Log.d(TAG, "设置当前播放位置${mCurPos}")
                }
                break
            }
        }
    }


    override fun onResume() {
        super.onResume()

        appViewModel.curPage.value = "PlayFragment"
        Log.d(TAG, "onResume ---- ")
        if (mVideoView != null) {
            Log.d(TAG, "mVideoView!!.resume ---- ")
            mVideoView!!.resume()
        }
    }


    override fun onPause() {
        super.onPause()
        Log.d(TAG, "onPause ---- ")
        if (mVideoView != null) {
            Log.d(TAG, "mVideoView!!.pause ---- ")
            mVideoView!!.pause()
        }
        //暂停时记录进度
        if (appViewModel.videoHomeDataState.value != null && mController != null && appViewModel.curPlayVideoNo.value != null) {
            var curVideo = appViewModel.videoHomeDataState.value!!.listData[appViewModel.curPlayVideoNo.value!!]
            if (curVideo != null) {
                curVideo.run {
                    var video : LocalLikeVideos = LocalLikeVideos(
                        ID,
                        videoName,
                        videoType,
                        typeName,
                        videoDesc,
                        finish,
                        count,
                        mCurPos,
                        mController!!.getVideoDuration(),
                        imgUrl,
                        videoUrl
                    )
                    appViewModel.saveLocalVideos(video)
                }
            }
        }

    }

    override fun onDestroy() {
        Log.d(TAG, "onDestroy ---- ")
        super.onDestroy()
        if (mVideoView != null) {
            Log.d(TAG, "mVideoView!!.release ---- ")
            mVideoView!!.release()
        }
        //换一个 不然HomeFragment会有问题
        appViewModel.setNextVideo()
    }

    fun onBackPressed() {
        if (mVideoView == null || !mVideoView!!.onBackPressed()) {
//            super.onBackPressed()
        }
    }
}