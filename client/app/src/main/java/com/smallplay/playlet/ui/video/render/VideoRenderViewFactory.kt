package com.smallplay.playlet.ui.video.render

import android.content.Context
import xyz.doikki.videoplayer.render.IRenderView
import xyz.doikki.videoplayer.render.RenderViewFactory
import xyz.doikki.videoplayer.render.TextureRenderView

class VideoRenderViewFactory : RenderViewFactory() {
    override fun createRenderView(context: Context): IRenderView {
        return VideoRenderView(TextureRenderView(context))
    }

    companion object {
        fun create(): VideoRenderViewFactory {
            return VideoRenderViewFactory()
        }
    }
}
