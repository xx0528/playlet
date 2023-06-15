package com.smallplay.playlet.ui.fragment.me

import android.os.Bundle
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import com.blankj.utilcode.util.ToastUtils
import kotlinx.android.synthetic.main.fragment_me.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.init
import com.smallplay.playlet.app.ext.joinQQGroup
import com.smallplay.playlet.app.ext.jumpByLogin
import com.smallplay.playlet.app.ext.setUiTheme
import com.smallplay.playlet.app.network.ApiService
import com.smallplay.playlet.data.model.bean.BannerResponse
import com.smallplay.playlet.data.model.bean.IntegralResponse
import com.smallplay.playlet.databinding.FragmentMeBinding
import com.smallplay.playlet.viewmodel.request.RequestMeViewModel
import com.smallplay.playlet.viewmodel.state.MeViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState
import me.hgj.jetpackmvvm.ext.util.notNull

/**
 * 描述　: 我的
 */

class MeFragment : BaseFragment<MeViewModel, FragmentMeBinding>() {

    private val requestMeViewModel: RequestMeViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {

        mDatabind.vm = mViewModel
        mDatabind.click = ProxyClick()
        appViewModel.appColor.value?.let { setUiTheme(it, me_linear, me_integral) }
        appViewModel.userInfo.value?.let { mViewModel.name.set(if (it.userName.isEmpty()) it.userName else it.uuid) }
        me_swipe.init {
            requestMeViewModel.getUserInfo()
        }
    }

    override fun lazyLoadData() {
        appViewModel.userInfo.value?.run {
            me_swipe.isRefreshing = true
            requestMeViewModel.getUserInfo()
        }
    }

    override fun createObserver() {

        requestMeViewModel.meData.observe(viewLifecycleOwner, Observer { resultState ->
            me_swipe.isRefreshing = false
            parseState(resultState, {
                mViewModel.info.set("id：${it.userId}")
                mViewModel.gold.set(it.curGold.toString())
            }, {
                ToastUtils.showShort(it.errorMsg)
            })
        })

        appViewModel.run {
            appColor.observeInFragment(this@MeFragment, Observer {
                setUiTheme(it, me_linear, me_swipe, me_integral)
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

        /** 收藏 */
        fun collect() {
//            nav().jumpByLogin {
//                it.navigateAction(R.id.action_mainfragment_to_collectFragment)
//            }
        }

        /** 积分 */
        fun gold() {
//            nav().jumpByLogin {
//                it.navigateAction(R.id.action_mainfragment_to_integralFragment,
//                    Bundle().apply {
//                    }
//                )
//            }
        }

        /** 联系我们 */
        fun chat() {
            nav().jumpByLogin {
                it.navigateAction(R.id.action_to_webFragment, Bundle().apply {
                    putParcelable(
                        "bannerdata",
                        BannerResponse(
                            title = "",
                            url = "${ApiService.Chat_SERVER_URL}"
                        )
                    )
                })
            }
        }

        /** 关于我们 */
        fun about() {
            nav().navigateAction(R.id.action_to_webFragment, Bundle().apply {
                putParcelable(
                    "bannerdata",
                    BannerResponse(
                        title = "关于我们",
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
}