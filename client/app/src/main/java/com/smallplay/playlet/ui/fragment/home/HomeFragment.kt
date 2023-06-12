package com.smallplay.playlet.ui.fragment.home

import android.os.Bundle
import android.util.Log
import androidx.activity.OnBackPressedCallback
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.DefineLoadMoreView
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.activity.EpisodesDialog
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.ui.video.OnViewPagerListener
import com.smallplay.playlet.ui.video.ViewPagerLayoutManager
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import kotlinx.android.synthetic.main.fragment_main.*


/**
 * 描述　:
 */
open class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private val videoHomeAdapter: VideoHomeAdapter by lazy { VideoHomeAdapter(arrayListOf()) }

    //recyclerview的底部加载view 因为在首页要动态改变他的颜色，所以加了他这个字段
    private lateinit var footView: DefineLoadMoreView

    private var mCurPos = 0

    private var mLayoutManager: ViewPagerLayoutManager? = null

    override fun initView(savedInstanceState: Bundle?) {

        //初始化recyclerView
        mLayoutManager = ViewPagerLayoutManager(context, LinearLayoutManager.VERTICAL)
        mViewBind.recyclerView.init(mLayoutManager!!, videoHomeAdapter).let {
            //因为首页要添加轮播图，所以我设置了firstNeedTop字段为false,即第一条数据不需要设置间距
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
        }

        mLayoutManager!!.setOnViewPagerListener(object : OnViewPagerListener {
            override fun onInitComplete() {
                //自动播放第index条
                startPlay(mCurPos)
            }

            override fun onPageRelease(isNext: Boolean, position: Int) {
                if (mCurPos == position) {
                    videoHomeAdapter.release()
                }
            }

            override fun onPageSelected(position: Int, isBottom: Boolean) {
                Log.d("pageSelect -- ", "第${position}个 curPos $mCurPos")
                if (mCurPos == position) return

                startPlay(position)
            }

        })
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
        //请求视频列表数据 第一次要去请求下
        appViewModel.getVideoData(true)

        videoHomeAdapter.initVideo()

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
            videoHomeDataState.observe(viewLifecycleOwner, Observer {
                videoHomeAdapter.setList(it.listData)
            })
//
            curPlayVideoNo.observe(viewLifecycleOwner, Observer {
                //定为到要预览的位置
                if (null != mLayoutManager) {
                    mLayoutManager?.onReset()
                    mViewBind.recyclerView.scrollToPosition(it)
                }
            })
            appViewModel.dialogVisible.observeInFragment(this@HomeFragment, Observer {
                if (it == 1) {
                    val dialog = EpisodesDialog()
                    dialog.show(childFragmentManager, "EpisodesDialog")
                }
            })
        }
    }

    private fun startPlay(position: Int) {
//        mViewBind.recyclerView.scrollToPosition(position)
        videoHomeAdapter.playVideo(position, mViewBind.recyclerView)
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