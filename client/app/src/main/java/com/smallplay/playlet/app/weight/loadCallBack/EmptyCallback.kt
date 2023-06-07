package com.smallplay.playlet.app.weight.loadCallBack


import com.kingja.loadsir.callback.Callback
import com.smallplay.playlet.R


class EmptyCallback : Callback() {

    override fun onCreateView(): Int {
        return R.layout.layout_empty
    }

}