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
public class VideoListFragment extends BaseFragment {

    private VideoListAdapter mAdapter;


    @Override
    protected int getLayoutID() {
        return R.layout.fragment_video_list;
    }

    @Override
    protected void initViews() {
        ImageView status_bar = (ImageView) findViewById(R.id.video_bar_image);
        status_bar.getLayoutParams().height= ScreenUtils.getInstance().getStatusBarHeight(getContext())+ScreenUtils.getInstance().dpToPxInt(49f);
        status_bar.setImageResource(R.mipmap.ic_title_bg);

        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.video_recycler_view);
        recyclerView.setHasFixedSize(true);
        //列表适配器初始化
        GridLayoutManager layoutManager = new GridLayoutManager(getContext(), 3, GridLayoutManager.VERTICAL, false);
        recyclerView.setLayoutManager(layoutManager);
        mAdapter = new VideoListAdapter(MainActivity.getInstance().getVideoList());
        mAdapter.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(View view, int position, long itemId) {
                if(getActivity() instanceof MainActivity){
                    HomeFragment homeFragment = (HomeFragment) getActivity().getSupportFragmentManager().findFragmentByTag("HomeFragment");
//                    PagerPlayerActivity pagerPlayerActivity = (PagerPlayerActivity) getActivity();
//                    List<VideoBean> data = mAdapter.getData();
//                    String videoJson = new Gson().toJson(data);
                    homeFragment.navigationPlayer(mAdapter.getData(),position);
                }
            }
        });
        recyclerView.setHasFixedSize(true);
        recyclerView.setAdapter(mAdapter);

//        //加载数据
//        DataFactory.getInstance().getTikTopVideo(new DataFactory.OnCallBackListener() {
//            @Override
//            public void onList(List<VideoBean> data) {
//                if (null != mAdapter) {
//                    mAdapter.setNewData(data);
//                    HomeFragment homeFragment = (HomeFragment) getActivity().getSupportFragmentManager().findFragmentByTag("HomeFragment");
////                    PagerPlayerActivity pagerPlayerActivity = (PagerPlayerActivity) getActivity();
////                    List<VideoBean> data = mAdapter.getData();
////                    String videoJson = new Gson().toJson(data);
//                    homeFragment.navigationPlayer(data, (int)Math.random()*data.size());
//                }
//            }
//        });
    }

    public void setNewData(List<VideoBean> data) {
        Log.d("videoList -- ", "setNewData --- 1");
        if(null!=mAdapter) mAdapter.setNewData(null);
        mAdapter.setNewData(data);
        Log.d("videoList -- ", "setNewData --- 2");
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }
}