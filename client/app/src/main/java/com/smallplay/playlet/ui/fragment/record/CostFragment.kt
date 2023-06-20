package com.smallplay.playlet.ui.fragment.record

import android.os.Bundle
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.R
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.FragmentCostBinding
import com.smallplay.playlet.ui.adapter.CostAdapter
import com.smallplay.playlet.viewmodel.request.RequestCostViewModel
import com.smallplay.playlet.viewmodel.state.CostViewModel
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import me.hgj.jetpackmvvm.ext.nav

class CostFragment : BaseFragment1<CostViewModel, FragmentCostBinding>() {

    //适配器
    private val costAdapter: CostAdapter by lazy { CostAdapter(arrayListOf()) }

    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //请求数据ViewModel
    private val requestViewModel: RequestCostViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        mViewBind.includeToolbar.toolbar.run {
            initClose(getString(R.string.me_cost_text)) {
                nav().navigateUp()
            }
        }
        //状态页配置 swipeRefresh参数表示你要包裹的布局
        loadsir = loadServiceInit(mViewBind.includeList.includeRecyclerview.swipeRefresh) {
            //点击错误重试时触发的操作
            loadsir.showLoading()
            //请求数据
            requestViewModel.getCostData(true)
        }

        //初始化recyclerView
        mViewBind.includeList.includeRecyclerview.recyclerView.init(LinearLayoutManager(context), costAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
            it.initFooter(SwipeRecyclerView.LoadMoreListener {
                //触发加载更多时请求数据
                requestViewModel.getCostData(false)
            })
        }
        //初始化 SwipeRefreshLayout
        mViewBind.includeList.includeRecyclerview.swipeRefresh.init {
            //触发刷新监听时请求数据
            requestViewModel.getCostData(true)
        }
        costAdapter.run {
            setOnItemClickListener { _, _, position ->
//                nav().navigateAction(
//                    R.id.action_todoListFragment_to_addTodoFragment,
//                    Bundle().apply {
//                        putParcelable("todo", costAdapter.data[position])
//                    })
            }
            addChildClickViewIds(R.id.item_todo_setting)
            setOnItemChildClickListener { adapter, view, position ->

            }
        }
    }

    override fun lazyLoadData() {
        //设置界面 加载中
        loadsir.showLoading()
        requestViewModel.getCostData(true)
    }

    override fun createObserver() {
        requestViewModel.costDataState.observe(viewLifecycleOwner, Observer {
            //设值 新写了个拓展函数，搞死了这个恶心的重复代码
            loadListData(
                it,
                costAdapter,
                loadsir,
                mViewBind.includeList.includeRecyclerview.recyclerView,
                mViewBind.includeList.includeRecyclerview.swipeRefresh
            )
        })
        requestViewModel.delDataState.observe(viewLifecycleOwner, Observer {
            if (it.isSuccess) {
                if (costAdapter.data.size == 1) {
                    loadsir.showEmpty()
                }
                costAdapter.remove(it.data!!)
            } else {
                showMessage(it.errorMsg)
            }
        })
        requestViewModel.doneDataState.observe(viewLifecycleOwner, Observer {
            if (it.isSuccess) {
                mViewBind.includeList.includeRecyclerview.swipeRefresh.isRefreshing = true
                requestViewModel.getCostData(true)
            } else {
                showMessage(it.errorMsg)
            }
        })

        eventViewModel.todoEvent.observeInFragment(this, Observer {
            if (costAdapter.data.size == 0) {
                //界面没有数据时，变为加载中 增强一丢丢体验
                loadsir.showLoading()
            } else {
                //有数据时，swipeRefresh 显示刷新状态
                mViewBind.includeList.includeRecyclerview.swipeRefresh.isRefreshing = true
            }
            //请求数据
            requestViewModel.getCostData(true)
        })

    }
}