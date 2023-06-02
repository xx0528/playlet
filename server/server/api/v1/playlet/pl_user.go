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

type PlUserApi struct {
}

var plUserService = service.ServiceGroupApp.PlayletServiceGroup.PlUserService


// CreatePlUser 创建PlUser
// @Tags PlUser
// @Summary 创建PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "创建PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/createPlUser [post]
func (plUserApi *PlUserApi) CreatePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plUser.CreatedBy = utils.GetUserID(c)
    verify := utils.Rules{
        "UserId":{utils.NotEmpty()},
    }
	if err := utils.Verify(plUser, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := plUserService.CreatePlUser(&plUser); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlUser 删除PlUser
// @Tags PlUser
// @Summary 删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plUser/deletePlUser [delete]
func (plUserApi *PlUserApi) DeletePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plUser.DeletedBy = utils.GetUserID(c)
	if err := plUserService.DeletePlUser(plUser); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlUserByIds 批量删除PlUser
// @Tags PlUser
// @Summary 批量删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plUser/deletePlUserByIds [delete]
func (plUserApi *PlUserApi) DeletePlUserByIds(c *gin.Context) {
	var IDS request.IdsReq
    err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    deletedBy := utils.GetUserID(c)
	if err := plUserService.DeletePlUserByIds(IDS,deletedBy); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlUser 更新PlUser
// @Tags PlUser
// @Summary 更新PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "更新PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plUser/updatePlUser [put]
func (plUserApi *PlUserApi) UpdatePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plUser.UpdatedBy = utils.GetUserID(c)
      verify := utils.Rules{
          "UserId":{utils.NotEmpty()},
      }
    if err := utils.Verify(plUser, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := plUserService.UpdatePlUser(plUser); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlUser 用id查询PlUser
// @Tags PlUser
// @Summary 用id查询PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlUser true "用id查询PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plUser/findPlUser [get]
func (plUserApi *PlUserApi) FindPlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindQuery(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replUser, err := plUserService.GetPlUser(plUser.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replUser": replUser}, c)
	}
}

// GetPlUserList 分页获取PlUser列表
// @Tags PlUser
// @Summary 分页获取PlUser列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlUserSearch true "分页获取PlUser列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/getPlUserList [get]
func (plUserApi *PlUserApi) GetPlUserList(c *gin.Context) {
	var pageInfo playletReq.PlUserSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := plUserService.GetPlUserInfoList(pageInfo); err != nil {
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
