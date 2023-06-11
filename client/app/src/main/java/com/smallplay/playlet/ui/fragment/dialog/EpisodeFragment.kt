package com.smallplay.playlet.ui.fragment.dialog


import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import com.blankj.utilcode.util.ConvertUtils
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment
import com.smallplay.playlet.app.ext.init
import com.smallplay.playlet.app.weight.recyclerview.SpaceItemDecoration
import com.smallplay.playlet.data.model.bean.EpisodesItem
import com.smallplay.playlet.databinding.IncludeListBinding
import com.smallplay.playlet.ui.adapter.EpisodesAdapter
import com.smallplay.playlet.viewmodel.state.EpisodesViewModel
import kotlinx.android.synthetic.main.include_recyclerview.*


/**
 * Desc:列表
 */
class EpisodeFragment : BaseFragment<EpisodesViewModel, IncludeListBinding>() {

    //适配器
    private val episodesAdapter: EpisodesAdapter by lazy { EpisodesAdapter(arrayListOf()) }

    //集数 第几页
    private var mEpisodePageNum = 0

    override fun initView(savedInstanceState: Bundle?) {

        arguments?.let {
            mEpisodePageNum = it.getInt("num")
        }

        //初始化recyclerView
        recyclerView.init(GridLayoutManager(context, 6, GridLayoutManager.VERTICAL, false), episodesAdapter).let {
            it.addItemDecoration(SpaceItemDecoration(0, ConvertUtils.dp2px(8f)))
        }
        episodesAdapter.run {
            setOnItemClickListener { adapter, view, position ->
                //选集播放
                appViewModel.curPlayVideoNo.value = mEpisodePageNum*30 + position + 1
            }
        }
    }

    override fun initData() {
        var list = arrayListOf<EpisodesItem>()
        var videoInfo = appViewModel.videoHomeDataState.value?.listData?.get(0)
        if (videoInfo != null) {
            for (i in 1 until videoInfo.count + 1) {
                list.add(EpisodesItem(i + mEpisodePageNum * 30, i > videoInfo.freeCount, i > videoInfo.lockCount))
            }
        }
        episodesAdapter.setList(list)
    }
    companion object {
        fun newInstance(num: Int): EpisodeFragment {
            val args = Bundle()
            args.putInt("num", num)
            val fragment = EpisodeFragment()
            fragment.arguments = args
            return fragment
        }
    }
}