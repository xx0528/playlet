/*
 * @Author: xx
 * @Date: 2023-06-05 12:53:45
 * @LastEditTime: 2023-06-14 16:18:14
 * @Description:
 */
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
	var plUserApi = v1.ApiGroupApp.PlayletApiGroup.PlUserApi
	{
		plUserVideoRouterWithoutRecord.POST("plLogin", plUserApi.RegistAndLogin)
	}
}
