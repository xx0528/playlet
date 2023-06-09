package com.smallplay.playlet.ui.video.render

import android.content.Context
import android.util.AttributeSet
import xyz.doikki.videoplayer.controller.BaseVideoController

/**
 * 控制
 */
class VideoController : BaseVideoController {
    constructor(context: Context) : super(context) {}
    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {}
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(
        context,
        attrs,
        defStyleAttr
    ) {
    }

    init {
        //显示调试信息
//        addControlComponent(DebugInfoView(context))
    }

    override fun getLayoutId(): Int {
        return 0
    }

    override fun showNetWarning(): Boolean {
        //不显示移动网络播放警告
        return false
    }
}
