package com.smallplay.playlet.ui.activity

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
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


class EpisodesDialog : BottomSheetDialogFragment() {

    //fragment集合
    var fragments: ArrayList<Fragment> = arrayListOf()

    //标题集合
    var mDataList: ArrayList<String> = arrayListOf()

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
        dialog_episodes_close.setOnClickListener { appViewModel.dialogVisible.value = 0 }
        view_pager.init(this, fragments)
        magic_indicator.bindViewPager2(view_pager, mDataList)
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

            for (i in 0 until data.size) {
                fragments.add(EpisodeFragment.newInstance(i + 1))
            }
            magic_indicator.navigator.notifyDataSetChanged()
            view_pager.adapter?.notifyDataSetChanged()
            view_pager.offscreenPageLimit = fragments.size

        }
    }
}