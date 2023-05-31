package com.android.player.pager.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.android.player.R;
import com.android.player.pager.base.BaseViewPager;
import com.android.player.pager.bean.VideoBean;
import com.android.player.utils.GlideModel;
import com.android.player.utils.Logger;
import com.android.player.utils.ScreenUtils;

/**
 * created by hty
 * 2022/7/1
 * Desc:Pager片段播放器UI交互
 */
public class PagerVideoController extends BaseViewPager {

    private VideoBean mMediaInfo;
    private FrameLayout mPlayerContainer;

    public PagerVideoController(@NonNull Context context) {
        super(context);
    }

    public PagerVideoController(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    public PagerVideoController(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    protected int getLayoutId() {
        return R.layout.video_pager_layout;
    }

    @Override
    protected void initViews() {
        Logger.d(TAG,"initViews-->"+getPositionStr());
    }

    /**
     * 初始化绑定媒体信息
     * @param videoInfo 多媒体基本信息
     * @param position 位置
     */
    public void initMediaData(VideoBean videoInfo, int position) {
        super.mPosition =position;
        this.mMediaInfo=videoInfo;
        if(null!=mMediaInfo){
            TextView view_tv_name = (TextView) findViewById(R.id.view_tv_name);
            TextView view_tv_episode = (TextView) findViewById(R.id.view_tv_episode);
            TextView view_tv_like = (TextView) findViewById(R.id.view_tv_like);
            view_tv_name.setText(videoInfo.getVideoName());
            view_tv_episode.setText("第1集");
            view_tv_like.setText(ScreenUtils.getInstance().formatWan(videoInfo.getLikeCount(),true));
        }
    }

    /**
     * 返回播放器容器
     * @return
     */
    public ViewGroup getPlayerContainer(){
        if(null==mPlayerContainer){
            mPlayerContainer = findViewById(R.id.pager_player_container);
        }
        return mPlayerContainer;
    }

    public VideoBean getVideoData() {
        return mMediaInfo;
    }

    @Override
    public void prepare() {
        Logger.d(TAG,"prepare-->"+getPositionStr());
    }

    @Override
    public void resume() {
        Logger.d(TAG,"resume-->"+getPositionStr());
    }

    @Override
    public void pause() {
        Logger.d(TAG,"pause-->"+getPositionStr());
    }

    @Override
    public void stop() {
        Logger.d(TAG,"stop-->"+getPositionStr());
    }

    @Override
    public void error() {
        Logger.d(TAG,"error-->"+getPositionStr());
    }

    @Override
    public void onRelease() {
        Logger.d(TAG,"onRelease-->"+getPositionStr());
        ViewGroup playerContainer = getPlayerContainer();
        if(null!=playerContainer){
            playerContainer.removeAllViews();
        }
    }
}