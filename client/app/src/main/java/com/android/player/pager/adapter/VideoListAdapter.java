package com.android.player.pager.adapter;

import android.util.Log;
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
public class VideoListAdapter extends BaseNoimalAdapter<VideoBean, BaseViewHolder> {

    private final int mItemHeight;

    public VideoListAdapter(List<VideoBean> data) {
        super(R.layout.item_video_list,data);
        mItemHeight = ((ScreenUtils.getInstance().getScreenWidth() - ScreenUtils.getInstance().dpToPxInt(3f)) / 3) * 16 /11;
    }

    @Override
    protected void initItemView(BaseViewHolder viewHolder, int position, VideoBean data) {
        ((TextView) viewHolder.getView(R.id.item_title)).setText(data.getVideoName());
        FrameLayout itemRootView = (FrameLayout) viewHolder.getView(R.id.item_root_content);
//        Log.d("mItemHeight -- ", String.format("mItemHeight-- %d", mItemHeight));
        itemRootView.getLayoutParams().height= mItemHeight;
        ImageView imageCover = (ImageView) viewHolder.getView(R.id.item_img);
        GlideModel.getInstance().loadImage(imageCover, data.getImgUrl());
        PlayerUtils.getInstance().setOutlineProvider(imageCover,ScreenUtils.getInstance().dpToPxInt(7f));
        if (data.getFinish() == 1) {
            ((TextView) viewHolder.getView(R.id.item_count)).setText("已完结");
        } else {
            ((TextView) viewHolder.getView(R.id.item_count)).setText(String.format("更新至%d集", data.getCount()) );
        }
        ((TextView) viewHolder.getView(R.id.item_episodes)).setText("观看至5集");
    }
}