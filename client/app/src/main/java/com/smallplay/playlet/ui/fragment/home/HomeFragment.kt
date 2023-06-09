package com.smallplay.playlet.ui.fragment.home

import android.os.Bundle
import android.view.View
import androidx.activity.OnBackPressedCallback
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.RecyclerView
import androidx.viewpager2.widget.ViewPager2
import androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.util.StatusBarUtil
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.cache.PreloadManager
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import me.hgj.jetpackmvvm.base.appContext

/**
 * 描述　:
 */
open class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private val videoHomeAdapter: VideoHomeAdapter by lazy { VideoHomeAdapter(arrayListOf()) }
    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    private var mCurPos = 0

    private var mViewPagerImpl: RecyclerView? = null

    override fun initView(savedInstanceState: Bundle?) {

        //init ViewPage2
        mViewBind.homeViewpage2.offscreenPageLimit = 4
        mViewBind.homeViewpage2.adapter = videoHomeAdapter
        mViewBind.homeViewpage2.overScrollMode = View.OVER_SCROLL_NEVER
        mViewBind.homeViewpage2.registerOnPageChangeCallback(object : OnPageChangeCallback() {
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
                mViewBind.homeViewpage2.post(Runnable { startPlay(position) })
            }

            override fun onPageScrollStateChanged(state: Int) {
                super.onPageScrollStateChanged(state)
                if (state == ViewPager2.SCROLL_STATE_DRAGGING) {
                    mCurItem = mViewBind.homeViewpage2.currentItem
                }
                if (state == ViewPager2.SCROLL_STATE_IDLE) {
                    PreloadManager.getInstance(appContext)?.resumePreload(mCurPos, mIsReverseScroll)
                } else {
                    PreloadManager.getInstance(appContext)?.pausePreload(mCurPos, mIsReverseScroll)
                }
            }
        })

        //ViewPage2内部是通过RecyclerView去实现的，它位于ViewPager2的第0个位置
        mViewPagerImpl = mViewBind.homeViewpage2.getChildAt(0) as RecyclerView

        videoHomeAdapter.initVideo()
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
        //请求视频列表数据
        appViewModel.getVideoData(true)


        requireActivity().onBackPressedDispatcher.addCallback(this,
            object : OnBackPressedCallback(true) {
                override fun handleOnBackPressed() {
                    videoHomeAdapter.onBackPressed()
                }
            })
    }

    override fun createObserver() {
        appViewModel.run {
            //监听首页视频列表请求的数据变化
            videoDataState.observe(viewLifecycleOwner, Observer {

                //设值 新写了个拓展函数，搞死了这个恶心的重复代码
//                loadListData(it, videoHomeAdapter, loadsir, mViewBind.homeViewpage2, mViewBind.homeSwipe)
//                swipeRefreshLayout.isRefreshing = false
                if (it.isSuccess) {
                    //成功
                    when {
                        //第一页并没有数据 显示空布局界面
                        it.isFirstEmpty -> {
//                            loadService.showEmpty()
                        }
                        //是第一页
                        it.isRefresh -> {
                            videoHomeAdapter.setList(it.listData)
//                            loadService.showSuccess()
                        }
                        //不是第一页
                        else -> {
                            videoHomeAdapter.addData(it.listData)
//                            loadService.showSuccess()
                        }
                    }
                } else {
                    //失败
                    if (it.isRefresh) {
                        //如果是第一页，则显示错误界面，并提示错误信息
//                        loadService.showError(it.errMessage)
                    } else {
//                        recyclerView.loadMoreError(0, it.errMessage)
                    }
                }
            })

            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                mViewBind.homeViewpage2.post(Runnable {
                    if (it == 0) {
                        startPlay(it)
                    } else {
                        mViewBind.homeViewpage2.setCurrentItem(it, false)
                    }
                })
            })
        }
    }

    private fun startPlay(position: Int) {
        videoHomeAdapter.playVideo(position)
        mCurPos = position
    }

    override fun onResume() {
        super.onResume()
        videoHomeAdapter.resume()
    }


    override fun onPause() {
        super.onPause()
        videoHomeAdapter.pause()
    }

    override fun onDestroy() {
        super.onDestroy()
        videoHomeAdapter.release()
    }
}