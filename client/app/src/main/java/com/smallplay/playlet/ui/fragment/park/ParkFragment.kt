package com.smallplay.playlet.ui.fragment.park

import android.os.Bundle
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.GridLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.DefineLoadMoreView
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.FragmentParkBinding
import com.smallplay.playlet.ui.adapter.VideoParkAdapter
import com.smallplay.playlet.viewmodel.state.ParkViewModel
import com.yanzhenjie.recyclerview.SwipeRecyclerView


/**
 * 描述　:
 */
class ParkFragment : BaseFragment1<ParkViewModel, FragmentParkBinding>() {

    //适配器
    private val videoParkAdapter: VideoParkAdapter by lazy { VideoParkAdapter(arrayListOf()) }
    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //recyclerview的底部加载view 因为在首页要动态改变他的颜色，所以加了他这个字段
    private lateinit var footView: DefineLoadMoreView

    override fun initView(savedInstanceState: Bundle?) {
        //状态页配置
        loadsir = loadServiceInit(mViewBind.includeList.includeRecyclerview.swipeRefresh) {
            //点击重试时触发的操作
            loadsir.showLoading()
            appViewModel.getVideoData(true)
        }

        //初始化recyclerView
        mViewBind.includeList.includeRecyclerview.recyclerView.init(GridLayoutManager(context ,2), videoParkAdapter).let {
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
                loadListData(it, videoParkAdapter, loadsir, mViewBind.includeList.includeRecyclerview.recyclerView, mViewBind.includeList.includeRecyclerview.swipeRefresh)
            })

            //监听账户信息是否改变 有值时(登录)将相关的数据设置为已收藏，为空时(退出登录)，将已收藏的数据变为未收藏
            userInfo.observeInFragment(this@ParkFragment, Observer {
                if (it != null) {
                    it.collectIds.forEach { id ->
                        for (item in videoParkAdapter.data) {
//                            if (id.toInt() == item.id) {
//                                item.collect = true
//                                break
//                            }
                        }
                    }
                } else {
                    for (item in videoParkAdapter.data) {
//                        item.collect = false
                    }
                }
                videoParkAdapter.notifyDataSetChanged()
            })
            //监听全局的主题颜色改变
            appColor.observeInFragment(this@ParkFragment) {
                setUiTheme(it, mViewBind.includeList.includeRecyclerview.swipeRefresh, loadsir, footView)
            }
            //监听全局的列表动画改变
            appAnimation.observeInFragment(this@ParkFragment) {
                videoParkAdapter.setAdapterAnimation(it)
            }
            //监听全局的收藏信息 收藏的Id跟本列表的数据id匹配则需要更新
            eventViewModel.collectEvent.observeInFragment(this@ParkFragment) {
                for (index in videoParkAdapter.data.indices) {
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