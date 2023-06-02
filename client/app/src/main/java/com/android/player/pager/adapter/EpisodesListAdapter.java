package com.android.player.pager.adapter;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.iplayer.utils.PlayerUtils;
import com.android.player.R;
import com.android.player.base.adapter.BaseNoimalAdapter;
import com.android.player.base.adapter.widget.BaseViewHolder;
import com.android.player.pager.bean.VideoBean;
import com.android.player.utils.GlideModel;
import com.android.player.utils.ScreenUtils;

import java.util.List;

/**
 * created by hty
 * 2022/7/1
 * Desc:视频列表适配器
 */
public class EpisodesListAdapter extends BaseNoimalAdapter<VideoBean, BaseViewHolder> {

    private final int mItemHeight;

    public EpisodesListAdapter(List<VideoBean> data) {
        super(R.layout.item_details_dialog_episodes_list,data);
        mItemHeight = ((ScreenUtils.getInstance().getScreenWidth() - ScreenUtils.getInstance().dpToPxInt(3f)) / 3) * 16 /11;
    }

    @Override
    protected void initItemView(BaseViewHolder viewHolder, int position, VideoBean data) {
        ((TextView) viewHolder.getView(R.id.park_item_episodes)).setText(Integer.toString(position));
        ((ImageView) viewHolder.getView(R.id.episodes_lock_icon)).setVisibility(View.VISIBLE);
    }
}