package com.smallplay.playlet.viewmodel.state

import androidx.databinding.ObservableField
import me.hgj.jetpackmvvm.base.viewmodel.BaseViewModel
import com.smallplay.playlet.data.model.bean.IntegralResponse

/**
 * 描述　:
 */
class IntegralViewModel : BaseViewModel() {

    var rank = ObservableField<IntegralResponse>()
}