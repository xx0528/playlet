package com.smallplay.playlet.ui.video

import android.content.Context
import android.util.Log
import android.view.View
import androidx.annotation.NonNull
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.PagerSnapHelper
import androidx.recyclerview.widget.RecyclerView


/**
 * Desc:这是一个适用于RecyclerView ITEM分页(item占满全屏)LayoutManager,回调抛出选中的项和正要被销毁的项
 */
class ViewPagerLayoutManager(context: Context?, orientation: Int, reverseLayout: Boolean) :
    LinearLayoutManager(context, orientation, reverseLayout),
    RecyclerView.OnChildAttachStateChangeListener {
    private val mPagerSnapHelper: PagerSnapHelper?
    private var mOnViewPagerListener: OnViewPagerListener? = null
    private var mDrift //位移，用来判断移动方向
            = 0
    private var mCurrentPostion //当前选中的项
            = 0
    private var haveSelect //初次选中标识
            = false

    constructor(context: Context?) : this(context, LinearLayoutManager.VERTICAL) {}
    constructor(context: Context?, orientation: Int) : this(context, orientation, false) {}

    init {
        mPagerSnapHelper = PagerSnapHelper()
    }

    override fun onAttachedToWindow(recyclerView: RecyclerView) {
        super.onAttachedToWindow(recyclerView)
        mPagerSnapHelper?.attachToRecyclerView(recyclerView)
        recyclerView.addOnChildAttachStateChangeListener(this)
    }

    override fun onScrollStateChanged(state: Int) {
        if (state == RecyclerView.SCROLL_STATE_IDLE) {
            if (null != mPagerSnapHelper) {
                val viewIdle: View? = mPagerSnapHelper.findSnapView(this@ViewPagerLayoutManager)
                if (null != viewIdle) {
                    val position: Int = getPosition(viewIdle)
                    Log.d(
                        TAG,
                        "onScrollStateChanged-->position:$position,currentPostion:$mCurrentPostion"
                    )
                    //过滤重复选中
                    if (mOnViewPagerListener != null && mCurrentPostion != position) {
                        mCurrentPostion = position
                        mOnViewPagerListener!!.onPageSelected(
                            viewIdle,
                            position,
                            position == itemCount - 2
                        )
                    }
                }
            }
        }
    }

    /**
     * 监听竖直方向的相对偏移量
     */
    override fun scrollVerticallyBy(dy: Int, recycler: RecyclerView.Recycler?, state: RecyclerView.State?): Int {
        mDrift = dy
        return super.scrollVerticallyBy(dy, recycler, state)
    }

    /**
     * 监听水平方向的相对偏移量
     */
    override fun scrollHorizontallyBy(dx: Int, recycler: RecyclerView.Recycler?, state: RecyclerView.State?): Int {
        mDrift = dx
        return super.scrollHorizontallyBy(dx, recycler, state)
    }

    /**
     * 设置监听
     */
    fun setOnViewPagerListener(listener: OnViewPagerListener?) {
        mOnViewPagerListener = listener
    }

    /**
     * 默认初始选中用户scrollToPositionWithOffset中的项,不调用scrollToPositionWithOffset默认选中第0个
     * @param view
     */
    override fun onChildViewAttachedToWindow(view: View) {
        if (!haveSelect) {
            haveSelect = true
            mCurrentPostion = view?.let { this.getPosition(it) }!!
            mOnViewPagerListener?.onPageSelected(
                view,
                mCurrentPostion,
                mCurrentPostion == getItemCount() - 2
            )
        }
    }

    /**
     * 及时通知宿主销毁
     * @param view
     */
    override fun onChildViewDetachedFromWindow(view: View) {
        val position: Int? = view?.let { getPosition(it) }
        Log.d(
            TAG,
            "onChildViewDetachedFromWindow-->position:$position,mCurrentPostion:$mCurrentPostion"
        )
        if (mCurrentPostion == position) { //只回调证在被选中的Item,宿主需要判断播放器播放时不能销毁正在播放的项
            mOnViewPagerListener?.onPageRelease(
                view,
                mDrift >= 0,
                position
            )
        }
    }

    fun onReset() {
        mCurrentPostion = 0
        mDrift = 0
        haveSelect = false
    }

    companion object {
        private const val TAG = "ViewPagerLayoutManager"
    }

}