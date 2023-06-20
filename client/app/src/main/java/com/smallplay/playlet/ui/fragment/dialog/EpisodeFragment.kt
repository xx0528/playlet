package com.smallplay.playlet.ui.fragment.dialog


import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import com.google.gson.Gson
import com.smallplay.playlet.app.appViewModel
import com.smallplay.playlet.app.base.BaseFragment1
import com.smallplay.playlet.app.ext.init
import com.smallplay.playlet.app.ext.jumpByBind
import com.smallplay.playlet.app.util.CacheUtil
import com.smallplay.playlet.data.model.bean.EpisodesItem
import com.smallplay.playlet.databinding.FragmentEpisodesBinding
import com.smallplay.playlet.ui.adapter.EpisodesAdapter
import com.smallplay.playlet.viewmodel.state.EpisodesViewModel
import me.hgj.jetpackmvvm.ext.nav


/**
 * Desc:列表
 */
class EpisodeFragment : BaseFragment1<EpisodesViewModel, FragmentEpisodesBinding>() {

    //适配器
    private val episodesAdapter: EpisodesAdapter by lazy { EpisodesAdapter(arrayListOf()) }

    //集数 第几页
    private var mEpisodePageNum = 0

    val TAG = "EpisodeFragment-----"

    override fun initView(savedInstanceState: Bundle?) {

        arguments?.let {
            mEpisodePageNum = it.getInt("num")
        }

        //初始化recyclerView
        mViewBind.dialogEpisodesRecyclerView.init(GridLayoutManager(context, 6, GridLayoutManager.VERTICAL, false), episodesAdapter)
        episodesAdapter.run {
            setOnItemClickListener { adapter, view, position ->
                //选集播放
//                appViewModel.curPlayVideoNo.value = mEpisodePageNum*30 + position
                var freeCount = appViewModel.videoHomeDataState.value?.listData?.get(position)?.freeCount
                if (position >= freeCount!! && !CacheUtil.isBind()) {
                    appViewModel.dialogVisible.value = 0
                    nav().jumpByBind{}
                } else {
                    appViewModel.reqPlay(mEpisodePageNum*30 + position)
                }
            }
        }
    }

    override fun initData() {
        var list = arrayListOf<EpisodesItem>()
        var videoInfo = appViewModel.videoHomeDataState.value?.listData?.get(0)

        val buyVideos = Gson().fromJson(appViewModel.buyVideos.value ?: "", Map::class.java)
        var buyEpisode = 0
        if (buyVideos != null && videoInfo != null) {
            for ((key, eps) in buyVideos) {
                if (key.toString().toInt() == videoInfo.ID) {
                    buyEpisode = (eps as Number).toInt()
                    break
                }
            }
        }

        if (videoInfo != null) {
            for (i in 1 until 31) {
                var episodeNum = i + mEpisodePageNum * 30
                if (episodeNum < videoInfo.count+1) {
                    list.add(EpisodesItem(episodeNum, episodeNum > videoInfo.freeCount, buyEpisode >= episodeNum, episodeNum > videoInfo.lockCount))
                }
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