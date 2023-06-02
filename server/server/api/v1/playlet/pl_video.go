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

type PlVideoApi struct {
}

var plVideoService = service.ServiceGroupApp.PlayletServiceGroup.PlVideoService


// CreatePlVideo 创建PlVideo
// @Tags PlVideo
// @Summary 创建PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVideo true "创建PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVideo/createPlVideo [post]
func (plVideoApi *PlVideoApi) CreatePlVideo(c *gin.Context) {
	var plVideo playlet.PlVideo
	err := c.ShouldBindJSON(&plVideo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plVideo.CreatedBy = utils.GetUserID(c)
    verify := utils.Rules{
        "VideoName":{utils.NotEmpty()},
        "VideoType":{utils.NotEmpty()},
        "Count":{utils.NotEmpty()},
        "VideoUrl":{utils.NotEmpty()},
        "FreeCount":{utils.NotEmpty()},
    }
	if err := utils.Verify(plVideo, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := plVideoService.CreatePlVideo(&plVideo); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlVideo 删除PlVideo
// @Tags PlVideo
// @Summary 删除PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVideo true "删除PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plVideo/deletePlVideo [delete]
func (plVideoApi *PlVideoApi) DeletePlVideo(c *gin.Context) {
	var plVideo playlet.PlVideo
	err := c.ShouldBindJSON(&plVideo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plVideo.DeletedBy = utils.GetUserID(c)
	if err := plVideoService.DeletePlVideo(plVideo); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlVideoByIds 批量删除PlVideo
// @Tags PlVideo
// @Summary 批量删除PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plVideo/deletePlVideoByIds [delete]
func (plVideoApi *PlVideoApi) DeletePlVideoByIds(c *gin.Context) {
	var IDS request.IdsReq
    err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    deletedBy := utils.GetUserID(c)
	if err := plVideoService.DeletePlVideoByIds(IDS,deletedBy); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlVideo 更新PlVideo
// @Tags PlVideo
// @Summary 更新PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlVideo true "更新PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plVideo/updatePlVideo [put]
func (plVideoApi *PlVideoApi) UpdatePlVideo(c *gin.Context) {
	var plVideo playlet.PlVideo
	err := c.ShouldBindJSON(&plVideo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
    plVideo.UpdatedBy = utils.GetUserID(c)
      verify := utils.Rules{
          "VideoName":{utils.NotEmpty()},
          "VideoType":{utils.NotEmpty()},
          "Count":{utils.NotEmpty()},
          "VideoUrl":{utils.NotEmpty()},
          "FreeCount":{utils.NotEmpty()},
      }
    if err := utils.Verify(plVideo, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := plVideoService.UpdatePlVideo(plVideo); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlVideo 用id查询PlVideo
// @Tags PlVideo
// @Summary 用id查询PlVideo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlVideo true "用id查询PlVideo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plVideo/findPlVideo [get]
func (plVideoApi *PlVideoApi) FindPlVideo(c *gin.Context) {
	var plVideo playlet.PlVideo
	err := c.ShouldBindQuery(&plVideo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replVideo, err := plVideoService.GetPlVideo(plVideo.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replVideo": replVideo}, c)
	}
}

// GetPlVideoList 分页获取PlVideo列表
// @Tags PlVideo
// @Summary 分页获取PlVideo列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlVideoSearch true "分页获取PlVideo列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plVideo/getPlVideoList [get]
func (plVideoApi *PlVideoApi) GetPlVideoList(c *gin.Context) {
	var pageInfo playletReq.PlVideoSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := plVideoService.GetPlVideoInfoList(pageInfo); err != nil {
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
