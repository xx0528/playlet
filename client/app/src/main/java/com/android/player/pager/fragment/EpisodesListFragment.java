package com.android.player.pager.fragment;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.player.R;
import com.android.player.base.BaseFragment;
import com.android.player.base.BasePresenter;
import com.android.player.base.adapter.interfaces.OnItemClickListener;
import com.android.player.pager.activity.MainActivity;
import com.android.player.pager.adapter.EpisodesListAdapter;
import com.android.player.pager.adapter.VideoListAdapter;
import com.android.player.pager.bean.VideoBean;
import com.android.player.utils.DataFactory;
import com.android.player.utils.ScreenUtils;

import java.util.List;

/**
 * created by hty
 * 2022/7/1
 * Desc:列表
 */
public class EpisodesListFragment extends BaseFragment {

    private EpisodesListAdapter mAdapter;
    private int mEpisodesPos;

    @Override
    protected int getLayoutID() {
        return R.layout.fragment_dialog_episodes;
    }

    @Override
    protected void initViews() {
        mEpisodesPos = getArguments().getInt("episodesPos");
        Log.d("episodesPos- --- ", Integer.toString(mEpisodesPos));

        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.dialog_episodes_recycler_view);
        recyclerView.setHasFixedSize(true);
        //列表适配器初始化
        GridLayoutManager layoutManager = new GridLayoutManager(getContext(), 6, GridLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);
        mAdapter = new EpisodesListAdapter(null);
        mAdapter.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position, long itemId) {

            }
        });
        recyclerView.setHasFixedSize(true);
        recyclerView.setAdapter(mAdapter);
    }

    public void setData(int pos) {
//        mAdapter.setNewData();
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }
}