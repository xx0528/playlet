package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PlVipRouter struct {
}

// InitPlVipRouter 初始化 PlVip 路由信息
func (s *PlVipRouter) InitPlVipRouter(Router *gin.RouterGroup) {
	plVipRouter := Router.Group("plVip").Use(middleware.OperationRecord())
	plVipRouterWithoutRecord := Router.Group("plVip")
	var plVipApi = v1.ApiGroupApp.PlayletApiGroup.PlVipApi
	{
		plVipRouter.POST("createPlVip", plVipApi.CreatePlVip)   // 新建PlVip
		plVipRouter.DELETE("deletePlVip", plVipApi.DeletePlVip) // 删除PlVip
		plVipRouter.DELETE("deletePlVipByIds", plVipApi.DeletePlVipByIds) // 批量删除PlVip
		plVipRouter.PUT("updatePlVip", plVipApi.UpdatePlVip)    // 更新PlVip
	}
	{
		plVipRouterWithoutRecord.GET("findPlVip", plVipApi.FindPlVip)        // 根据ID获取PlVip
		plVipRouterWithoutRecord.GET("getPlVipList", plVipApi.GetPlVipList)  // 获取PlVip列表
	}
}
