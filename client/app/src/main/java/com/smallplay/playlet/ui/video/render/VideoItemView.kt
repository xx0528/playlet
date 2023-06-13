package com.smallplay.playlet.ui.video.render

import android.content.Context
import android.os.Build
import android.util.AttributeSet
import android.util.Log
import android.view.*
import android.view.animation.Animation
import android.widget.*
import android.widget.SeekBar.OnSeekBarChangeListener
import com.smallplay.playlet.R
import xyz.doikki.videoplayer.controller.ControlWrapper
import xyz.doikki.videoplayer.controller.IControlComponent
import xyz.doikki.videoplayer.player.VideoView
import xyz.doikki.videoplayer.util.L
import xyz.doikki.videoplayer.util.PlayerUtils
import kotlin.math.abs

class VideoItemView : FrameLayout, IControlComponent, OnSeekBarChangeListener {
    private var thumb: ImageView? = null
    private var mPlayBtn: ImageView? = null
    private var mControlWrapper: ControlWrapper? = null
    private var mScaledTouchSlop = 0
    private var mStartX = 0
    private var mStartY = 0
    private var mBottomProgress: ProgressBar? = null
    private var mVideoProgress: SeekBar? = null
    private var mIsDragging = false
    private val TAG = "VideoItemView-------------------"
    constructor(context: Context) : super(context) {}
    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {}
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(
        context,
        attrs,
        defStyleAttr
    ) {
    }

    init {
        LayoutInflater.from(context).inflate(R.layout.layout_video_controller, this, true)
        thumb = findViewById<ImageView>(R.id.iv_thumb)
        mPlayBtn = findViewById<ImageView>(R.id.play_btn)
        setOnClickListener {
            mControlWrapper!!.togglePlay()
        }
        mScaledTouchSlop = ViewConfiguration.get(context).scaledTouchSlop
        mBottomProgress = findViewById<ProgressBar>(R.id.bottom_progress)
        mVideoProgress = findViewById<SeekBar>(R.id.seekBar)
        mVideoProgress?.setOnSeekBarChangeListener(this)

        //5.1以下系统SeekBar高度需要设置成WRAP_CONTENT
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.LOLLIPOP_MR1) {
            mVideoProgress?.layoutParams?.height = ViewGroup.LayoutParams.WRAP_CONTENT
        }
    }

    /**
     * 解决点击和VerticalViewPager滑动冲突问题
     */
    override fun onTouchEvent(event: MotionEvent): Boolean {
        val action = event.action
        when (action) {
            MotionEvent.ACTION_DOWN -> {
                mStartX = event.x.toInt()
                mStartY = event.y.toInt()
                return true
            }
            MotionEvent.ACTION_UP -> {
                val endX = event.x.toInt()
                val endY = event.y.toInt()
                if (abs(endX - mStartX) < mScaledTouchSlop
                    && abs(endY - mStartY) < mScaledTouchSlop
                ) {
                    performClick()
                }
            }
        }
        return false
    }

    override fun attach(controlWrapper: ControlWrapper) {
        Log.d(TAG, "attach 初始化  controlWrapper")
        mControlWrapper = controlWrapper
    }

    override fun getView(): View? {
        return this
    }

    override fun onVisibilityChanged(isVisible: Boolean, anim: Animation) {}
    override fun onPlayStateChanged(playState: Int) {
        when (playState) {
            VideoView.STATE_IDLE -> {
                L.e("STATE_IDLE " + hashCode())
                thumb!!.visibility = VISIBLE
            }
            VideoView.STATE_PLAYBACK_COMPLETED -> {
                mBottomProgress!!.visibility = GONE
                mBottomProgress!!.progress = 0
                mBottomProgress!!.secondaryProgress = 0
                mVideoProgress!!.progress = 0
                mVideoProgress!!.secondaryProgress = 0
            }
            VideoView.STATE_PLAYING -> {
                L.e("STATE_PLAYING " + hashCode())
                thumb!!.visibility = GONE
                mPlayBtn!!.visibility = GONE
                //开始刷新进度
                mBottomProgress!!.visibility = GONE
                mControlWrapper!!.startProgress()
            }
            VideoView.STATE_PAUSED -> {
                L.e("STATE_PAUSED " + hashCode())
                thumb!!.visibility = GONE
                mPlayBtn!!.visibility = VISIBLE
            }
            VideoView.STATE_PREPARED -> L.e("STATE_PREPARED " + hashCode())
            VideoView.STATE_ERROR -> {
                L.e("STATE_ERROR " + hashCode())
                Toast.makeText(context, R.string.dkplayer_error_message, Toast.LENGTH_SHORT).show()
                mBottomProgress?.visibility = GONE
            }
        }
    }

    override fun onPlayerStateChanged(playerState: Int) {
    }
    override fun setProgress(duration: Int, position: Int) {
//        Log.d("VideoItemView ", "视频总时长--$duration 播放进度-- $position")

        if (mVideoProgress != null) {
            if (duration > 0) {
                mVideoProgress!!.isEnabled = true
                val pos = (position * 1.0 / duration * mVideoProgress!!.max).toInt()
                mVideoProgress!!.progress = pos
                mBottomProgress!!.progress = pos
            } else {
                mVideoProgress!!.isEnabled = false
            }
            val percent = mControlWrapper!!.bufferedPercentage
            if (percent >= 95) { //解决缓冲进度不能100%问题
                mVideoProgress!!.secondaryProgress = mVideoProgress!!.max
                mBottomProgress!!.secondaryProgress = mBottomProgress!!.max
            } else {
                mVideoProgress!!.secondaryProgress = percent * 10
                mBottomProgress!!.secondaryProgress = percent * 10
            }
        }

    }
    override fun onLockStateChanged(isLocked: Boolean) {}

    override fun onStartTrackingTouch(seekBar: SeekBar?) {
        mIsDragging = true
        mControlWrapper!!.stopProgress()
        mControlWrapper!!.stopFadeOut()
    }

    override fun onStopTrackingTouch(seekBar: SeekBar) {
        val duration = mControlWrapper!!.duration
        val newPosition = duration * seekBar.progress / mVideoProgress!!.max
        mControlWrapper!!.seekTo(newPosition.toInt().toLong())
        mIsDragging = false
        mControlWrapper!!.startProgress()
        mControlWrapper!!.startFadeOut()
    }

    override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
        if (!fromUser) {
            return
        }
        val duration = mControlWrapper!!.duration
        val newPosition = duration * progress / mVideoProgress!!.max
//        if (mCurrTime != null) mCurrTime.setText(PlayerUtils.stringForTime(newPosition.toInt()))
    }
}
