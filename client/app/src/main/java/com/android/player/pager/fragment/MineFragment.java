package com.android.player.pager.fragment;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.android.iplayer.video.cache.VideoCache;
import com.android.player.R;
import com.android.player.base.BaseFragment;
import com.android.player.base.BasePresenter;
import com.android.player.utils.Logger;

import java.util.Locale;

public class MineFragment extends BaseFragment  {

    private View mViewSetting;
    private View mViewContact;
    private View mViewFeedback;
    private View mViewAbout;
    @Override
    protected int getLayoutID() {
        return R.layout.fragment_mine;
    }

    @Override
    protected void initViews() {

        View settingView = findViewById(R.id.mine_setting);

        mViewSetting = findViewById(R.id.mine_setting);
        mViewContact = findViewById(R.id.mine_contact);
        mViewFeedback = findViewById(R.id.mine_feddback);
        mViewAbout = findViewById(R.id.mine_about);
        setListener();
    }

    private void setListener() {
        Onclick click = new Onclick();
        mViewSetting.setOnClickListener(click);
        mViewContact.setOnClickListener(click);
        mViewFeedback.setOnClickListener(click);
        mViewAbout.setOnClickListener(click);
    }

    private class Onclick implements View.OnClickListener {

        @SuppressLint("NonConstantResourceId")
        @Override
        public void onClick(View view) {

            Intent intent = null;
            switch (view.getId()) {
                case R.id.mine_setting:
                    Toast.makeText(getContext(), "点击了设置", Toast.LENGTH_SHORT).show();
                    break;
                case R.id.mine_contact:
                    Toast.makeText(getContext(), "点击了联系我们", Toast.LENGTH_SHORT).show();
                    break;
                case R.id.mine_feddback:
                    Toast.makeText(getContext(), "点击了反馈", Toast.LENGTH_SHORT).show();
                    break;
                case R.id.mine_about:
                    Toast.makeText(getContext(), "点击了关于", Toast.LENGTH_SHORT).show();
                    break;
            }
        }
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
}
