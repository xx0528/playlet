package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PlRechargeRouter struct {
}

// InitPlRechargeRouter 初始化 PlRecharge 路由信息
func (s *PlRechargeRouter) InitPlRechargeRouter(Router *gin.RouterGroup) {
	plRechargeRouter := Router.Group("plRecharge").Use(middleware.OperationRecord())
	plRechargeRouterWithoutRecord := Router.Group("plRecharge")
	var plRechargeApi = v1.ApiGroupApp.PlayletApiGroup.PlRechargeApi
	{
		plRechargeRouter.POST("createPlRecharge", plRechargeApi.CreatePlRecharge)   // 新建PlRecharge
		plRechargeRouter.DELETE("deletePlRecharge", plRechargeApi.DeletePlRecharge) // 删除PlRecharge
		plRechargeRouter.DELETE("deletePlRechargeByIds", plRechargeApi.DeletePlRechargeByIds) // 批量删除PlRecharge
		plRechargeRouter.PUT("updatePlRecharge", plRechargeApi.UpdatePlRecharge)    // 更新PlRecharge
	}
	{
		plRechargeRouterWithoutRecord.GET("findPlRecharge", plRechargeApi.FindPlRecharge)        // 根据ID获取PlRecharge
		plRechargeRouterWithoutRecord.GET("getPlRechargeList", plRechargeApi.GetPlRechargeList)  // 获取PlRecharge列表
	}
}
