package playlet

import (
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

type PlVipApi struct {
}

var plVipService = service.ServiceGroupApp.PlayletServiceGroup.PlVipService

// CreatePlVip 创建PlVip
// @Tags PlVip
// @Summary 创建PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVip true "创建PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVip/createPlVip [post]
func (plVipApi *PlVipApi) CreatePlVip(c *gin.Context) {
	var plVip playlet.PlVip
	err := c.ShouldBindJSON(&plVip)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plVip.CreatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"MoneyType": {utils.NotEmpty()},
		"CostMoney": {utils.NotEmpty()},
		"BuyGold":   {utils.NotEmpty()},
	}
	if err := utils.Verify(plVip, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plVipService.CreatePlVip(&plVip); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlVip 删除PlVip
// @Tags PlVip
// @Summary 删除PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVip true "删除PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVip/deletePlVip [delete]
func (plVipApi *PlVipApi) DeletePlVip(c *gin.Context) {
	var plVip playlet.PlVip
	err := c.ShouldBindJSON(&plVip)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plVip.DeletedBy = utils.GetUserID(c)
	if err := plVipService.DeletePlVip(plVip); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlVipByIds 批量删除PlVip
// @Tags PlVip
// @Summary 批量删除PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plVip/deletePlVipByIds [delete]
func (plVipApi *PlVipApi) DeletePlVipByIds(c *gin.Context) {
	var IDS request.IdsReq
	err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	deletedBy := utils.GetUserID(c)
	if err := plVipService.DeletePlVipByIds(IDS, deletedBy); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlVip 更新PlVip
// @Tags PlVip
// @Summary 更新PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVip true "更新PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plVip/updatePlVip [put]
func (plVipApi *PlVipApi) UpdatePlVip(c *gin.Context) {
	var plVip playlet.PlVip
	err := c.ShouldBindJSON(&plVip)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plVip.UpdatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"MoneyType": {utils.NotEmpty()},
		"CostMoney": {utils.NotEmpty()},
		"BuyGold":   {utils.NotEmpty()},
	}
	if err := utils.Verify(plVip, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plVipService.UpdatePlVip(plVip); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlVip 用id查询PlVip
// @Tags PlVip
// @Summary 用id查询PlVip
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlVip true "用id查询PlVip"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plVip/findPlVip [get]
func (plVipApi *PlVipApi) FindPlVip(c *gin.Context) {
	var plVip playlet.PlVip
	err := c.ShouldBindQuery(&plVip)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replVip, err := plVipService.GetPlVip(plVip.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replVip": replVip}, c)
	}
}

// GetPlVipList 分页获取PlVip列表
// @Tags PlVip
// @Summary 分页获取PlVip列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlVipSearch true "分页获取PlVip列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVip/getPlVipList [get]
func (plVipApi *PlVipApi) GetPlVipList(c *gin.Context) {
	var pageInfo playletReq.PlVipSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	pageInfo.PageSize = 10
	if list, total, err := plVipService.GetPlVipInfoList(pageInfo); err != nil {
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
