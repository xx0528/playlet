package com.android.player.pager.bean;

/**
 * created by hty
 * 2022/6/29
 * Desc:视频javaBean
 */
public class VideoBean {


    public VideoBean(){}
    //短剧id
    public int ID;
    //短剧名
    private String videoName;
    //短剧分类
    private int videoType;
    //分类名
    private String typeName;
    //简介
    private String videoDesc;
    //收藏人数
    private int likeCount;
    //播放次数
    private int playCount;
    //是否完结 1 完结 0 更新
    private int finish;
    //集数
    private int count;
    //图片
    private String imgUrl;
    //视频地址
    private String videoUrl;
    //上架时间
    private String createTime;
    //免费集数
    private int freeCount;
    //解锁集数
    private int lockCount;

    public int getVideoId() {return ID;}
    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public int getVideoType() {
        return videoType;
    }

    public void setVideoType(int videoType) {
        this.videoType = videoType;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getVideoDesc() {
        return videoDesc;
    }

    public void setVideoDesc(String desc) {
        this.videoDesc = desc;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public String getVideoUrl(int position) {
        return videoUrl + "/" + (position + 1) + ".mp4";
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public int getPlayCount() {
        return playCount;
    }

    public void setPlayCount(int playCount) {
        this.playCount = playCount;
    }

    public int getFinish() {
        return finish;
    }

    public void setFinish(int finish) {
        this.finish = finish;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getImgUrl() {

        return videoUrl + "/cover.png";
    }


    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getCreateTime() {return createTime;}
    public void setCreateTime(String createTime) { this.createTime = createTime; }

    public int getFreeCount() {return freeCount;}

    public void setFreeCount(int freeCount) { this.freeCount = freeCount; }

    public int getLockCount() {return lockCount;}

    public void setLockCount(int lockCount) { this.lockCount = lockCount; }
}