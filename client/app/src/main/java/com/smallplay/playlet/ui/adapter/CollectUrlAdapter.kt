package com.smallplay.playlet.ui.adapter

import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.app.weight.customview.CollectView
import com.smallplay.playlet.data.model.bean.CollectUrlResponse
import me.hgj.jetpackmvvm.ext.util.toHtml


class CollectUrlAdapter(data: ArrayList<CollectUrlResponse>) :
    BaseQuickAdapter<CollectUrlResponse, BaseViewHolder>(
        R.layout.item_collecturl, data
    ) {

    private var collectAction: (item: CollectUrlResponse, v: CollectView, position: Int) -> Unit =
        { _: CollectUrlResponse, _: CollectView, _: Int -> }

    init {
        setAdapterAnimation(SettingUtil.getListMode())
    }

    override fun convert(holder: BaseViewHolder, item: CollectUrlResponse) {
        //赋值
        item.run {
            holder.setText(R.id.item_collecturl_name, name.toHtml())
            holder.setText(R.id.item_collecturl_link, link)
            holder.getView<CollectView>(R.id.item_collecturl_collect).isChecked = true
        }
        holder.getView<CollectView>(R.id.item_collecturl_collect)
            .setOnCollectViewClickListener(object : CollectView.OnCollectViewClickListener {
                override fun onClick(v: CollectView) {
                    collectAction.invoke(item, v, holder.adapterPosition)
                }
            })
    }

    fun setCollectClick(inputCollectAction: (item: CollectUrlResponse, v: CollectView, position: Int) -> Unit) {
        this.collectAction = inputCollectAction
    }
}


