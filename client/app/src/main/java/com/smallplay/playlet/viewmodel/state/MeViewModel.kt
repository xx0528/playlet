package com.smallplay.playlet.viewmodel.state

import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import me.hgj.jetpackmvvm.callback.databind.IntObservableField
import me.hgj.jetpackmvvm.callback.databind.StringObservableField
import com.smallplay.playlet.app.util.ColorUtil

/**
 * 描述　: 专门存放 MeFragment 界面数据的ViewModel
 */
class MeViewModel : BaseViewModel() {

    var name = StringObservableField("请先登录~")

    var gold = StringObservableField("")
    var info = StringObservableField("id：--")

    var imageUrl = StringObservableField(ColorUtil.randomImage())
}