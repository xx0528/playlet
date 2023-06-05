package com.android.player.pager.model;

import com.android.player.net.BaseEngin;
import com.android.player.net.OnResultCallBack;

import java.util.HashMap;
import java.util.Map;

public class VideoEngin extends BaseEngin {
    /**
     * 获取视频列为表
     * @param page 页眉
     * @param callBack 回调
     */
    public void getIndexVideos(int page, OnResultCallBack callBack){
        Map<String, String> params=new HashMap<>();
        params.put("page",page+"");
        sendGetRequst("localhost:8080/api/plUserVideo/getPlUserVideoList",params,callBack);
    }

}
