package com.smallplay.playlet.data.model.bean

import java.io.Serializable

/**
 *  分页数据的基类
 */
data class ApiPagerResponse<T>(
    var list: T,
    var page: Int,
    var offset: Int,
    var over: Boolean,
    var pageSize: Int,
    var total: Int
) : Serializable {
    /**
     * 数据是否为空
     */
    fun isEmpty() = (list as List<*>).isEmpty()

    /**
     * 是否为刷新
     */
    fun isRefresh() = offset == 0

    /**
     * 是否还有更多数据
     */
    fun hasMore() = !over
}