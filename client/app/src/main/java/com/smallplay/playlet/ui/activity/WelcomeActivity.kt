package com.smallplay.playlet.ui.activity

import android.content.Intent
import android.os.Bundle
import com.zhpan.bannerview.BannerViewPager
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.R
import com.smallplay.playlet.app.base.BaseActivity
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.app.weight.banner.WelcomeBannerViewHolder
import com.smallplay.playlet.databinding.ActivityWelcomeBinding
import me.hgj.jetpackmvvm.ext.view.visible

/**
 * 描述　:
 */
@Suppress("DEPRECATED_IDENTITY_EQUALS")
class WelcomeActivity : BaseActivity<BaseViewModel, ActivityWelcomeBinding>() {

    private var resList = arrayOf("唱", "跳", "r a p")

    private lateinit var mViewPager: BannerViewPager<String, WelcomeBannerViewHolder>

    override fun initView(savedInstanceState: Bundle?) {
        //防止出现按Home键回到桌面时，再次点击重新进入该界面bug
        if (intent.flags and Intent.FLAG_ACTIVITY_BROUGHT_TO_FRONT !== 0) {
            finish()
            return
        }
        mDatabind.click = ProxyClick()
        mDatabind.welcomeBaseview.setBackgroundColor(SettingUtil.getColor(this))
        mViewPager = findViewById(R.id.banner_view)
//        if (CacheUtil.isFirst()) {
//            //是第一次打开App 显示引导页
//            welcome_image.gone()
//            mViewPager.apply {
//                adapter = WelcomeBannerAdapter()
//                setLifecycleRegistry(lifecycle)
//                registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
//                    override fun onPageSelected(position: Int) {
//                        super.onPageSelected(position)
//                        if (position == resList.size - 1) {
//                            welcomeJoin.visible()
//                        } else {
//                            welcomeJoin.gone()
//                        }
//                    }
//                })
//                create(resList.toList())
//            }
//        } else {
            //不是第一次打开App 0.3秒后自动跳转到主页
        mDatabind.welcomeImage.visible()
        mViewPager.postDelayed({
            startActivity(Intent(this, MainActivity::class.java))
            finish()
            //带点渐变动画
            overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
        }, 300)
//        }
    }

    inner class ProxyClick {
        fun toMain() {
            CacheUtil.setFirst(false)
            startActivity(Intent(this@WelcomeActivity, MainActivity::class.java))
            finish()
            //带点渐变动画
            overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out)
        }
    }

}