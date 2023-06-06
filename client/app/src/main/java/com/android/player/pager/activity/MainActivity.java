package com.android.player.pager.activity;

import android.annotation.SuppressLint;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.android.player.App;
import com.android.player.R;
import com.android.player.base.BaseActivity;
import com.android.player.base.BasePresenter;
import com.android.player.net.OnResultCallBack;
import com.android.player.pager.bean.ResVideoInfo;
import com.android.player.pager.bean.UserInfo;
import com.android.player.pager.bean.VideoBean;
import com.android.player.pager.fragment.HomeFragment;
import com.android.player.pager.fragment.MineFragment;
import com.android.player.pager.fragment.PagerPlayerFragment;
import com.android.player.pager.fragment.ParkFragment;
import com.android.player.pager.fragment.VideoListFragment;
import com.android.player.pager.widget.EpisodesDialog;
import com.android.player.utils.DataFactory;
import com.android.player.utils.ScreenUtils;
import com.android.player.utils.StatusUtils;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.gson.Gson;

import java.util.List;
import java.util.Locale;

public class MainActivity extends BaseActivity {

    private static MainActivity mInstance;
    private  String className= "MainActivity";

    private MineFragment mineFragment;
    private ParkFragment parkFragment;
    private HomeFragment homeFragment;


    private List<VideoBean> mVideos;
    private UserInfo userInfo;

    private int curPage;
    private EpisodesDialog mEpisodesDialog;

    public static MainActivity getInstance(){
        return mInstance;
    }

    @SuppressLint("NonConstantResourceId")
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setFullScreen(true);
        mInstance = this;
        curPage = 0;
        //设置繁体
        Resources resources = getResources();
        Configuration configuration = resources.getConfiguration();
        configuration.locale = Locale.TAIWAN; // 设置当前语言配置为繁体
        resources.updateConfiguration(configuration, resources.getDisplayMetrics());

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_playlet);
//
//        View statusBar = findViewById(R.id.status_bar);
//        findViewById(R.id.status_bar).getLayoutParams().height= ScreenUtils.getInstance().getStatusBarHeight(getApplicationContext());
//        StatusUtils.setStatusTextColor1(true, MainActivity.this);//黑色字体

        final BottomNavigationView bottomNavigationView = (BottomNavigationView) findViewById(R.id.nav_view);

        //bottomNavigationView Item 选择监听
        bottomNavigationView.setOnNavigationItemSelectedListener(item -> {
            FragmentManager fragmentManager = getSupportFragmentManager();
            FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
            hideAllFragment();
            switch (item.getItemId()){
                case R.id.navigation_home:
                    if (homeFragment == null) {
                        homeFragment = new HomeFragment();
                        fragmentTransaction.add(R.id.fragment_content, homeFragment, "HomeFragment")
                                .setReorderingAllowed(true)
                                .commit();
                    } else {
                        fragmentTransaction.show(homeFragment).commit();
                    }
                    break;
                case R.id.navigation_park:
                    if (parkFragment == null) {
                        parkFragment = new ParkFragment();
                        fragmentTransaction.add(R.id.fragment_content, parkFragment, "ParkFragment")
                                .setReorderingAllowed(true)
                                .commit();
                    } else {
                        fragmentTransaction.show(parkFragment).commit();
                    }

                    break;
                case R.id.navigation_mine:
                    if (mineFragment == null) {
                        mineFragment = new MineFragment();
                        fragmentTransaction.add(R.id.fragment_content, mineFragment, "MineFragment")
                                .setReorderingAllowed(true)
                                .commit();
                    } else {
                        fragmentTransaction.show(mineFragment).commit();
                    }

                    break;
            }

            return true;
        });
        bottomNavigationView.setSelectedItemId(bottomNavigationView.getMenu().getItem(0).getItemId());

        getVideoData();
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }

    //隐藏所有Fragment
    public void hideAllFragment(){
        FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        if (homeFragment != null) {
            fragmentTransaction.hide(homeFragment);
        }
        if (parkFragment != null) {
            fragmentTransaction.hide(parkFragment);
        }
        if (mineFragment != null) {
            fragmentTransaction.hide(mineFragment);
        }
        fragmentTransaction.commit();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK && event.getRepeatCount() == 0) {
            onBackPressed();
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onBackPressed() {
//        if(null!=mViewPager&&mViewPager.getCurrentItem()!=0){
//            mViewPager.setCurrentItem(0,true);
//            return;
//        }
        super.onBackPressed();
    }

    public List<VideoBean> getVideoList() {
        return mVideos;
    }

    private void getVideoData() {

        //获取视频列表播放
        //加载数据

        DataFactory.getInstance().GetVideoInfo(curPage, new OnResultCallBack<ResVideoInfo>() {

            @Override
            public void onResponse(ResVideoInfo data) {
                mVideos = data.data.list;
                Log.d(TAG,"请求成功---" + new Gson().toJson(data));
                homeFragment.setData(mVideos);
            }

            @Override
            public void onError(int code, String errorMsg) {
                Log.d(TAG, "请求失败" + code);
            }
        });
    }


    public void getMoreVideoData() {

        //获取视频列表播放
        //加载数据
        curPage++;
        DataFactory.getInstance().GetVideoInfo(curPage, new OnResultCallBack<ResVideoInfo>() {

            @Override
            public void onResponse(ResVideoInfo data) {
                mVideos.addAll(data.data.list);
                Log.d(TAG,"请求成功---" + new Gson().toJson(data));
                if (homeFragment != null)
                    homeFragment.setData(mVideos);
                if (parkFragment != null)
                    parkFragment.setData(mVideos);
            }

            @Override
            public void onError(int code, String errorMsg) {
                Log.d(TAG, "请求失败" + code);
            }
        });
    }
    public VideoBean getVideoById(int id) {
        for(VideoBean video : mVideos) {
            if (video.getVideoId() == id)
                return video;
        }
        return null;
    }

    public void setEpisodesDialog(EpisodesDialog dialog) {
        mEpisodesDialog = dialog;
    }

    public EpisodesDialog getEpisodesDialog() {
        return mEpisodesDialog;
    }
}
