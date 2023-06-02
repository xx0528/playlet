import service from '@/utils/request'

// @Tags PlRecharge
// @Summary 创建PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlRecharge true "创建PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plRecharge/createPlRecharge [post]
export const createPlRecharge = (data) => {
  return service({
    url: '/plRecharge/createPlRecharge',
    method: 'post',
    data
  })
}

// @Tags PlRecharge
// @Summary 删除PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlRecharge true "删除PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plRecharge/deletePlRecharge [delete]
export const deletePlRecharge = (data) => {
  return service({
    url: '/plRecharge/deletePlRecharge',
    method: 'delete',
    data
  })
}

// @Tags PlRecharge
// @Summary 删除PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plRecharge/deletePlRecharge [delete]
export const deletePlRechargeByIds = (data) => {
  return service({
    url: '/plRecharge/deletePlRechargeByIds',
    method: 'delete',
    data
  })
}

// @Tags PlRecharge
// @Summary 更新PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlRecharge true "更新PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plRecharge/updatePlRecharge [put]
export const updatePlRecharge = (data) => {
  return service({
    url: '/plRecharge/updatePlRecharge',
    method: 'put',
    data
  })
}

// @Tags PlRecharge
// @Summary 用id查询PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PlRecharge true "用id查询PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plRecharge/findPlRecharge [get]
export const findPlRecharge = (params) => {
  return service({
    url: '/plRecharge/findPlRecharge',
    method: 'get',
    params
  })
}

// @Tags PlRecharge
// @Summary 分页获取PlRecharge列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取PlRecharge列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plRecharge/getPlRechargeList [get]
export const getPlRechargeList = (params) => {
  return service({
    url: '/plRecharge/getPlRechargeList',
    method: 'get',
    params
  })
}
