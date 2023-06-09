package com.smallplay.playlet.ui.fragment

import android.os.Bundle
import androidx.lifecycle.Observer
import kotlinx.android.synthetic.main.fragment_main.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.*
import com.smallplay.playlet.databinding.FragmentMainBinding
import com.smallplay.playlet.viewmodel.state.MainViewModel
import kotlinx.android.synthetic.main.include_recyclerview.*

/**
 * 描述　:项目主页Fragment
 */
class MainFragment : BaseFragment<MainViewModel, FragmentMainBinding>() {

    override fun initView(savedInstanceState: Bundle?) {
        //初始化viewpager2
        mainViewpager.initMain(this)
        //初始化 bottomBar
        mainBottom.init{
            when (it) {
                R.id.menu_main -> mainViewpager.setCurrentItem(0, false)
                R.id.menu_park -> mainViewpager.setCurrentItem(1, false)
                R.id.menu_me -> mainViewpager.setCurrentItem(2, false)
            }
        }
        mainBottom.interceptLongClick(R.id.menu_main,R.id.menu_park,R.id.menu_me)
    }

    override fun createObserver() {
        appViewModel.appColor.observeInFragment(this, Observer {
            setUiTheme(it, mainBottom)
        })

        eventViewModel.navigationIdx.observeInFragment(this, Observer {
            mainBottom.currentItem = it
            mainViewpager.setCurrentItem(it, false)
        })
    }
}