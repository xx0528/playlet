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
import com.android.player.pager.fragment.EpisodesListFragment;
import com.android.player.utils.GlideModel;
import com.android.player.utils.ScreenUtils;

import java.util.List;

/**
 * created by hty
 * 2022/7/1
 * Desc:视频列表适配器
 */
public class EpisodesListAdapter extends BaseNoimalAdapter<EpisodesListFragment.EpisodesListFragmentItem, BaseViewHolder> {

    public EpisodesListAdapter(List<EpisodesListFragment.EpisodesListFragmentItem> data) {
        super(R.layout.item_details_dialog_episodes_list,data);
    }

    @Override
    protected void initItemView(BaseViewHolder viewHolder, int position, EpisodesListFragment.EpisodesListFragmentItem data) {
        ((TextView) viewHolder.getView(R.id.park_item_episodes)).setText(Integer.toString(position));
        ((ImageView) viewHolder.getView(R.id.episodes_lock_icon)).setVisibility(View.VISIBLE);
    }
}