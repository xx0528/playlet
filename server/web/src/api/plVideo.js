import service from '@/utils/request'

// @Tags PlVideo
// @Summary 创建PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVideo true "创建PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVideo/createPlVideo [post]
export const createPlVideo = (data) => {
  return service({
    url: '/plVideo/createPlVideo',
    method: 'post',
    data
  })
}

// @Tags PlVideo
// @Summary 删除PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVideo true "删除PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVideo/deletePlVideo [delete]
export const deletePlVideo = (data) => {
  return service({
    url: '/plVideo/deletePlVideo',
    method: 'delete',
    data
  })
}

// @Tags PlVideo
// @Summary 删除PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVideo/deletePlVideo [delete]
export const deletePlVideoByIds = (data) => {
  return service({
    url: '/plVideo/deletePlVideoByIds',
    method: 'delete',
    data
  })
}

// @Tags PlVideo
// @Summary 更新PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVideo true "更新PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plVideo/updatePlVideo [put]
export const updatePlVideo = (data) => {
  return service({
    url: '/plVideo/updatePlVideo',
    method: 'put',
    data
  })
}

// @Tags PlVideo
// @Summary 用id查询PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PlVideo true "用id查询PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plVideo/findPlVideo [get]
export const findPlVideo = (params) => {
  return service({
    url: '/plVideo/findPlVideo',
    method: 'get',
    params
  })
}

// @Tags PlVideo
// @Summary 分页获取PlVideo列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取PlVideo列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVideo/getPlVideoList [get]
export const getPlVideoList = (params) => {
  return service({
    url: '/plVideo/getPlVideoList',
    method: 'get',
    params
  })
}
