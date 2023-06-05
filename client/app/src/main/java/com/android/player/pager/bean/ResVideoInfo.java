package com.android.player.pager.bean;

import java.util.List;

public class ResVideoInfo {
    public int code;
    public String msg;
    public VideoInfo data;

    public class VideoInfo {
        public List<VideoBean> list;
        public int total;
        public int page;
        public int pageSize;
    }
}


