package com.smallplay.playlet.ui.fragment

import android.content.res.Configuration
import android.os.Bundle
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.databinding.FragmentMainBinding
import com.smallplay.playlet.viewmodel.request.RequestLoginRegisterViewModel
import com.smallplay.playlet.viewmodel.state.MainViewModel
import me.hgj.jetpackmvvm.ext.parseState
import java.util.*

/**
 * 描述　:项目主页Fragment
 */
class MainFragment : BaseFragment<MainViewModel, FragmentMainBinding>() {

    private val requestLoginRegisterViewModel: RequestLoginRegisterViewModel by viewModels()


    override fun initView(savedInstanceState: Bundle?) {

        //设置繁体
        val configuration: Configuration = resources.configuration
        configuration.locale = Locale.TAIWAN // 设置当前语言配置为繁体
        resources.updateConfiguration(configuration, resources.displayMetrics)


        //初始化viewpager2
        mDatabind.mainViewpager.initMain(this)
        //初始化 bottomBar
        mDatabind.mainBottom.init{
            when (it) {
                R.id.menu_main -> mDatabind.mainViewpager.setCurrentItem(0, false)
                R.id.menu_park -> mDatabind.mainViewpager.setCurrentItem(1, false)
                R.id.menu_me -> mDatabind.mainViewpager.setCurrentItem(2, false)
            }
        }
        mDatabind.mainBottom.interceptLongClick(R.id.menu_main,R.id.menu_park,R.id.menu_me)


        var userInfo = CacheUtil.getUser()
        if (userInfo != null) {
            requestLoginRegisterViewModel.registerAndlogin(
                userInfo.userId,
                userInfo.password
            )
        } else {
            requestLoginRegisterViewModel.registerAndlogin(
                SettingUtil.getAccountByDevice() ,
                "GidMQhZN"
            )
        }

        addLoadingObserve(requestLoginRegisterViewModel)

    }

    override fun createObserver() {
        appViewModel.appColor.observeInFragment(this, Observer {
            setUiTheme(it, mDatabind.mainBottom)
        })

        eventViewModel.navigationIdx.observeInFragment(this, Observer {
            mDatabind.mainBottom.currentItem = it
            mDatabind.mainViewpager.setCurrentItem(it, false)
        })

        requestLoginRegisterViewModel.registResult.observe(viewLifecycleOwner,Observer { resultState ->
            parseState(resultState, {
                //登录成功 通知账户数据发生改变鸟
                CacheUtil.setUser(it)
                CacheUtil.setIsLogin(true)
                if (it.phone.isNotEmpty()) {
                    CacheUtil.setIsBind(true)
                } else {
                    CacheUtil.setIsBind(false)
                }
                appViewModel.userInfo.value = it
                //登录成功 请求数据
                //请求视频列表数据 第一次要去请求下
                appViewModel.getVideoData(true, isHomePage = true)
            }, {
                //登录失败
                showMessage(it.errorMsg)
            })
        })

    }
}