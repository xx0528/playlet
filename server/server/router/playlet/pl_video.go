package playlet

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PlVideoRouter struct {
}

// InitPlVideoRouter 初始化 PlVideo 路由信息
func (s *PlVideoRouter) InitPlVideoRouter(Router *gin.RouterGroup) {
	plVideoRouter := Router.Group("plVideo").Use(middleware.OperationRecord())
	plVideoRouterWithoutRecord := Router.Group("plVideo")
	var plVideoApi = v1.ApiGroupApp.PlayletApiGroup.PlVideoApi
	{
		plVideoRouter.POST("createPlVideo", plVideoApi.CreatePlVideo)             // 新建PlVideo
		plVideoRouter.DELETE("deletePlVideo", plVideoApi.DeletePlVideo)           // 删除PlVideo
		plVideoRouter.DELETE("deletePlVideoByIds", plVideoApi.DeletePlVideoByIds) // 批量删除PlVideo
		plVideoRouter.PUT("updatePlVideo", plVideoApi.UpdatePlVideo)              // 更新PlVideo
	}
	{
		plVideoRouterWithoutRecord.GET("findPlVideo", plVideoApi.FindPlVideo)               // 根据ID获取PlVideo
		plVideoRouterWithoutRecord.GET("getPlVideoList", plVideoApi.GetPlVideoList)         // 获取PlVideo列表
		plVideoRouterWithoutRecord.GET("getPlUserVideoList", plVideoApi.GetPlUserVideoList) // 获取PlVideo列表
	}
}
