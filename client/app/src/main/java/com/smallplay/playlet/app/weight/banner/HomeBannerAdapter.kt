package com.smallplay.playlet.app.weight.banner

/**
 * 描述　:
 */

import android.view.View
import com.zhpan.bannerview.BaseBannerAdapter
import com.smallplay.playlet.R
import com.smallplay.playlet.data.model.bean.BannerResponse

class HomeBannerAdapter : BaseBannerAdapter<BannerResponse, HomeBannerViewHolder>() {
    override fun getLayoutId(viewType: Int): Int {
        return R.layout.banner_itemhome
    }

    override fun createViewHolder(itemView: View, viewType: Int): HomeBannerViewHolder {
        return HomeBannerViewHolder(itemView);
    }

    override fun onBind(
        holder: HomeBannerViewHolder?,
        data: BannerResponse?,
        position: Int,
        pageSize: Int
    ) {
        holder?.bindData(data, position, pageSize);
    }


}
