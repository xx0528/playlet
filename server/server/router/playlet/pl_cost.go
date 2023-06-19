package playlet

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PlCostRouter struct {
}

// InitPlCostRouter 初始化 PlCost 路由信息
func (s *PlCostRouter) InitPlCostRouter(Router *gin.RouterGroup) {
	plCostRouter := Router.Group("plCost").Use(middleware.OperationRecord())
	plCostRouterWithoutRecord := Router.Group("plCost")
	var plCostApi = v1.ApiGroupApp.PlayletApiGroup.PlCostApi
	{
		plCostRouter.POST("createPlCost", plCostApi.CreatePlCost)             // 新建PlCost
		plCostRouter.DELETE("deletePlCost", plCostApi.DeletePlCost)           // 删除PlCost
		plCostRouter.DELETE("deletePlCostByIds", plCostApi.DeletePlCostByIds) // 批量删除PlCost
		plCostRouter.PUT("updatePlCost", plCostApi.UpdatePlCost)              // 更新PlCost
	}
	{
		plCostRouterWithoutRecord.GET("findPlCost", plCostApi.FindPlCost)       // 根据ID获取PlCost
		plCostRouterWithoutRecord.GET("getPlCostList", plCostApi.GetPlCostList) // 获取PlCost列表
		plCostRouterWithoutRecord.GET("getPlCostData", plCostApi.GetPlCostData) // pl用户获取PlRecharge列表
	}
}
