package com.smallplay.playlet.ui.fragment.tree

import android.os.Bundle
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.kingja.loadsir.core.LoadService
import kotlinx.android.synthetic.main.include_list.*
import kotlinx.android.synthetic.main.include_recyclerview.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.databinding.IncludeListBinding
import com.smallplay.playlet.ui.adapter.NavigationAdapter
import com.smallplay.playlet.viewmodel.request.RequestTreeViewModel
import com.smallplay.playlet.viewmodel.state.TreeViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction

/**
 * 描述　: 体系
 */
class NavigationFragment : BaseFragment<TreeViewModel, IncludeListBinding>() {

    //界面状态管理者
    private lateinit var loadsir: LoadService<Any>

    private val navigationAdapter: NavigationAdapter by lazy { NavigationAdapter(arrayListOf()) }

    /** */
    private val requestTreeViewModel: RequestTreeViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        //状态页配置
        loadsir = loadServiceInit(swipeRefresh) {
            //点击重试时触发的操作
            loadsir.showLoading()
            requestTreeViewModel.getNavigationData()
        }
        //初始化recyclerView
        recyclerView.init(LinearLayoutManager(context), navigationAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
        }
        //初始化 SwipeRefreshLayout
        swipeRefresh.init {
            //触发刷新监听时请求数据
            requestTreeViewModel.getNavigationData()
        }
        navigationAdapter.setNavigationAction { item, view ->
            nav().navigateAction(R.id.action_to_webFragment,
                Bundle().apply {
                    putParcelable("ariticleData", item)
                }
            )
        }
    }

    override fun lazyLoadData() {
        //设置界面 加载中
        loadsir.showLoading()
        requestTreeViewModel.getNavigationData()
    }

    override fun createObserver() {
        requestTreeViewModel.navigationDataState.observe(viewLifecycleOwner, Observer {
            swipeRefresh.isRefreshing = false
            if (it.isSuccess) {
                loadsir.showSuccess()
                navigationAdapter.setList(it.listData)
            } else {
                loadsir.showError(it.errMessage)
            }
        })
        appViewModel.run {
            //监听全局的主题颜色改变
            appColor.observeInFragment(this@NavigationFragment, Observer {
                setUiTheme(it, swipeRefresh, loadsir)
            })
            //监听全局的列表动画改编
            appAnimation.observeInFragment(this@NavigationFragment, Observer {
                navigationAdapter.setAdapterAnimation(it)
            })
        }

    }
}