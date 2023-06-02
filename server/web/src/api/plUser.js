import service from '@/utils/request'

// @Tags PlUser
// @Summary 创建PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlUser true "创建PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/createPlUser [post]
export const createPlUser = (data) => {
  return service({
    url: '/plUser/createPlUser',
    method: 'post',
    data
  })
}

// @Tags PlUser
// @Summary 删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlUser true "删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plUser/deletePlUser [delete]
export const deletePlUser = (data) => {
  return service({
    url: '/plUser/deletePlUser',
    method: 'delete',
    data
  })
}

// @Tags PlUser
// @Summary 删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plUser/deletePlUser [delete]
export const deletePlUserByIds = (data) => {
  return service({
    url: '/plUser/deletePlUserByIds',
    method: 'delete',
    data
  })
}

// @Tags PlUser
// @Summary 更新PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.PlUser true "更新PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plUser/updatePlUser [put]
export const updatePlUser = (data) => {
  return service({
    url: '/plUser/updatePlUser',
    method: 'put',
    data
  })
}

// @Tags PlUser
// @Summary 用id查询PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.PlUser true "用id查询PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plUser/findPlUser [get]
export const findPlUser = (params) => {
  return service({
    url: '/plUser/findPlUser',
    method: 'get',
    params
  })
}

// @Tags PlUser
// @Summary 分页获取PlUser列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取PlUser列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/getPlUserList [get]
export const getPlUserList = (params) => {
  return service({
    url: '/plUser/getPlUserList',
    method: 'get',
    params
  })
}
