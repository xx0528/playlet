package com.smallplay.playlet.ui.fragment.home

import android.R
import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import androidx.activity.OnBackPressedCallback
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.DefineLoadMoreView
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.OnViewPagerListener
import com.smallplay.playlet.ui.video.ViewPagerLayoutManager
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import com.yanzhenjie.recyclerview.SwipeRecyclerView


/**
 * 描述　:
 */
open class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private val videoHomeAdapter: VideoHomeAdapter by lazy { VideoHomeAdapter(arrayListOf()) }
    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //recyclerview的底部加载view 因为在首页要动态改变他的颜色，所以加了他这个字段
    private lateinit var footView: DefineLoadMoreView

    private var mCurPos = 0
    private var mPosition = 0 //准备待播放的角标位置

    private var mLayoutManager: ViewPagerLayoutManager? = null

    override fun initView(savedInstanceState: Bundle?) {

        //状态页配置
        loadsir = loadServiceInit(mViewBind.includeList.includeRecyclerview.swipeRefresh) {
            //点击重试时触发的操作
            loadsir.showLoading()
            appViewModel.getVideoData(true)
        }

        //初始化recyclerView
        mLayoutManager = ViewPagerLayoutManager(context, LinearLayoutManager.VERTICAL)
        mViewBind.includeList.includeRecyclerview.recyclerView.init(mLayoutManager!!, videoHomeAdapter).let {
            //因为首页要添加轮播图，所以我设置了firstNeedTop字段为false,即第一条数据不需要设置间距
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
            footView = it.initFooter(SwipeRecyclerView.LoadMoreListener {
                appViewModel.getVideoData(false)
            })
        }
        //初始化 SwipeRefreshLayout
        mViewBind.includeList.includeRecyclerview.swipeRefresh.init {
            //触发刷新监听时请求数据
            appViewModel.getVideoData(true)
        }

        videoHomeAdapter.initVideo()

        mLayoutManager!!.setOnViewPagerListener(object : OnViewPagerListener {
            override fun onInitComplete() {
                startPlay(0)
            }

            /**
             * @param view 当前正在被释放的itemView
             * @param isNext 是否还有下一条视频 true:有 false:没有
             * @param position 当前被释放的item位置
             */
            override fun onPageRelease(view: View?, isNext: Boolean, position: Int) {
                Log.d(
                    "homefragment",
                    "onPageRelease-->isNext:$isNext,position:$position,mPosition:$mPosition"
                )
                if (view != null) {
                    if (mCurPos == position) {
                        videoHomeAdapter.release()
                    }
                }
            }

            /**
             * @param view 当前选中的itemView
             * @param position 当前选中的item位置
             * @param isBottom 是否滑动到底部 true:当前position已经到<=(最后一条数据-2)的位置了,在这里加载更多数据 flase:否
             */
            override fun onPageSelected(view: View?, position: Int, isBottom: Boolean) {
                Log.d(
                    "homefragment",
                    "onPageSelected-->position:$position,isBottom:$isBottom,mPosition:$mPosition"
                )
                this@HomeFragment.mPosition = position
                startPlay(mPosition)
                if (isBottom) { //是否要加载更多了,滑动到最后两条数据时触发加载更多
                    appViewModel.getVideoData(false)
                }
            }
        })
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
                loadListData(it, videoHomeAdapter, loadsir, mViewBind.includeList.includeRecyclerview.recyclerView, mViewBind.includeList.includeRecyclerview.swipeRefresh)
            })
//
            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                startPlay(it)
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