package com.android.player.pager.widget;

import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.collection.SparseArrayCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.android.player.R;
import com.android.player.pager.activity.MainActivity;
import com.android.player.pager.bean.VideoBean;
import com.android.player.pager.fragment.EpisodesListFragment;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import com.google.android.material.tabs.TabLayout;

import java.util.ArrayList;
import java.util.List;

public class EpisodesDialog extends BottomSheetDialogFragment {
    private List<String> mTabs;
    private ViewPager mViewPager;
    private TabLayout mTabLayout;

    private VideoBean mVideoInfo;
    private int mCurPos;
    private final SparseArrayCompat<Fragment> mFragments = new SparseArrayCompat<>();

    public static EpisodesDialog newInstance(int id, int curPos) {
        EpisodesDialog dialog = new EpisodesDialog();
        Bundle args = new Bundle();
        args.putInt("videoId", id);
        args.putInt("curPos", curPos);
        dialog.setArguments(args);
        return dialog;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //设置背景透明，才能显示出layout中诸如圆角的布局，否则会有白色底（框）
        setStyle(BottomSheetDialogFragment.STYLE_NORMAL, R.style.CustomBottomSheetDialogTheme);

        Bundle args = getArguments();
        if (args != null) {
            int videoId = args.getInt("videoId");
            mCurPos = args.getInt("curPos");
            mVideoInfo = MainActivity.getInstance().getVideoById(videoId);
        }

    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.dialog_episodes, container, false);

        ImageView closeView = (ImageView)view.findViewById(R.id.dialog_episodes_close);
        closeView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });
        mTabs = new ArrayList<>();
        int pageSize = 30;

        int tabCount = (mVideoInfo.getCount() + pageSize - 1) / pageSize;  //计算tab页数（向上取整）

        for (int i = 0; i < tabCount; i++) {
            int start = i * pageSize + 1;
            int end = Math.min(start + pageSize - 1, mVideoInfo.getCount());  //避免最后一页的集数不足pageSize
            String title = start + "-" + end;
            mTabs.add(title);
        }

        //修改最后一页的标题
        String lastTitle = mTabs.get(mTabs.size() - 1);
        if (lastTitle.contains("-")) {
            String[] arr = lastTitle.split("-");
            int start = Integer.parseInt(arr[0]);
            int end = Integer.parseInt(arr[1]);
            if (end < mVideoInfo.getCount()) {  //最后一页的集数不足pageSize
                mTabs.set(mTabs.size() - 1, end + 1 + "-" + mVideoInfo.getCount());
            }
        }

        mTabLayout = (TabLayout) view.findViewById(R.id.episodes_dialog_tab_layout);
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
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });
        mViewPager = (ViewPager) view.findViewById(R.id.dialog_episodes_pager);
        FragmentPagerAdapter adapter = new EpisodesDialog.FragmentAdapter(getChildFragmentManager());
        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(mTabLayout));
        mViewPager.setAdapter(adapter);

        return view;
    }

    @Override
    public void onStart() {
        super.onStart();
        // 禁用对话框的拖动和滑动手势
        if (getDialog() != null) {
            // 禁用底部表单的手势
            BottomSheetBehavior.from(getDialog().findViewById(R.id.design_bottom_sheet)).setDraggable(false);
        }
    }

    public List<EpisodesListFragment.EpisodesListFragmentItem> getEpisodesListItemData(int pos) {

        List<EpisodesListFragment.EpisodesListFragmentItem> items = new ArrayList();
        for(int i = 1; i <= 30; i++) {
            int num = (pos * 30) + i;
            if (num >= mVideoInfo.getCount())
                break;
            boolean isPlay = false;
            if (num == mCurPos) {
                isPlay = true;
            }
            boolean isLock = false;
            if (mVideoInfo.getLockCount() >= num) {
                isLock = true;
            }
            items.add(new EpisodesListFragment.EpisodesListFragmentItem(num, isLock, isPlay));
        }

        return items;
    }

    private class FragmentAdapter extends FragmentPagerAdapter{
        public FragmentAdapter(FragmentManager fm) {
            //setUserVisibleHint和setMaxLifecycle二选一,
            //当传入的behavior为BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT时，会切换到新版本的setMaxLifecycle(@NonNull Fragment fragment,@NonNull Lifecycle.State state)中
            super(fm,BEHAVIOR_SET_USER_VISIBLE_HINT);//这里兼容旧版本的setUserVisibleHint方法
        }

        @Override
        public Fragment getItem(int position) {
            Fragment fragment = mFragments.get(position);
            if (fragment == null) {

                Bundle args = new Bundle();
                args.putInt("episodesPos", position);
                fragment = new EpisodesListFragment();
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

    private EpisodesDialog.OnMenuActionListener mOnMenuActionListener;

    public void setOnMenuActionListener(EpisodesDialog.OnMenuActionListener onMenuActionListener) {
        mOnMenuActionListener = onMenuActionListener;
    }
    public interface OnMenuActionListener{
        void onSelected(String url);
    }
}
