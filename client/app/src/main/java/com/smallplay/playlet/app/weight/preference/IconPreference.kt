package com.smallplay.playlet.app.weight.preference

import android.content.Context
import android.util.AttributeSet
import androidx.preference.Preference
import androidx.preference.PreferenceViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.util.SettingUtil


/**
 * @Author:         hegaojian
 * @CreateDate:     2019/8/12 14:23
 */

class IconPreference(context: Context, attrs: AttributeSet) : Preference(context, attrs) {

    var circleImageView: MyColorCircleView? = null

    init {
        widgetLayoutResource = R.layout.item_icon_preference_preview
    }

    fun setView() {
        val color = SettingUtil.getColor(context)
        circleImageView?.color = color
        circleImageView?.border = color
    }
}