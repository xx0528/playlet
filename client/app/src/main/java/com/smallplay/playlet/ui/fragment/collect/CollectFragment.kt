package com.smallplay.playlet.ui.fragment.collect

import android.os.Bundle
import androidx.fragment.app.Fragment
import kotlinx.android.synthetic.main.fragment_collect.*
import kotlinx.android.synthetic.main.include_toolbar.*
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.viewmodel.request.RequestCollectViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.bindViewPager2
import com.smallplay.playlet.app.ext.init
import com.smallplay.playlet.app.ext.initClose
import com.smallplay.playlet.databinding.FragmentCollectBinding
import me.hgj.jetpackmvvm.ext.nav

/**
 * 描述　: 收藏
 */
class CollectFragment:BaseFragment<RequestCollectViewModel,FragmentCollectBinding>() {

    var titleData = arrayListOf("文章","网址")

    private var fragments : ArrayList<Fragment> = arrayListOf()

    init {
        fragments.add(CollectAriticleFragment())
        fragments.add(CollectUrlFragment())
    }
    override fun initView(savedInstanceState: Bundle?)  {
        //初始化时设置顶部主题颜色
        appViewModel.appColor.value?.let { collect_viewpager_linear.setBackgroundColor(it) }
        //初始化viewpager2
        collect_view_pager.init(this,fragments)
        //初始化 magic_indicator
        collect_magic_indicator.bindViewPager2(collect_view_pager,mStringList = titleData)
        toolbar.initClose(){
            nav().navigateUp()
        }

    }
}