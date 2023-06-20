package com.smallplay.playlet.ui.fragment.login

import android.os.Bundle
import android.widget.CompoundButton
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.app.ext.showMessage
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.databinding.FragmentSetPswBinding
import com.smallplay.playlet.viewmodel.request.RequestSetPswViewModel
import com.smallplay.playlet.viewmodel.state.SetPswViewModel
import me.hgj.jetpackmvvm.ext.nav
import me.hgj.jetpackmvvm.ext.parseState

/**
 * 描述　:
 */
class SetPswFrgment : BaseFragment<SetPswViewModel, FragmentSetPswBinding>() {

    private val requestSetPswViewModel: RequestSetPswViewModel by viewModels()

    override fun initView(savedInstanceState: Bundle?) {
        mDatabind.viewmodel = mViewModel
        mDatabind.click = ProxyClick()
        mDatabind.includeToolbar.toolbar.initClose(getString(R.string.editor_psw_text)) {
            nav().navigateUp()
        }
        //设置颜色跟主题颜色一致
        appViewModel.appColor.value?.let {
            SettingUtil.setShapColor(mDatabind.registerSub, it)
            mDatabind.includeToolbar.toolbar.setBackgroundColor(it)
        }
    }

    override fun createObserver() {
        requestSetPswViewModel.setPswResult.observe(
            viewLifecycleOwner,
            Observer { resultState ->
                parseState(resultState, {
                    appViewModel.userInfo.value = it
                    nav().navigateUp()
                }, {
                    showMessage(it.errorMsg)
                })
            })
    }


    inner class ProxyClick {
        /**清空*/
        fun clear() {
            mViewModel.username.set("")
        }

        /**注册*/
        fun register() {
            when {
                mViewModel.username.get().isEmpty() -> showMessage(getString(R.string.input_nickname_text))
                mViewModel.password.get().isEmpty() -> showMessage(getString(R.string.input_psw_text))
                mViewModel.password2.get().isEmpty() -> showMessage(getString(R.string.input_psw_sure_text))
                mViewModel.password.get().length < 6 -> showMessage(getString(R.string.psw_less_text))
                mViewModel.password.get() != mViewModel.password2.get() -> showMessage(getString(R.string.psw_not_same_text))
                else -> requestSetPswViewModel.setPswNickname(
                    mViewModel.username.get(),
                    mViewModel.password.get()
                )
            }
        }

        var onCheckedChangeListener1 = CompoundButton.OnCheckedChangeListener { _, isChecked ->
            mViewModel.isShowPwd.set(isChecked)
        }
        var onCheckedChangeListener2 = CompoundButton.OnCheckedChangeListener { _, isChecked ->
            mViewModel.isShowPwd2.set(isChecked)
        }
    }
}