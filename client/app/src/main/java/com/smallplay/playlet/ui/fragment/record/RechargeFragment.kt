package com.smallplay.playlet.ui.fragment.record

import android.os.Bundle
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.afollestad.materialdialogs.MaterialDialog
import com.afollestad.materialdialogs.bottomsheets.BottomSheet
import com.afollestad.materialdialogs.bottomsheets.setPeekHeight
import com.afollestad.materialdialogs.lifecycle.lifecycleOwner
import com.afollestad.materialdialogs.list.listItems
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import com.smallplay.playlet.R
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.FragmentRechargeBinding
import com.smallplay.playlet.ui.adapter.RechargeAdapter
import com.smallplay.playlet.viewmodel.request.RequestRechargeViewModel
import com.smallplay.playlet.viewmodel.state.CostViewModel
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import kotlinx.android.synthetic.main.include_recyclerview.*
import kotlinx.android.synthetic.main.include_toolbar.*
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction

class RechargeFragment : BaseFragment1<CostViewModel, FragmentRechargeBinding>() {

    //适配器
    private val rechargeAdapter: RechargeAdapter by lazy { RechargeAdapter(arrayListOf()) }

    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    //请求数据ViewModel
    private val requestViewModel: RequestRechargeViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        toolbar.run {
            initClose(getString(R.string.me_recharge_text)) {
                nav().navigateUp()
            }
        }
        //状态页配置 swipeRefresh参数表示你要包裹的布局
        loadsir = loadServiceInit(swipeRefresh) {
            //点击错误重试时触发的操作
            loadsir.showLoading()
            //请求数据
            requestViewModel.getRechargeData(true)
        }

        //初始化recyclerView
        recyclerView.init(LinearLayoutManager(context), rechargeAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
            it.initFooter(SwipeRecyclerView.LoadMoreListener {
                //触发加载更多时请求数据
                requestViewModel.getRechargeData(false)
            })
        }
        //初始化 SwipeRefreshLayout
        swipeRefresh.init {
            //触发刷新监听时请求数据
            requestViewModel.getRechargeData(true)
        }
        rechargeAdapter.run {
            setOnItemClickListener { _, _, position ->
//                nav().navigateAction(
//                    R.id.action_todoListFragment_to_addTodoFragment,
//                    Bundle().apply {
//                        putParcelable("todo", rechargeAdapter.data[position])
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
        requestViewModel.getRechargeData(true)
    }

    override fun createObserver() {
        requestViewModel.rechargeDataState.observe(viewLifecycleOwner, Observer {
            //设值 新写了个拓展函数，搞死了这个恶心的重复代码
            loadListData(it, rechargeAdapter, loadsir, recyclerView,swipeRefresh)
        })

        eventViewModel.todoEvent.observeInFragment(this, Observer {
            if (rechargeAdapter.data.size == 0) {
                //界面没有数据时，变为加载中 增强一丢丢体验
                loadsir.showLoading()
            } else {
                //有数据时，swipeRefresh 显示刷新状态
                swipeRefresh.isRefreshing = true
            }
            //请求数据
            requestViewModel.getRechargeData(true)
        })

    }
}