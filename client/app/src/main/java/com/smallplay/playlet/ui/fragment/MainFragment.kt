package com.smallplay.playlet.ui.fragment

import android.content.res.Configuration
import android.os.Bundle
import androidx.lifecycle.Observer
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.databinding.FragmentMainBinding
import com.smallplay.playlet.viewmodel.state.MainViewModel
import java.util.*

/**
 * 描述　:项目主页Fragment
 */
class MainFragment : BaseFragment<MainViewModel, FragmentMainBinding>() {

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
    }

    override fun createObserver() {
        appViewModel.appColor.observeInFragment(this, Observer {
            setUiTheme(it, mDatabind.mainBottom)
        })

        eventViewModel.navigationIdx.observeInFragment(this, Observer {
            mDatabind.mainBottom.currentItem = it
            mDatabind.mainViewpager.setCurrentItem(it, false)
        })
    }
}