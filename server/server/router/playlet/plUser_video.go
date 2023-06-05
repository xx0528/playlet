package playlet

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/gin-gonic/gin"
)

type PlUserVideoRouter struct {
}

// InitPlUserVideoRouter 初始化 PlVideo 路由信息
func (s *PlUserVideoRouter) InitPlUserVideoRouter(Router *gin.RouterGroup) {
	plUserVideoRouterWithoutRecord := Router.Group("plUserVideo")
	var plVideoApi = v1.ApiGroupApp.PlayletApiGroup.PlVideoApi
	{
		plUserVideoRouterWithoutRecord.GET("getPlUserVideoList", plVideoApi.GetPlUserVideoList) // 获取PlVideo列表
	}
}
