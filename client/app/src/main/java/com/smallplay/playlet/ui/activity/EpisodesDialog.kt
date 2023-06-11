package com.smallplay.playlet.ui.activity

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ImageView
import androidx.fragment.app.Fragment
import androidx.viewpager.widget.ViewPager
import androidx.viewpager2.widget.ViewPager2
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.smallplay.playlet.R
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.ext.bindViewPager2
import com.smallplay.playlet.app.ext.init
import com.smallplay.playlet.ui.fragment.dialog.EpisodeFragment
import kotlinx.android.synthetic.main.dialog_episodes.*
import kotlinx.android.synthetic.main.dialog_episodes.magic_indicator
import kotlinx.android.synthetic.main.dialog_episodes.view_pager
import net.lucode.hackware.magicindicator.MagicIndicator


class EpisodesDialog : BottomSheetDialogFragment() {

    //fragment集合
    var fragments: ArrayList<Fragment> = arrayListOf()

    //标题集合
    var mDataList: ArrayList<String> = arrayListOf()

    lateinit var mViewPager : ViewPager2
    lateinit var mImageView : ImageView
    lateinit var mMagicIndicator : MagicIndicator

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        //设置背景透明，才能显示出layout中诸如圆角的布局，否则会有白色底（框）
        setStyle(STYLE_NORMAL, R.style.CustomBottomSheetDialogTheme)
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view: View = inflater.inflate(R.layout.dialog_episodes, container, false)
        mViewPager = view.findViewById<ViewPager2>(R.id.view_pager)
        mViewPager.init(this, fragments)

        mImageView = view.findViewById<ImageView>(R.id.dialog_episodes_close)
        mImageView.setOnClickListener {
            dismiss()
        }

        mMagicIndicator = view.findViewById<MagicIndicator>(R.id.magic_indicator)
        mMagicIndicator.bindViewPager2(mViewPager, mDataList)
        return view
    }

    override fun onStart() {
        super.onStart()
        // 禁用对话框的拖动和滑动手势
        if (dialog != null) {
            // 禁用底部表单的手势
            BottomSheetBehavior.from<View>(dialog!!.findViewById<View>(R.id.design_bottom_sheet)).isDraggable =
                false
        }

        var data = appViewModel.videoHomeDataState.value?.listData
        if (data != null) {

            dialog_video_name.text = data[0].videoName

            mDataList.clear()
            fragments.clear()

            val pageSize = 30

            val tabCount: Int = (data.size + pageSize - 1) / pageSize //计算tab页数（向上取整）

            for (i in 0 until tabCount) {
                val start = i * pageSize + 1
                val end = (start + pageSize - 1).coerceAtMost(data.size) //避免最后一页的集数不足pageSize
                val title = "$start-$end"
                mDataList.add(title)
            }

            //修改最后一页的标题
            val lastTitle: String = mDataList[mDataList.size - 1]
            if (lastTitle.contains("-")) {
                val arr = lastTitle.split("-".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()
                val start = arr[0].toInt()
                val end = arr[1].toInt()
                if (end < data.size) {  //最后一页的集数不足pageSize
                    mDataList[mDataList.size - 1] = (end + 1).toString() + "-" + data.size
                }
            }

            for (i in 0 until mDataList.size) {
                fragments.add(EpisodeFragment.newInstance(i))
            }
            mMagicIndicator.navigator.notifyDataSetChanged()
            mViewPager.adapter?.notifyDataSetChanged()
            mViewPager.offscreenPageLimit = fragments.size

        }
    }
}