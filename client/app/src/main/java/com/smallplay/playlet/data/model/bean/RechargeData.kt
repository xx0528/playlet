package com.smallplay.playlet.data.model.bean

import android.annotation.SuppressLint
import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

@SuppressLint("ParcelCreator")
@Parcelize
data class RechargeData(
    var moneyType: Int,     //货币类型
    var costMoney: String,     //充值金额
    var giveMoney: String,     //多送价值
    var buyGold: String,       //购买金币
    var giveGold: String,      //赠送金币
    var firstRecharge: Int  //是否是首冲奖励

): Parcelable
