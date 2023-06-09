package com.smallplay.playlet.ui.fragment.home

import android.content.Intent.getIntent
import android.os.Bundle
import androidx.lifecycle.Observer
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.util.videoCache.PreloadManager
import com.smallplay.playlet.app.weight.recyclerview.DefineLoadMoreView
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.adapter.VideoHomeAdapter
import com.smallplay.playlet.viewmodel.state.HomeViewModel

/**
 * 描述　:
 */
class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private val videoHomeAdapter: VideoHomeAdapter by lazy { VideoHomeAdapter(arrayListOf()) }
    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //recyclerview的底部加载view 因为在首页要动态改变他的颜色，所以加了他这个字段
    private lateinit var footView: DefineLoadMoreView

    override fun initView(savedInstanceState: Bundle?) {
        //状态页配置
        loadsir = loadServiceInit(mViewBind.homeSwipe) {
            //点击重试时触发的操作
            loadsir.showLoading()
            appViewModel.getVideoData(true)
        }

        initViewPager()
        initVideoView()
        mPreloadManager = PreloadManager.getInstance(this)

        mViewBind.homeViewpage2.post(Runnable {
            if (index == 0) {
                startPlay(0)
            } else {
                mViewPager.setCurrentItem(index, false)
            }
        })

        //初始化 SwipeRefreshLayout
        mViewBind.homeSwipe.init {
            //触发刷新监听时请求数据
            appViewModel.getVideoData(true)
        }
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
        //设置界面 加载中
        loadsir.showLoading()
        //请求视频列表数据
        appViewModel.getVideoData(true)
    }

    override fun createObserver() {
        appViewModel.run {
            //监听首页视频列表请求的数据变化
            videoDataState.observe(viewLifecycleOwner, Observer {
                //设值 新写了个拓展函数，搞死了这个恶心的重复代码
                loadListData(it, videoHomeAdapter, loadsir, mViewBind.includeList.includeRecyclerview.recyclerView, mViewBind.homeSwipe)
            })

            //监听账户信息是否改变 有值时(登录)将相关的数据设置为已收藏，为空时(退出登录)，将已收藏的数据变为未收藏
            userInfo.observeInFragment(this@HomeFragment, Observer {
                if (it != null) {
                    it.collectIds.forEach { id ->
                        for (item in videoHomeAdapter.data) {
//                            if (id.toInt() == item.id) {
//                                item.collect = true
//                                break
//                            }
                        }
                    }
                } else {
                    for (item in videoHomeAdapter.data) {
//                        item.collect = false
                    }
                }
                videoHomeAdapter.notifyDataSetChanged()
            })
            //监听全局的主题颜色改变
            appColor.observeInFragment(this@HomeFragment) {
                setUiTheme(it, mViewBind.homeSwipe, loadsir, footView)
            }
            //监听全局的列表动画改变
            appAnimation.observeInFragment(this@HomeFragment) {
                videoHomeAdapter.setAdapterAnimation(it)
            }
            //监听全局的收藏信息 收藏的Id跟本列表的数据id匹配则需要更新
            eventViewModel.collectEvent.observeInFragment(this@HomeFragment) {
                for (index in videoHomeAdapter.data.indices) {
//                    if (videoAdapter.data[index].id == it.id) {
//                        videoAdapter.data[index].collect = it.collect
//                        videoAdapter.notifyItemChanged(index)
//                        break
//                    }
                }
            }
        }
    }
}