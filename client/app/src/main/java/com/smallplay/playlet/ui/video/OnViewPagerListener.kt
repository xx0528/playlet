package com.smallplay.playlet.ui.video

/**
 * Desc:RecyclerView仿ViewPager的片段选择器器监听
 */
open interface OnViewPagerListener {
    /*初始化完成*/
    fun onInitComplete()

    /*释放的监听*/
    fun onPageRelease(isNext: Boolean, position: Int)

    /*选中的监听以及判断是否滑动到底部*/
    fun onPageSelected(position: Int, isBottom: Boolean)
}
