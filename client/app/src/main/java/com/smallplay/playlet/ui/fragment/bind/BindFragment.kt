package com.smallplay.playlet.ui.fragment.bind

import android.os.Bundle
import android.widget.CompoundButton
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import kotlinx.android.synthetic.main.fragment_login.*
import kotlinx.android.synthetic.main.include_toolbar.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.hideSoftKeyboard
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.app.ext.showMessage
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

    override fun initView(savedInstanceState: Bundle?) {

    }

    override fun createObserver() {

    }

}