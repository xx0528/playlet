package com.android.player.pager.fragment;

import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.collection.SparseArrayCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.android.player.R;
import com.android.player.base.BaseFragment;
import com.android.player.base.BasePresenter;
import com.android.player.pager.activity.PagerPlayerActivity;
import com.android.player.pager.bean.VideoBean;
import com.android.player.utils.DataFactory;
import com.android.player.utils.ScreenUtils;
import com.android.player.utils.StatusUtils;
import com.google.android.material.tabs.TabLayout;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class HomeFragment extends BaseFragment {
    private static final String PERMISSION_WRITE_EXTERNAL = "android.permission.WRITE_EXTERNAL_STORAGE";//抖音视频缓存
    private static final String PERMISSION_READ_EXTERNAL = "android.permission.READ_EXTERNAL_STORAGE";//抖音视频缓存

    private List<String> mTabs;
    private ViewPager mViewPager;
    private final SparseArrayCompat<Fragment> mFragments = new SparseArrayCompat<>();
    private TabLayout mTabLayout;

    @Override
    protected int getLayoutID() { return R.layout.fragment_home; }

    @Override
    protected void initViews() {

        View statusBar = findViewById(R.id.home_status_bar);
        statusBar.getLayoutParams().height= ScreenUtils.getInstance().getStatusBarHeight(getActivity().getApplicationContext());
        StatusUtils.setStatusTextColor1(true, getActivity());//黑色字体

        mTabs = new ArrayList<>();
        mTabs.add(getString(R.string.tab_fav));
        mTabs.add(getString(R.string.tab_hot));

        mTabLayout = (TabLayout) findViewById(R.id.home_tab_layout);
        mTabLayout.addTab(mTabLayout.newTab().setText(mTabs.get(0)));
        mTabLayout.addTab(mTabLayout.newTab().setText(mTabs.get(1)));
        mTabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                int position = tab.getPosition();
                if(null!=mViewPager){
                    mViewPager.setCurrentItem(position,true);
                }
                if(null!=mTabLayout){
                    if(0==position){ //黑色字体
                        mTabLayout.setSelectedTabIndicatorColor(Color.parseColor("#333333"));
                        mTabLayout.setTabTextColors(Color.parseColor("#999999"),Color.parseColor("#333333"));
                        StatusUtils.setStatusTextColor1(true, getActivity());//黑色字体
                    }else{//白色字体
                        mTabLayout.setSelectedTabIndicatorColor(Color.parseColor("#FFFFFF"));
                        mTabLayout.setTabTextColors(Color.parseColor("#80FFFFFF"),Color.parseColor("#FFFFFFFF"));
                        StatusUtils.setStatusTextColor1(false, getActivity());//黑色字体
                    }
                }
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });
        mViewPager = (ViewPager) findViewById(R.id.home_video_pager);
        FragmentPagerAdapter adapter = new FragmentAdapter(getActivity().getSupportFragmentManager());
        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(mTabLayout));
        mViewPager.setAdapter(adapter);
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }


    /**
     * 导航播放
     * @param videoJson
     * @param position
     */
    public void navigationPlayer(String videoJson, int position) {
        if(TextUtils.isEmpty(videoJson)) return;
        List<VideoBean> data = new Gson().fromJson(videoJson, new TypeToken<List<VideoBean>>() {}.getType());
        navigationPlayer(data,position);
    }

    /**
     * 导航播放
     * @param data
     * @param position
     */
    public void navigationPlayer(List<VideoBean> data, int position) {
        if(mFragments.size() > 1 && null != mViewPager){
            PagerPlayerFragment fragment = (PagerPlayerFragment) mFragments.get(1);
            mViewPager.setCurrentItem(1,false);
            assert fragment != null;
            fragment.navigationPlayer(data,position);
        }
    }

    private class FragmentAdapter extends FragmentPagerAdapter{

        public FragmentAdapter(FragmentManager fm) {
            //setUserVisibleHint和setMaxLifecycle二选一,
            //当传入的behavior为BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT时，会切换到新版本的setMaxLifecycle(@NonNull Fragment fragment,@NonNull Lifecycle.State state)中
            super(fm,BEHAVIOR_SET_USER_VISIBLE_HINT);//这里兼容旧版本的setUserVisibleHint方法
        }

        @NonNull
        @Override
        public Fragment getItem(int position) {
            Fragment fragment = mFragments.get(position);
            if (fragment == null) {
                switch (position) {
                    default:
                    case 0:
                        fragment = new VideoListFragment();
                        break;
                    case 1:
                        fragment = new PagerPlayerFragment();
                        break;
                }
                mFragments.put(position, fragment);
            }
            return fragment;
        }

        @Override
        public int getCount() {
            return null!=mTabs&&mTabs.size()>0?mTabs.size():0;
        }
    }

}
