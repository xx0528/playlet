package com.smallplay.playlet.ui.fragment.bind

import android.os.Build
import android.os.Bundle
import android.view.View
import androidx.annotation.RequiresApi
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import com.blankj.utilcode.util.ToastUtils
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.databinding.FragmentBindBinding
import com.smallplay.playlet.viewmodel.request.RequestBindViewModel
import com.smallplay.playlet.viewmodel.state.BindViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState

/**
 * 描述　: 登录页面
 */
class BindFragment : BaseFragment<BindViewModel, FragmentBindBinding>() {

    private val requestBindViewModel: RequestBindViewModel by viewModels()

    @RequiresApi(Build.VERSION_CODES.R)
    override fun initView(savedInstanceState: Bundle?) {
        addLoadingObserve(requestBindViewModel)
        mDatabind.viewmodel = mViewModel

        mDatabind.click = ProxyClick()

        mDatabind.includeToolbar.toolbar.initClose(getString(R.string.bind_text)) {
            nav().navigateUp()
        }

        var phoneInfo = context?.let { SettingUtil.getPhoneInfo(it) }
        if (phoneInfo != null && phoneInfo.first.isNotEmpty()) {
            mViewModel.bind_phone.set(phoneInfo.first)
            var replaceStr = phoneInfo.first.substring(3, 7)
            mDatabind.bindPhone.text = phoneInfo.first.replace(replaceStr , "****" );
            mDatabind.bindSub.visibility = View.VISIBLE
            mDatabind.bindOperatorInfo.text = phoneInfo.second
            mDatabind.bindOperatorInfo.visibility = View.VISIBLE

        } else {
            mDatabind.bindPhone.text =  getString(R.string.bind_phone_faild)
            mDatabind.bindSub.visibility = View.INVISIBLE
            mDatabind.bindOperatorInfo.visibility = View.INVISIBLE
        }
    }

    override fun createObserver() {
        requestBindViewModel.run {
            bindResult.observe(viewLifecycleOwner, Observer {resultState ->
                parseState(resultState, {
                    appViewModel.userInfo.value = it
                    CacheUtil.setIsBind(true)
                    nav().navigateUp()
                    nav().navigateAction(R.id.setPswFragment)
//                    nav().navigateAction(R.id.action_loginFragment_to_loginFrgment)
                }, {
                    ToastUtils.showShort(it.errorMsg)
                })
            })
        }
    }

    inner class ProxyClick {

        fun bind() {
            requestBindViewModel.bindReq(mViewModel.bind_phone.get())
        }

        fun login() {
            nav().navigateAction(R.id.loginFragment)
        }
    }

}