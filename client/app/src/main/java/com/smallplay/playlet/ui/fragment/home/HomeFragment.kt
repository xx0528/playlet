package com.smallplay.playlet.ui.fragment.home

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.ViewParent
import android.widget.FrameLayout
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.viewpager.widget.ViewPager.SimpleOnPageChangeListener
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.showMessage
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.data.model.bean.VideoResponse
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.VerticalViewPager
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.ui.video.render.VideoController
import com.smallplay.playlet.ui.video.render.VideoRenderViewFactory
import com.smallplay.playlet.viewmodel.request.RequestLoginRegisterViewModel
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState
import xyz.doikki.videoplayer.player.BaseVideoView.SimpleOnStateChangeListener
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

    private val TAG = "HomeFragment-----------"

    private val requestLoginRegisterViewModel: RequestLoginRegisterViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {

        addLoadingObserve(requestLoginRegisterViewModel)

        appViewModel.curPage.value = "HomeFragment"

        initViewPager()
        initVideoView()

        mPreloadManager = context?.let { PreloadManager.getInstance(it) }
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
//        if (CacheUtil.isFirst()) {
//            requestLoginRegisterViewModel.registerAndlogin(
//                SettingUtil.getAccountByDevice() ,
//                "GidMQhZN"
//            )
//        } else {
//            CacheUtil.getUser()
//            requestLoginRegisterViewModel.registerAndlogin(
//                SettingUtil.getAccountByDevice() ,
//                "GidMQhZN"
//            )
//        }
        var userInfo = CacheUtil.getUser()
        if (userInfo != null) {
            requestLoginRegisterViewModel.registerAndlogin(
                userInfo.userId,
                userInfo.password
            )
        } else {
            requestLoginRegisterViewModel.registerAndlogin(
                SettingUtil.getAccountByDevice() ,
                "GidMQhZN"
            )
        }

    }

    override fun createObserver() {
        requestLoginRegisterViewModel.registResult.observe(viewLifecycleOwner,Observer { resultState ->
            parseState(resultState, {
                //登录成功 通知账户数据发生改变鸟
                CacheUtil.setUser(it)
                CacheUtil.setIsLogin(true)
                if (it.phone.isNotEmpty()) {
                    CacheUtil.setIsBind(true)
                } else {
                    CacheUtil.setIsBind(false)
                }
                appViewModel.userInfo.value = it
                //登录成功 请求数据
                //请求视频列表数据 第一次要去请求下
                appViewModel.getVideoData(true, isHomePage = true)
            }, {
                //登录失败
                showMessage(it.errorMsg)
            })
        })

        appViewModel.run {

            //监听首页视频列表请求的数据变化
            videoHomeDataState.observe(viewLifecycleOwner, Observer {
                //ParkFragment跳过来默认播放第一集
                mViewBind.vvp.adapter = VideoHomeAdapter(it.listData)
                startPlay(0)
            })
//
            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                //定为到要预览的位置
                mViewBind.vvp.currentItem = it
                Log.d(TAG, "监听当前播放curPlayVideo 触发 startPlay")
                startPlay(it)
            })
            appViewModel.dialogVisible.observeInFragment(this@HomeFragment, Observer {
                if (it == 1) {
                    nav().navigateAction(R.id.action_to_playFragment, Bundle().apply {
                        putInt("curPos", mCurPos)
                    })
                }
            })

            appViewModel.likeVideos.observeInFragment(this@HomeFragment, Observer {
                val count = mViewBind.vvp.childCount
                Log.d(TAG, "count --- $count")
                for (i in 0 until count) {
                    val itemView = mViewBind.vvp!!.getChildAt(i)
                    val viewHolder: VideoHomeAdapter.ViewHolder = itemView.tag as VideoHomeAdapter.ViewHolder
                    if (viewHolder.mPosition == mCurPos) {
                        videoHomeDataState.value?.listData?.get(0)?.let { it1 ->
                            viewHolder.setLikeIcon(it1.ID)
                        }
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
        //        mVideoView.setScreenScaleType(VideoView.SCREEN_SCALE_CENTER_CROP);
        mController = context?.let { VideoController(it) }
        mVideoView!!.setVideoController(mController)
        mVideoView!!.parent

        //监听播放结束
        mVideoView!!.addOnStateChangeListener(object : SimpleOnStateChangeListener() {
            override fun onPlayStateChanged(playState: Int) {
                if (playState == VideoView.STATE_PLAYBACK_COMPLETED) {
                    Log.d(TAG, "自动播放下一条， 当前是 ${appViewModel.curPlayVideoNo.value}")
                    mCurPos++
                    nav().navigateAction(R.id.action_to_playFragment, Bundle().apply {
                        putInt("curPos", mCurPos)
                    })
                }
            }
        })
    }

    private fun initViewPager() {
        mViewBind.vvp.offscreenPageLimit = 4
        mViewBind.vvp.adapter = videoHomeAdapter
        mViewBind.vvp!!.overScrollMode = View.OVER_SCROLL_NEVER
        mViewBind.vvp!!.setOnPageChangeListener(object : SimpleOnPageChangeListener() {
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
                nav().navigateAction(R.id.action_to_playFragment, Bundle().apply {
                    putInt("curPos", mCurPos)
                })
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
        appViewModel.curPage.value = "HomeFragment"
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
    }

    override fun onDestroy() {
        Log.d(TAG, "onDestroy ---- ")
        super.onDestroy()
        if (mVideoView != null) {
            Log.d(TAG, "mVideoView!!.release ---- ")
            mVideoView!!.release()
        }
    }

    open fun onBackPressed() {
        if (mVideoView == null || !mVideoView!!.onBackPressed()) {
//            super.onBackPressed()
        }
    }
}