import service from '@/utils/request'

// @Tags PlCost
// @Summary 创建PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlCost true "创建PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plCost/createPlCost [post]
export const createPlCost = (data) => {
  return service({
    url: '/plCost/createPlCost',
    method: 'post',
    data
  })
}

// @Tags PlCost
// @Summary 删除PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlCost true "删除PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plCost/deletePlCost [delete]
export const deletePlCost = (data) => {
  return service({
    url: '/plCost/deletePlCost',
    method: 'delete',
    data
  })
}

// @Tags PlCost
// @Summary 删除PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plCost/deletePlCost [delete]
export const deletePlCostByIds = (data) => {
  return service({
    url: '/plCost/deletePlCostByIds',
    method: 'delete',
    data
  })
}

// @Tags PlCost
// @Summary 更新PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlCost true "更新PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plCost/updatePlCost [put]
export const updatePlCost = (data) => {
  return service({
    url: '/plCost/updatePlCost',
    method: 'put',
    data
  })
}

// @Tags PlCost
// @Summary 用id查询PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PlCost true "用id查询PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plCost/findPlCost [get]
export const findPlCost = (params) => {
  return service({
    url: '/plCost/findPlCost',
    method: 'get',
    params
  })
}

// @Tags PlCost
// @Summary 分页获取PlCost列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取PlCost列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plCost/getPlCostList [get]
export const getPlCostList = (params) => {
  return service({
    url: '/plCost/getPlCostList',
    method: 'get',
    params
  })
}
