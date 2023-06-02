package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
    "github.com/flipped-aurora/gin-vue-admin/server/utils"
)

type PlRechargeApi struct {
}

var plRechargeService = service.ServiceGroupApp.PlayletServiceGroup.PlRechargeService


// CreatePlRecharge 创建PlRecharge
// @Tags PlRecharge
// @Summary 创建PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlRecharge true "创建PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plRecharge/createPlRecharge [post]
func (plRechargeApi *PlRechargeApi) CreatePlRecharge(c *gin.Context) {
	var plRecharge playlet.PlRecharge
	err := c.ShouldBindJSON(&plRecharge)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plRecharge.CreatedBy = utils.GetUserID(c)
    verify := utils.Rules{
        "UserId":{utils.NotEmpty()},
        "Recharge":{utils.NotEmpty()},
        "BuyGold":{utils.NotEmpty()},
        "LeftGold":{utils.NotEmpty()},
        "AdminId":{utils.NotEmpty()},
    }
	if err := utils.Verify(plRecharge, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := plRechargeService.CreatePlRecharge(&plRecharge); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlRecharge 删除PlRecharge
// @Tags PlRecharge
// @Summary 删除PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlRecharge true "删除PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plRecharge/deletePlRecharge [delete]
func (plRechargeApi *PlRechargeApi) DeletePlRecharge(c *gin.Context) {
	var plRecharge playlet.PlRecharge
	err := c.ShouldBindJSON(&plRecharge)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plRecharge.DeletedBy = utils.GetUserID(c)
	if err := plRechargeService.DeletePlRecharge(plRecharge); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlRechargeByIds 批量删除PlRecharge
// @Tags PlRecharge
// @Summary 批量删除PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plRecharge/deletePlRechargeByIds [delete]
func (plRechargeApi *PlRechargeApi) DeletePlRechargeByIds(c *gin.Context) {
	var IDS request.IdsReq
    err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    deletedBy := utils.GetUserID(c)
	if err := plRechargeService.DeletePlRechargeByIds(IDS,deletedBy); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlRecharge 更新PlRecharge
// @Tags PlRecharge
// @Summary 更新PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlRecharge true "更新PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plRecharge/updatePlRecharge [put]
func (plRechargeApi *PlRechargeApi) UpdatePlRecharge(c *gin.Context) {
	var plRecharge playlet.PlRecharge
	err := c.ShouldBindJSON(&plRecharge)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plRecharge.UpdatedBy = utils.GetUserID(c)
      verify := utils.Rules{
          "UserId":{utils.NotEmpty()},
          "Recharge":{utils.NotEmpty()},
          "BuyGold":{utils.NotEmpty()},
          "LeftGold":{utils.NotEmpty()},
          "AdminId":{utils.NotEmpty()},
      }
    if err := utils.Verify(plRecharge, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := plRechargeService.UpdatePlRecharge(plRecharge); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlRecharge 用id查询PlRecharge
// @Tags PlRecharge
// @Summary 用id查询PlRecharge
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlRecharge true "用id查询PlRecharge"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plRecharge/findPlRecharge [get]
func (plRechargeApi *PlRechargeApi) FindPlRecharge(c *gin.Context) {
	var plRecharge playlet.PlRecharge
	err := c.ShouldBindQuery(&plRecharge)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replRecharge, err := plRechargeService.GetPlRecharge(plRecharge.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replRecharge": replRecharge}, c)
	}
}

// GetPlRechargeList 分页获取PlRecharge列表
// @Tags PlRecharge
// @Summary 分页获取PlRecharge列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlRechargeSearch true "分页获取PlRecharge列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plRecharge/getPlRechargeList [get]
func (plRechargeApi *PlRechargeApi) GetPlRechargeList(c *gin.Context) {
	var pageInfo playletReq.PlRechargeSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := plRechargeService.GetPlRechargeInfoList(pageInfo); err != nil {
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
