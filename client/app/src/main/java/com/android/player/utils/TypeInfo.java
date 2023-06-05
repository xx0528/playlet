package com.android.player.utils;

import com.android.player.R;

public class TypeInfo {

    public enum VideoType {
        //精选
        TYPE_JINGXUAN,
        //逆袭
        TYPE_NIXI,
        //赘婿
        TYPE_ZHUIXU,
        //神豪
        TYPE_SHENHAO,
        //美女
        TYPE_MEINV,
        //神医
        TYPE_SHENYI,
        //现言
        TYPE_XIANYAN,
        //乡村
        TYPE_XIANGCUN,
        //重生
        TYPE_CHONGSHENG,
        //暧昧
        TYPE_AIMEI,
        //家庭
        TYPE_JIATING,
    }

    public String getVideTypeName(VideoType typeId) {
        switch (typeId) {
            case TYPE_JINGXUAN:
                return DataFactory.getInstance().getString(R.string.tab_hot,"精选");
            case TYPE_NIXI:
                return DataFactory.getInstance().getString(R.string.tab_nixi,"逆袭");
            case TYPE_ZHUIXU:
                return DataFactory.getInstance().getString(R.string.tab_zhuixu,"赘婿");
            case TYPE_SHENHAO:
                return DataFactory.getInstance().getString(R.string.tab_shenhao,"神豪");
            case TYPE_MEINV:
                return DataFactory.getInstance().getString(R.string.tab_meinv,"美女");
            case TYPE_SHENYI:
                return DataFactory.getInstance().getString(R.string.tab_shenyi,"神医");
            case TYPE_XIANYAN:
                return DataFactory.getInstance().getString(R.string.tab_xianyan,"现言");
            case TYPE_XIANGCUN:
                return DataFactory.getInstance().getString(R.string.tab_xiangcun,"乡村");
            case TYPE_CHONGSHENG:
                return DataFactory.getInstance().getString(R.string.tab_chongsheng,"重生");
            case TYPE_AIMEI:
                return DataFactory.getInstance().getString(R.string.tab_aimei,"暧昧");
            case TYPE_JIATING:
                return DataFactory.getInstance().getString(R.string.tab_jiating,"家庭");
            default:
                return "未知";
        }
    }
}
