package com.android.player.pager.fragment;

import android.graphics.Color;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.collection.SparseArrayCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.android.player.R;
import com.android.player.base.BaseFragment;
import com.android.player.base.BasePresenter;
import com.android.player.utils.StatusUtils;
import com.google.android.material.tabs.TabLayout;

import java.util.ArrayList;
import java.util.List;

public class ParkFragment extends BaseFragment {

    private List<String> mTabs;
    private ViewPager mViewPager;
    private TabLayout mTabLayout;
    private final SparseArrayCompat<Fragment> mFragments = new SparseArrayCompat<>();

    @Override
    protected int getLayoutID() {
        return R.layout.fragment_park;
    }

    @Override
    protected void initViews() {
        mTabs = new ArrayList<>();
        mTabs.add(getString(R.string.tab_hot));
        mTabs.add(getString(R.string.tab_fav));
        mTabs.add(getString(R.string.tab_hot));
        mTabs.add(getString(R.string.tab_nixi));
        mTabs.add(getString(R.string.tab_zhuixu));
        mTabs.add(getString(R.string.tab_shenhao));
        mTabs.add(getString(R.string.tab_meinv));
//        mTabs.add(getString(R.string.tab_shenyi));
//        mTabs.add(getString(R.string.tab_xianyan));
//        mTabs.add(getString(R.string.tab_xiangcun));
//        mTabs.add(getString(R.string.tab_chongsheng));
//        mTabs.add(getString(R.string.tab_aimei));
//        mTabs.add(getString(R.string.tab_jiating));

        mTabLayout = (TabLayout) findViewById(R.id.tab_layout);
        for (int i = 0; i < mTabs.size(); i++) {
            mTabLayout.addTab(mTabLayout.newTab().setText(mTabs.get(i)));
        }
        mTabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                int position = tab.getPosition();
                if(null != mViewPager){
                    mViewPager.setCurrentItem(position,true);
                }
//                if(null!=mTabLayout){
//                    if(0==position){ //黑色字体
//                        mTabLayout.setSelectedTabIndicatorColor(Color.parseColor("#333333"));
//                        mTabLayout.setTabTextColors(Color.parseColor("#999999"),Color.parseColor("#333333"));
//                        StatusUtils.setStatusTextColor1(true, getActivity());//黑色字体
//                    }else{//白色字体
//                        mTabLayout.setSelectedTabIndicatorColor(Color.parseColor("#FFFFFF"));
//                        mTabLayout.setTabTextColors(Color.parseColor("#80FFFFFF"),Color.parseColor("#FFFFFFFF"));
//                        StatusUtils.setStatusTextColor1(false, getActivity());//黑色字体
//                    }
//                }
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });
        mViewPager = (ViewPager) findViewById(R.id.video_pager);
        FragmentPagerAdapter adapter = new ParkFragment.FragmentAdapter(getActivity().getSupportFragmentManager());
        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(mTabLayout));
        mViewPager.setAdapter(adapter);
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }

    @Override
    protected void onInvisible() {
        super.onInvisible();
    }

    @Override
    protected void onVisible() {
        super.onVisible();
    }


    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public void onPause() {
        super.onPause();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
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
                Bundle args = new Bundle();
                args.putInt("typeId", position);
                fragment = new ParkListFragment();
                fragment.setArguments(args);

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
