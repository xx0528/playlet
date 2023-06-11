package com.smallplay.playlet.ui.video

import android.content.Context
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.PagerSnapHelper
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.OnChildAttachStateChangeListener
import androidx.recyclerview.widget.RecyclerView.Recycler

class ViewPagerLayoutManager @JvmOverloads constructor(
    context: Context?,
    orientation: Int,
    reverseLayout: Boolean = false
) :
    LinearLayoutManager(context, orientation, reverseLayout), OnChildAttachStateChangeListener {
    private var mPagerSnapHelper: PagerSnapHelper? = null
    private var mOnViewPagerListener: OnViewPagerListener? = null
    private var mDrift = 0 //位移，用来判断移动方向

    init {
        mPagerSnapHelper = PagerSnapHelper()
    }

    override fun onAttachedToWindow(recyclerView: RecyclerView) {
        super.onAttachedToWindow(recyclerView)
        mPagerSnapHelper!!.attachToRecyclerView(recyclerView)
        recyclerView.addOnChildAttachStateChangeListener(this)
    }

    override fun onScrollStateChanged(state: Int) {
        if (state == RecyclerView.SCROLL_STATE_IDLE) {
            val viewIdle = mPagerSnapHelper!!.findSnapView(this@ViewPagerLayoutManager)
            val positionIdle = getPosition(viewIdle!!)
            if (mOnViewPagerListener != null && childCount == 1) {
                mOnViewPagerListener!!.onPageSelected(positionIdle, positionIdle == itemCount - 1)
            }
        }
    }

    /**
     * 监听竖直方向的相对偏移量
     */
    override fun scrollVerticallyBy(dy: Int, recycler: Recycler, state: RecyclerView.State): Int {
        mDrift = dy
        return super.scrollVerticallyBy(dy, recycler, state)
    }

    /**
     * 监听水平方向的相对偏移量
     */
    override fun scrollHorizontallyBy(dx: Int, recycler: Recycler, state: RecyclerView.State): Int {
        mDrift = dx
        return super.scrollHorizontallyBy(dx, recycler, state)
    }

    /**
     * 设置监听
     */
    fun setOnViewPagerListener(listener: OnViewPagerListener?) {
        mOnViewPagerListener = listener
    }

    override fun onChildViewAttachedToWindow(view: View) {
        if (mOnViewPagerListener != null && childCount == 1) {
            mOnViewPagerListener!!.onInitComplete()
        }
    }

    override fun onChildViewDetachedFromWindow(view: View) {
        if (mDrift >= 0) {
            if (mOnViewPagerListener != null) mOnViewPagerListener!!.onPageRelease(
                true,
                getPosition(view)
            )
        } else {
            if (mOnViewPagerListener != null) mOnViewPagerListener!!.onPageRelease(
                false,
                getPosition(view)
            )
        }
    }

    fun onReset() {
        mDrift = 0
    }
}
