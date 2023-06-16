package com.smallplay.playlet.ui.activity

import android.content.res.Configuration
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.view.View
import android.view.WindowInsets
import android.view.WindowManager
import android.widget.Toast
import androidx.activity.OnBackPressedCallback
import androidx.core.content.ContextCompat
import androidx.core.view.ViewCompat
import androidx.lifecycle.Observer
import androidx.navigation.Navigation
import com.blankj.utilcode.util.ToastUtils
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseActivity1
import com.smallplay.playlet.app.util.StatusBarUtil
import com.smallplay.playlet.databinding.ActivityMainBinding
import com.smallplay.playlet.viewmodel.state.MainViewModel
import com.tencent.bugly.beta.Beta
import me.hgj.jetpackmvvm.network.manager.NetState
import java.util.*

/**
 * 项目主页Activity
 */
class MainActivity : BaseActivity1<MainViewModel, ActivityMainBinding>() {

    var exitTime = 0L
    override fun initView(savedInstanceState: Bundle?) {

        //设置繁体
        val configuration: Configuration = resources.configuration
        configuration.locale = Locale.TAIWAN // 设置当前语言配置为繁体
        resources.updateConfiguration(configuration, resources.displayMetrics)

        //进入首页检查更新
        Beta.checkUpgrade(false, true)
        onBackPressedDispatcher.addCallback(this, object : OnBackPressedCallback(true) {
            override fun handleOnBackPressed() {
                val nav = Navigation.findNavController(this@MainActivity, R.id.host_fragment)
                if (nav.currentDestination != null && nav.currentDestination!!.id != R.id.mainfragment) {
                    //如果当前界面不是主页，那么直接调用返回即可
                    nav.navigateUp()
                } else {
                    //是主页
                    if (System.currentTimeMillis() - exitTime > 2000) {
                        ToastUtils.showShort(getString(R.string.text_exit))
                        exitTime = System.currentTimeMillis()
                    } else {
                        finish()
                    }
                }
            }
            })
        appViewModel.appColor.value?.let {
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN)
            supportActionBar?.setBackgroundDrawable(ColorDrawable(it))
            StatusBarUtil.setColor(this, it, 0) }

        setStatusBarColor(0)
    }

    override fun createObserver() {
        appViewModel.appColor.observeInActivity(this, Observer {
            supportActionBar?.setBackgroundDrawable(ColorDrawable(it))
            StatusBarUtil.setColor(this, it, 0)
        })


        /**
         * 把状态栏设成透明
         */
        appViewModel.statusBarColor.observeInActivity(this, Observer {
            setStatusBarColor(it)
        })
    }

    private fun setStatusBarColor(colorIdx: Int) {
        val decorView = window.decorView
        decorView.setOnApplyWindowInsetsListener { v: View, insets: WindowInsets? ->
            val defaultInsets = v.onApplyWindowInsets(insets)
            defaultInsets.replaceSystemWindowInsets(
                defaultInsets.systemWindowInsetLeft,
                0,
                defaultInsets.systemWindowInsetRight,
                defaultInsets.systemWindowInsetBottom
            )
        }
        ViewCompat.requestApplyInsets(decorView)
        when (colorIdx) {
            0 -> window.statusBarColor = ContextCompat.getColor(this, android.R.color.transparent)
            1 -> window.statusBarColor = ContextCompat.getColor(this, android.R.color.black)
            2 -> window.statusBarColor = ContextCompat.getColor(this, android.R.color.white)
        }
    }

    /**
     * 示例，在Activity/Fragment中如果想监听网络变化，可重写onNetworkStateChanged该方法
     */
    override fun onNetworkStateChanged(netState: NetState) {
        super.onNetworkStateChanged(netState)
        if (netState.isSuccess) {
            Toast.makeText(applicationContext, getString(R.string.text_connect), Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(applicationContext, getString(R.string.text_disconnect), Toast.LENGTH_SHORT).show()
        }
    }

}
