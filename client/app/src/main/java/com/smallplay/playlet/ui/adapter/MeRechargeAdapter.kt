package com.smallplay.playlet.ui.adapter

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.data.model.bean.RechargeData

class MeRechargeAdapter(data: MutableList<RechargeData>?) :
    BaseQuickAdapter<RechargeData, BaseViewHolder>(
        R.layout.item_me_recharge, data
    ) {

    override fun convert(holder: BaseViewHolder, item: RechargeData) {

        //项目布局的赋值
        item.run {
            var firstView = holder.getView<TextView>(R.id.item_me_recharge_first)
            if (firstRecharge == 0) {
                firstView.visibility = View.INVISIBLE
            } else {
                firstView.visibility = View.VISIBLE
            }
            holder.setText(R.id.item_me_recharge_cost, costMoney)
            //人民币
//            if (moneyType == 0) {
//                holder.setText(R.id.item_me_recharge_cost, "￥${costMoney}")
//            // 港元
//            } else if (moneyType == 1) {
//                holder.setText(R.id.item_me_recharge_cost, "HK$${costMoney}")
//            // 台币
//            } else if (moneyType == 2) {
//                holder.setText(R.id.item_me_recharge_cost, "NT$${costMoney}")
//            // 美元
//            } else if (moneyType == 3) {
//                holder.setText(R.id.item_me_recharge_cost, "$${costMoney}")
//            }

//            var goldStr = "$buyGold"
//            if (giveGold > 0) {
//                goldStr = "$goldStr+${giveGold}" + context.getString(R.string.text_me_recharge_give_gold)
//            }


            var goldIcon = holder.getView<ImageView>(R.id.item_me_recharge_icon)
            holder.setText(R.id.item_me_recharge_gold, buyGold)
            var buyGoldView = holder.getView<TextView>(R.id.item_me_recharge_gold)
            if (buyGold == "0") {
                buyGoldView.visibility = View.GONE
            } else {
                buyGoldView.visibility = View.VISIBLE
            }

            var giveView = holder.getView<TextView>(R.id.item_me_recharge_give)
            if (giveMoney != "0") {
                giveView.visibility = View.VISIBLE
                holder.setText(R.id.item_me_recharge_give,  giveMoney)
                goldIcon.visibility = View.VISIBLE
            } else {
                giveView.visibility = View.INVISIBLE
                goldIcon.visibility = View.INVISIBLE
            }
        }

    }
}


