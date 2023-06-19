package playlet

import (
	"strconv"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type PlCostApi struct {
}

var plCostService = service.ServiceGroupApp.PlayletServiceGroup.PlCostService

// CreatePlCost 创建PlCost
// @Tags PlCost
// @Summary 创建PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlCost true "创建PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plCost/createPlCost [post]
func (plCostApi *PlCostApi) CreatePlCost(c *gin.Context) {
	var plCost playlet.PlCost
	err := c.ShouldBindJSON(&plCost)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plCost.CreatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"UserId":   {utils.NotEmpty()},
		"CostGold": {utils.NotEmpty()},
		"LeftGold": {utils.NotEmpty()},
		"BuyVideo": {utils.NotEmpty()},
	}
	if err := utils.Verify(plCost, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plCostService.CreatePlCost(&plCost); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlCost 删除PlCost
// @Tags PlCost
// @Summary 删除PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlCost true "删除PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plCost/deletePlCost [delete]
func (plCostApi *PlCostApi) DeletePlCost(c *gin.Context) {
	var plCost playlet.PlCost
	err := c.ShouldBindJSON(&plCost)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plCost.DeletedBy = utils.GetUserID(c)
	if err := plCostService.DeletePlCost(plCost); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlCostByIds 批量删除PlCost
// @Tags PlCost
// @Summary 批量删除PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plCost/deletePlCostByIds [delete]
func (plCostApi *PlCostApi) DeletePlCostByIds(c *gin.Context) {
	var IDS request.IdsReq
	err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	deletedBy := utils.GetUserID(c)
	if err := plCostService.DeletePlCostByIds(IDS, deletedBy); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlCost 更新PlCost
// @Tags PlCost
// @Summary 更新PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlCost true "更新PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plCost/updatePlCost [put]
func (plCostApi *PlCostApi) UpdatePlCost(c *gin.Context) {
	var plCost playlet.PlCost
	err := c.ShouldBindJSON(&plCost)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plCost.UpdatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"UserId":   {utils.NotEmpty()},
		"CostGold": {utils.NotEmpty()},
		"LeftGold": {utils.NotEmpty()},
		"BuyVideo": {utils.NotEmpty()},
	}
	if err := utils.Verify(plCost, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plCostService.UpdatePlCost(plCost); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlCost 用id查询PlCost
// @Tags PlCost
// @Summary 用id查询PlCost
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlCost true "用id查询PlCost"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plCost/findPlCost [get]
func (plCostApi *PlCostApi) FindPlCost(c *gin.Context) {
	var plCost playlet.PlCost
	err := c.ShouldBindQuery(&plCost)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replCost, err := plCostService.GetPlCost(plCost.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replCost": replCost}, c)
	}
}

// GetPlCostList 分页获取PlCost列表
// @Tags PlCost
// @Summary 分页获取PlCost列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlCostSearch true "分页获取PlCost列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plCost/getPlCostList [get]
func (plCostApi *PlCostApi) GetPlCostList(c *gin.Context) {
	var pageInfo playletReq.PlCostSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := plCostService.GetPlCostInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}

// pl用户获取消费记录
func (plCostApi *PlCostApi) GetPlCostData(c *gin.Context) {
	pageInfo := playletReq.PlCostSearch{}
	numStr := c.Query("page")
	num, err := strconv.Atoi(numStr)
	if err == nil {
		pageInfo.Page = num
	}
	pageInfo.PageSize = 50

	if list, total, err := plCostService.GetPlCostInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}
