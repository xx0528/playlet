package com.smallplay.playlet.ui.adapter

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
            if (firstRecharge == 0) {
                holder.setEnabled(R.id.item_me_recharge_first, false)
            } else {
                holder.setEnabled(R.id.item_me_recharge_first, true)
            }
            //人民币
            if (moneyType == 0) {
                holder.setText(R.id.item_me_recharge_cost, "CNY￥${costMoney}")
            // 港元
            } else if (moneyType == 1) {
                holder.setText(R.id.item_me_recharge_cost, "HKD$${costMoney}")
            // 台币
            } else if (moneyType == 2) {
                holder.setText(R.id.item_me_recharge_cost, "TWD$${costMoney}")
            // 美元
            } else if (moneyType == 3) {
                holder.setText(R.id.item_me_recharge_cost, "$${costMoney}")
            }

            var goldStr = "$buyGold"
            if (giveGold > 0) {
                goldStr = "$goldStr+${giveGold}赠币"
            }
            holder.setText(R.id.item_me_recharge_gold, goldStr)

            if (giveMoney > 0) {
                holder.setEnabled(R.id.item_me_recharge_give, true)
                holder.setText(R.id.item_me_recharge_give, "多送${giveMoney}元")
            } else {
                holder.setEnabled(R.id.item_me_recharge_give, false)
            }
        }

    }
}


