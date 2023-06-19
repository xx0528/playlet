package com.smallplay.playlet.viewmodel.state

import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel

/**
 * 描述　:
 */
class WebViewModel : BaseViewModel() {

    //是否收藏
    var collect = false

    //收藏的Id
    var ariticleId = 0

    //标题
    var showTitle: String = ""

    //访问网址
    var url: String = ""

    //类型
    var type: String = ""

    //点击的充值按钮
    var recharge: String = "-1"
    //需要收藏的类型 具体参数说明请看 CollectType 枚举类
    var collectType = 0
}