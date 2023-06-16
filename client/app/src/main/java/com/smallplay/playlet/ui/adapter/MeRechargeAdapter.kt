package com.smallplay.playlet.ui.adapter

import android.view.View
import android.widget.TextView
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import com.chad.library.adapter.base.BaseDelegateMultiAdapter
import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.viewholder.BaseViewHolder
import com.smallplay.playlet.R
import com.smallplay.playlet.app.ext.setAdapterAnimation
import com.smallplay.playlet.app.util.SettingUtil
import com.smallplay.playlet.app.weight.customview.CollectView
import com.smallplay.playlet.data.model.bean.CollectResponse
import com.smallplay.playlet.data.model.bean.LocalLikeVideos
import com.smallplay.playlet.data.model.bean.RechargeData
import me.hgj.jetpackmvvm.ext.util.toHtml

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
            //人民币
            if (moneyType == 0) {
                holder.setText(R.id.item_me_recharge_cost, "￥${costMoney}")
            // 港元
            } else if (moneyType == 1) {
                holder.setText(R.id.item_me_recharge_cost, "HK$${costMoney}")
            // 台币
            } else if (moneyType == 2) {
                holder.setText(R.id.item_me_recharge_cost, "NT$${costMoney}")
            // 美元
            } else if (moneyType == 3) {
                holder.setText(R.id.item_me_recharge_cost, "$${costMoney}")
            }

            var goldStr = "$buyGold"
            if (giveGold > 0) {
                goldStr = "$goldStr+${giveGold}" + context.getString(R.string.text_me_recharge_give_gold)
            }
            holder.setText(R.id.item_me_recharge_gold, goldStr)

            var giveView = holder.getView<TextView>(R.id.item_me_recharge_give)
            if (giveMoney > 0) {
                giveView.visibility = View.VISIBLE
                holder.setText(R.id.item_me_recharge_give,  String.format(context.getString(R.string.text_me_give_money), giveMoney))
            } else {
                giveView.visibility = View.INVISIBLE
            }
        }

    }
}

