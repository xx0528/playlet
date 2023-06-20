package com.smallplay.playlet.ui.fragment.web

import android.annotation.SuppressLint
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.Window
import android.webkit.JavascriptInterface
import android.widget.LinearLayout
import androidx.activity.OnBackPressedCallback
import androidx.core.content.ContextCompat
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import com.blankj.utilcode.util.VibrateUtils
import com.google.gson.Gson
import com.just.agentweb.AgentWeb
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.eventViewModel
import com.smallplay.playlet.app.ext.hideSoftKeyboard
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.app.ext.showMessage
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.data.model.bean.*
import com.smallplay.playlet.data.model.enums.CollectType
import com.smallplay.playlet.databinding.FragmentWebBinding
import com.smallplay.playlet.viewmodel.state.WebViewModel
import me.hgj.jetpackmvvm.ext.nav


/**
 * 描述　:
 */
@Suppress("DEPRECATED_IDENTITY_EQUALS")
class WebFragment : BaseFragment<WebViewModel, FragmentWebBinding>() {

    private var mAgentWeb: AgentWeb? = null

    private var preWeb: AgentWeb.PreAgentWeb? = null


    override fun initView(savedInstanceState: Bundle?) {
        setHasOptionsMenu(false)
        mViewModel.url = arguments?.getString("url").toString()
        mViewModel.recharge = arguments?.getString("recharge")!!
        mDatabind.includeBar.toolbar.run {
            //设置menu 关键代码
//            mActivity.setSupportActionBar(this)
            initClose(mViewModel.showTitle) {
                hideSoftKeyboard(activity)
                mAgentWeb?.let { web ->
                    if (web.webCreator.webView.canGoBack()) {
                        web.webCreator.webView.goBack()
                    } else {
                        nav().navigateUp()
                    }
                }
            }
        }
        preWeb = AgentWeb.with(this)
            .setAgentWebParent(mDatabind.webcontent, LinearLayout.LayoutParams(-1, -1))
            .useDefaultIndicator()
            .createAgentWeb()
            .ready()
    }

    @SuppressLint("SetJavaScriptEnabled")
    override fun lazyLoadData() {
        //加载网页
        mAgentWeb = preWeb?.go(mViewModel.url)
        var webView = mAgentWeb?.webCreator?.webView
        if (webView != null)
        {
            webView.addJavascriptInterface(this, "androidJs");
            var settings = webView.settings
            settings.javaScriptEnabled = true
        }
        requireActivity().onBackPressedDispatcher.addCallback(this,
            object : OnBackPressedCallback(true) {
                override fun handleOnBackPressed() {
                    mAgentWeb?.let { web ->
                        if (web.webCreator.webView.canGoBack()) {
                            web.webCreator.webView.goBack()
                        } else {
                            nav().navigateUp()
                        }
                    }
                }
            })
    }

    @JavascriptInterface
    fun getRechargeInfo() : String {

        var retStr = "我要充值"
        if (mViewModel.recharge.isNotEmpty()) {
            retStr = "$retStr ${mViewModel.recharge}"
        }

        retStr = "$retStr\n我的賬號是: ${appViewModel.userInfo.value?.userId}\n我的手機是: ${appViewModel.userInfo.value?.phone}"
        val map = HashMap<String, Any>()
        map["code"] = mViewModel.recharge
        map["msg"] = retStr

        Log.d("web frag ---- TAG", Gson().toJson(map))
        return Gson().toJson(map)
    }

    override fun createObserver() {

    }

    override fun onCreateOptionsMenu(menu: Menu, inflater: MenuInflater) {
        inflater.inflate(R.menu.web_menu, menu)
        super.onCreateOptionsMenu(menu, inflater)
    }


    override fun onPrepareOptionsMenu(menu: Menu) {
        //如果收藏了，右上角的图标相对应改变
        context?.let {
            if (mViewModel.collect) {
                menu.findItem(R.id.web_collect).icon =
                    ContextCompat.getDrawable(it, R.drawable.ic_collected)
            } else {
                menu.findItem(R.id.web_collect).icon =
                    ContextCompat.getDrawable(it, R.drawable.ic_collect)
            }
        }

        return super.onPrepareOptionsMenu(menu)
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.web_share -> {
                //分享
                startActivity(Intent.createChooser(Intent().apply {
                    action = Intent.ACTION_SEND
                    putExtra(Intent.EXTRA_TEXT, "{${mViewModel.showTitle}}:${mViewModel.url}")
                    type = "text/plain"
                }, "分享到"))
            }
            R.id.web_refresh -> {
                //刷新网页
                mAgentWeb?.urlLoader?.reload()
            }

            R.id.web_liulanqi -> {
                //用浏览器打开
                startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(mViewModel.url)))
            }
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onPause() {
        mAgentWeb?.webLifeCycle?.onPause()
        super.onPause()
    }

    override fun onResume() {
        mAgentWeb?.webLifeCycle?.onResume()
        super.onResume()
    }

    override fun onDestroy() {
        mAgentWeb?.webLifeCycle?.onDestroy()
        mActivity.setSupportActionBar(null)
        super.onDestroy()
    }

}