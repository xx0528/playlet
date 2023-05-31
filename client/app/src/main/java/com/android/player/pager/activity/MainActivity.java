package com.android.player.pager.activity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.android.player.R;
import com.android.player.base.BaseActivity;
import com.android.player.base.BasePresenter;
import com.android.player.pager.fragment.HomeFragment;
import com.android.player.pager.fragment.MineFragment;
import com.android.player.pager.fragment.ParkFragment;
import com.android.player.pager.fragment.VideoListFragment;
import com.android.player.utils.ScreenUtils;
import com.android.player.utils.StatusUtils;
import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MainActivity extends BaseActivity {

    private  String className= "MainActivity";

    private MineFragment mineFragment;
    private ParkFragment parkFragment;
    private HomeFragment homeFragment;

    @SuppressLint("NonConstantResourceId")
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        setFullScreen(true);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_playlet);
//
//        View statusBar = findViewById(R.id.status_bar);
//        findViewById(R.id.status_bar).getLayoutParams().height= ScreenUtils.getInstance().getStatusBarHeight(getApplicationContext());
//        StatusUtils.setStatusTextColor1(true, MainActivity.this);//黑色字体

        final BottomNavigationView bottomNavigationView = (BottomNavigationView) findViewById(R.id.nav_view);

        //bottomNavigationView Item 选择监听
        bottomNavigationView.setOnNavigationItemSelectedListener(item -> {
            Log.d("123", "onNavigationItemSelected is click: ");
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
                        Log.d("fragment -- ", "创建 homeFragment");
                    } else {
                        fragmentTransaction.show(homeFragment).commit();
                        Log.d("fragment -- ", "显示 homeFragment");
                    }
                    break;
                case R.id.navigation_park:
                    if (parkFragment == null) {
                        parkFragment = new ParkFragment();
                        fragmentTransaction.add(R.id.fragment_content, parkFragment, "ParkFragment")
                                .setReorderingAllowed(true)
                                .commit();
                        Log.d("fragment -- ", "创建 parkFragment");
                    } else {
                        fragmentTransaction.show(parkFragment).commit();
                        Log.d("fragment -- ", "显示 parkFragment");
                    }

                    break;
                case R.id.navigation_mine:
                    Log.d(className, "R.string.title_notification: ");
                    if (mineFragment == null) {
                        mineFragment = new MineFragment();
                        fragmentTransaction.add(R.id.fragment_content, mineFragment, "MineFragment")
                                .setReorderingAllowed(true)
                                .commit();
                        Log.d("fragment -- ", "创建 mineFragment");
                    } else {
                        fragmentTransaction.show(mineFragment).commit();
                        Log.d("fragment -- ", "显示 mineFragment");
                    }

                    break;
            }

            return true;
        });
        bottomNavigationView.setSelectedItemId(bottomNavigationView.getMenu().getItem(0).getItemId());
    }

    @Override
    protected BasePresenter createPresenter() {
        return null;
    }

    //隐藏所有Fragment
    public void hideAllFragment(){
        FragmentTransaction fragmentTransaction = getSupportFragmentManager().beginTransaction();
        if (homeFragment != null) {
            Log.d("123", "homeFragment hide: ");
            fragmentTransaction.hide(homeFragment);
            Log.d("123", "homeFragment hide:22332 ");
        }
        if (parkFragment != null) {
            Log.d("123", "parkFragment  hide: ");

            fragmentTransaction.hide(parkFragment);
            Log.d("123", "parkFragment  hide:111 ");
        }
        if (mineFragment != null) {
            Log.d("123", "mineFragment hide: ");

            fragmentTransaction.hide(mineFragment);
            Log.d("123", "mineFragment hide:111222 ");
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
}
