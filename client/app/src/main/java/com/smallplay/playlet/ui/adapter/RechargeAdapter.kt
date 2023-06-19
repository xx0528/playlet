package com.smallplay.playlet.ui.adapter

import android.util.TypedValue
import android.widget.ImageView
import androidx.cardview.widget.CardView
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil

import com.smallplay.playlet.data.model.bean.RechargeResponse
import com.smallplay.playlet.data.model.enums.TodoType

/**
 * 积分排行 adapter
 * @Author:         hegaojian
 * @CreateDate:     2019/9/1 9:52
 */
class RechargeAdapter(data: ArrayList<RechargeResponse>) : BaseQuickAdapter<RechargeResponse, BaseViewHolder>(R.layout.item_recharge, data) {


    init {
        setAdapterAnimation(SettingUtil.getListMode())
    }

    override fun convert(holder: BaseViewHolder, item: RechargeResponse) {
        //赋值
        item.run {
            val pattern = Regex("""\d{4}-([\d]{2}-[\d]{2})T([\d]{2}:[\d]{2}:[\d]{2}).*""")
            val matchResult = pattern.find(time)

            val output = matchResult?.let {
                val date = it.groups[1]?.value
                val time = it.groups[2]?.value

                "$date $time".replace("T", " ")
            } ?: ""

            holder.setText(R.id.item_cost_row1, output)
            holder.setText(R.id.item_cost_row2, recharge.toString())
            holder.setText(R.id.item_cost_row3, buyGold.toString())
            holder.setText(R.id.item_cost_row4, giveGold.toString())
            holder.setText(R.id.item_cost_row5, leftGold.toString())
        }
    }
}


