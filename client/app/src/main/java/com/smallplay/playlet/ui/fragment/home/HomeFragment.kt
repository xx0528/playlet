package com.smallplay.playlet.ui.fragment.home

import android.os.Bundle
import android.view.LayoutInflater
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import com.zhpan.bannerview.BannerViewPager
import kotlinx.android.synthetic.main.include_list.*
import kotlinx.android.synthetic.main.include_recyclerview.*
import kotlinx.android.synthetic.main.include_toolbar.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.util.StatusBarUtil
import com.smallplay.playlet.app.weight.banner.HomeBannerAdapter
import com.smallplay.playlet.app.weight.banner.HomeBannerViewHolder
import com.smallplay.playlet.app.weight.recyclerview.DefineLoadMoreView
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.data.model.bean.BannerResponse
import com.smallplay.playlet.data.model.bean.CollectBus
import com.smallplay.playlet.databinding.FragmentHomeBinding
import com.smallplay.playlet.ui.adapter.AriticleAdapter
import com.smallplay.playlet.ui.adapter.VideoAdapter
import com.smallplay.playlet.viewmodel.request.RequestCollectViewModel
import com.smallplay.playlet.viewmodel.request.RequestHomeViewModel
import com.smallplay.playlet.viewmodel.request.RequestVideoViewModel
import com.smallplay.playlet.viewmodel.state.HomeViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState

/**
 * 描述　:
 */
class HomeFragment : BaseFragment1<HomeViewModel, FragmentHomeBinding>() {

    //适配器
    private val videoAdapter: VideoAdapter by lazy { VideoAdapter(arrayListOf()) }
    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //recyclerview的底部加载view 因为在首页要动态改变他的颜色，所以加了他这个字段
    private lateinit var footView: DefineLoadMoreView

    //请求ViewModel
    private val requestVideoViewModel: RequestVideoViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        //状态页配置
        loadsir = loadServiceInit(mViewBind.includeList.includeRecyclerview.swipeRefresh) {
            //点击重试时触发的操作
            loadsir.showLoading()
            requestVideoViewModel.getVideoData(true)
        }

        //初始化recyclerView
        mViewBind.includeList.includeRecyclerview.recyclerView.init(GridLayoutManager(context ,2), videoAdapter).let {
            //因为首页要添加轮播图，所以我设置了firstNeedTop字段为false,即第一条数据不需要设置间距
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
            footView = it.initFooter(SwipeRecyclerView.LoadMoreListener {
                requestVideoViewModel.getVideoData(false)
            })
        }
        //初始化 SwipeRefreshLayout
        mViewBind.includeList.includeRecyclerview.swipeRefresh.init {
            //触发刷新监听时请求数据
            requestVideoViewModel.getVideoData(true)
        }
    }

    /**
     * 懒加载
     */
    override fun lazyLoadData() {
        //设置界面 加载中
        loadsir.showLoading()
        //请求视频列表数据
        requestVideoViewModel.getVideoData(true)
    }

    override fun createObserver() {
        requestVideoViewModel.run {
            //监听首页视频列表请求的数据变化
            videoDataState.observe(viewLifecycleOwner, Observer {
                //设值 新写了个拓展函数，搞死了这个恶心的重复代码
                loadListData(it, videoAdapter, loadsir, mViewBind.includeList.includeRecyclerview.recyclerView, mViewBind.includeList.includeRecyclerview.swipeRefresh)
            })
        }
        appViewModel.run {
            //监听账户信息是否改变 有值时(登录)将相关的数据设置为已收藏，为空时(退出登录)，将已收藏的数据变为未收藏
            userInfo.observeInFragment(this@HomeFragment, Observer {
                if (it != null) {
                    it.collectIds.forEach { id ->
                        for (item in videoAdapter.data) {
//                            if (id.toInt() == item.id) {
//                                item.collect = true
//                                break
//                            }
                        }
                    }
                } else {
                    for (item in videoAdapter.data) {
//                        item.collect = false
                    }
                }
                videoAdapter.notifyDataSetChanged()
            })
            //监听全局的主题颜色改变
            appColor.observeInFragment(this@HomeFragment) {
                setUiTheme(it, mViewBind.includeList.includeRecyclerview.swipeRefresh, loadsir, footView)
            }
            //监听全局的列表动画改变
            appAnimation.observeInFragment(this@HomeFragment) {
                videoAdapter.setAdapterAnimation(it)
            }
            //监听全局的收藏信息 收藏的Id跟本列表的数据id匹配则需要更新
            eventViewModel.collectEvent.observeInFragment(this@HomeFragment) {
                for (index in videoAdapter.data.indices) {
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