import service from '@/utils/request'

// @Tags PlVip
// @Summary 创建PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVip true "创建PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVip/createPlVip [post]
export const createPlVip = (data) => {
  return service({
    url: '/plVip/createPlVip',
    method: 'post',
    data
  })
}

// @Tags PlVip
// @Summary 删除PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVip true "删除PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVip/deletePlVip [delete]
export const deletePlVip = (data) => {
  return service({
    url: '/plVip/deletePlVip',
    method: 'delete',
    data
  })
}

// @Tags PlVip
// @Summary 删除PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVip/deletePlVip [delete]
export const deletePlVipByIds = (data) => {
  return service({
    url: '/plVip/deletePlVipByIds',
    method: 'delete',
    data
  })
}

// @Tags PlVip
// @Summary 更新PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlVip true "更新PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plVip/updatePlVip [put]
export const updatePlVip = (data) => {
  return service({
    url: '/plVip/updatePlVip',
    method: 'put',
    data
  })
}

// @Tags PlVip
// @Summary 用id查询PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PlVip true "用id查询PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plVip/findPlVip [get]
export const findPlVip = (params) => {
  return service({
    url: '/plVip/findPlVip',
    method: 'get',
    params
  })
}

// @Tags PlVip
// @Summary 分页获取PlVip列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取PlVip列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVip/getPlVipList [get]
export const getPlVipList = (params) => {
  return service({
    url: '/plVip/getPlVipList',
    method: 'get',
    params
  })
}
