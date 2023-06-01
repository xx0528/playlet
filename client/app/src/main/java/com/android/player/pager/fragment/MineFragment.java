package com.android.player.pager.fragment;

import android.view.View;
import android.widget.Toast;

import com.android.iplayer.video.cache.VideoCache;
import com.android.player.R;
import com.android.player.base.BaseFragment;
import com.android.player.base.BasePresenter;
import com.android.player.utils.Logger;

public class MineFragment extends BaseFragment  {
    @Override
    protected int getLayoutID() {
        return R.layout.fragment_mine;
    }

    @Override
    protected void initViews() {
        View settingView = findViewById(R.id.mine_setting);
        settingView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "点击了设置", Toast.LENGTH_SHORT).show();
            }
        });
        View contactView = findViewById(R.id.mine_contact);
        contactView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "点击了联系我们", Toast.LENGTH_SHORT).show();
            }
        });
        View feedbackView = findViewById(R.id.mine_feddback);
        feedbackView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "点击了反馈", Toast.LENGTH_SHORT).show();
            }
        });
        View aboutView = findViewById(R.id.mine_about);
        aboutView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "点击了关于", Toast.LENGTH_SHORT).show();
            }
        });
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
