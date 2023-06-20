package com.smallplay.playlet.ui.fragment.bind

import android.os.Bundle
import android.view.View
import android.widget.CompoundButton
import androidx.fragment.app.viewModels
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import com.blankj.utilcode.util.ToastUtils
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.hideSoftKeyboard
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.app.ext.showMessage
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.data.model.bean.UserInfo
import com.smallplay.playlet.databinding.FragmentBindBinding
import com.smallplay.playlet.viewmodel.request.RequestBindViewModel
import com.smallplay.playlet.viewmodel.request.RequestMeViewModel
import com.smallplay.playlet.viewmodel.state.BindViewModel
import kotlinx.android.synthetic.main.fragment_bind.*
import kotlinx.android.synthetic.main.fragment_me.*
import kotlinx.android.synthetic.main.include_toolbar.*
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.navigateAction
import me.hgj.jetpackmvvm.ext.parseState
import me.hgj.jetpackmvvm.state.ResultState

/**
 * 描述　: 登录页面
 */
class BindFragment : BaseFragment<BindViewModel, FragmentBindBinding>() {

    private val requestBindViewModel: RequestBindViewModel by viewModels()
    private val requestMeViewModel: RequestMeViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        addLoadingObserve(requestBindViewModel)
        mDatabind.viewmodel = mViewModel

        mDatabind.click = ProxyClick()

        toolbar.initClose(getString(R.string.bind_text)) {
            nav().navigateUp()
        }

        var phoneInfo = context?.let { SettingUtil.getPhoneInfo(it) }
        if (phoneInfo != null && phoneInfo.first.isNotEmpty()) {
            mViewModel.bind_phone.set(phoneInfo.first)
            var replaceStr = phoneInfo.first.substring(3, 7)
            bind_phone.text = phoneInfo.first.replace(replaceStr , "****" );
            bindSub.visibility = View.VISIBLE
            bind_operator_Info.text = phoneInfo.second
            bind_operator_Info.visibility = View.VISIBLE

        } else {
            bind_phone.text =  getString(R.string.bind_phone_faild)
            bindSub.visibility = View.INVISIBLE
            bind_operator_Info.visibility = View.INVISIBLE
        }
    }

    override fun createObserver() {
        requestBindViewModel.run {
            bindResult.observe(viewLifecycleOwner, Observer {resultState ->
                parseState(resultState, {
                    appViewModel.userInfo.value = it
                    CacheUtil.setIsBind(true)
                    nav().navigateUp()
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
            nav().navigateAction(R.id.action_loginFragment_to_loginFrgment)
        }
    }

}