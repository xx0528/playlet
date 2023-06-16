package com.smallplay.playlet.ui.fragment.me

import android.os.Bundle
import android.view.View
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.blankj.utilcode.util.ToastUtils
import kotlinx.android.synthetic.main.fragment_me.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.network.ApiService
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.data.model.bean.BannerResponse
import com.smallplay.playlet.data.model.bean.IntegralResponse
import com.smallplay.playlet.databinding.FragmentMeBinding
import com.smallplay.playlet.ui.adapter.MeLikeVideosAdapter
import com.smallplay.playlet.ui.adapter.MeRechargeAdapter
import com.smallplay.playlet.ui.adapter.VideoParkAdapter
import com.smallplay.playlet.viewmodel.request.RequestMeViewModel
import com.smallplay.playlet.viewmodel.state.MeViewModel
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState
import me.hgj.jetpackmvvm.ext.util.notNull

/**
 * 描述　: 我的
 */

class MeFragment : BaseFragment<MeViewModel, FragmentMeBinding>() {

    private val requestMeViewModel: RequestMeViewModel by viewModels()

    private val meRechargeAdapter: MeRechargeAdapter by lazy { MeRechargeAdapter(arrayListOf()) }
    private val meLikeVideosAdapter: MeLikeVideosAdapter by lazy { MeLikeVideosAdapter(arrayListOf()) }

    override fun initView(savedInstanceState: Bundle?) {

        mDatabind.vm = mViewModel
        mDatabind.click = ProxyClick()
        appViewModel.appColor.value?.let { setUiTheme(it, me_linear) }
        appViewModel.userInfo.value?.let { mViewModel.name.set(if (it.userName.isEmpty()) it.userName else it.uuid) }

        recycle_recharge_vip.init(LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false), meRechargeAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(5,  ConvertUtils.dp2px(2f)))
        }
        recycle_like_video.init(LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false), meLikeVideosAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(5, ConvertUtils.dp2px(2f)))
        }

        meRechargeAdapter.run {
            setOnItemClickListener { adapter, view, position ->
                nav().navigateAction(R.id.action_to_webFragment, Bundle().apply {
                    putString("url", appViewModel.userInfo.value?.chatServer)
                    putInt("recharge", meRechargeAdapter.data[position].costMoney)
                })
            }
        }

        meLikeVideosAdapter.run {
            setOnItemClickListener { adapter, view, position ->
                eventViewModel.navigationIdx.value = 0
                appViewModel.setCurVideo(this.data[position].ID)
                appViewModel.curPlayVideoNo.value = this.data[position].episode
                appViewModel.curPlayVideoTime.value = this.data[position].time
            }
        }


        me_swipe.init {
            requestMeViewModel.getUserInfo()
            requestMeViewModel.getVipInfo()
            meLikeVideosAdapter.data = arrayListOf()
            CacheUtil.getLocalVideos()?.let { meLikeVideosAdapter.addData(it) }
        }

        if (appViewModel.userInfo.value?.check == true) {
            item_recharge_layout.visibility = View.VISIBLE
        } else {
            item_recharge_layout.visibility = View.GONE
        }
    }

    override fun lazyLoadData() {
        appViewModel.userInfo.value?.run {
            me_swipe.isRefreshing = true
            requestMeViewModel.getUserInfo()
            requestMeViewModel.getVipInfo()
            meLikeVideosAdapter.data = arrayListOf()
            CacheUtil.getLocalVideos()?.let { meLikeVideosAdapter.addData(it) }
        }
    }

    override fun createObserver() {

        requestMeViewModel.run {
            meData.observe(viewLifecycleOwner, Observer { resultState ->
                me_swipe.isRefreshing = false
                parseState(resultState, {
                    mViewModel.info.set("id：${it.userId}")
                    mViewModel.gold.set(it.curGold.toString())
                }, {
                    ToastUtils.showShort(it.errorMsg)
                })
            })
            meVip.observe(viewLifecycleOwner, Observer {
                meRechargeAdapter.data = arrayListOf()
                meRechargeAdapter.addData(it.listData)
                meLikeVideosAdapter.data = arrayListOf()
                CacheUtil.getLocalVideos()?.let { meLikeVideosAdapter.addData(it) }
            })
        }

        appViewModel.run {
            appColor.observeInFragment(this@MeFragment, Observer {
                setUiTheme(it, me_linear, me_swipe)
            })
            userInfo.observeInFragment(this@MeFragment, Observer {
                it.notNull({
                    me_swipe.isRefreshing = true
                    mViewModel.name.set(if (it.userName.isEmpty()) it.userName else it.userId)
                    requestMeViewModel.getUserInfo()
                }, {
                    mViewModel.name.set(context?.getString(R.string.me_click_login_text))
                    mViewModel.info.set("id：--　")
                    mViewModel.gold.set("0")
                })
            })
        }
    }

    inner class ProxyClick {

        /** 登录 */
        fun login() {
            nav().jumpByLogin {}
        }


        /** 联系我们 */
        fun chat() {
            nav().jumpByLogin {
                it.navigateAction(R.id.action_to_webFragment, Bundle().apply {
                    putString("url", appViewModel.userInfo.value?.chatServer)
                    putInt("recharge", -1)
                })
            }
        }

        /** 消费记录 */
        fun expense() {
            nav().navigateAction(R.id.action_to_webFragment, Bundle().apply {
                putParcelable(
                    "",
                    BannerResponse(
                        title = "消费记录",
                        url = "https://www.baidu.com/"
                    )
                )
            })
        }

        /** 设置*/
        fun setting() {
            nav().navigateAction(R.id.action_mainfragment_to_settingFragment)
        }

    }

    override fun onResume() {
        super.onResume()
    }
}