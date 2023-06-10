package com.smallplay.playlet.ui.adapter

import android.view.View
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.data.model.bean.EpisodesItem


/**
 * Desc:集数列表适配器
 */
class EpisodesAdapter(data: MutableList<EpisodesItem>?) :
    BaseQuickAdapter<EpisodesItem, BaseViewHolder>(
        R.layout.item_dialog_episode, data
    ) {

    override fun convert(holder: BaseViewHolder, item: EpisodesItem) {
        holder.setText(R.id.park_item_episodes, item.num)
        if (item.lock) {
            holder.getView<View>(R.id.episodes_lock_icon).visibility = View.VISIBLE
        } else {
            holder.getView<View>(R.id.episodes_lock_icon).visibility = View.INVISIBLE
        }

    }

}