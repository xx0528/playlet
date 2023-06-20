/*
 * @Author: xx
 * @Date: 2023-06-02 18:36:01
 * @LastEditTime: 2023-06-20 16:35:49
 * @Description:
 */
package playlet

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type PlUserRouter struct {
}

// InitPlUserRouter 初始化 PlUser 路由信息
func (s *PlUserRouter) InitPlUserRouter(Router *gin.RouterGroup) {
	plUserRouter := Router.Group("plUser").Use(middleware.OperationRecord())
	plUserRouterWithoutRecord := Router.Group("plUser")
	var plUserApi = v1.ApiGroupApp.PlayletApiGroup.PlUserApi
	{
		plUserRouter.POST("createPlUser", plUserApi.CreatePlUser)             // 新建PlUser
		plUserRouter.DELETE("deletePlUser", plUserApi.DeletePlUser)           // 删除PlUser
		plUserRouter.DELETE("deletePlUserByIds", plUserApi.DeletePlUserByIds) // 批量删除PlUser
		plUserRouter.PUT("updatePlUser", plUserApi.UpdatePlUser)              // 更新PlUser
		plUserRouter.POST("playVideo", plUserApi.PlayVideo)                   // 观看视频
		plUserRouter.POST("likeVideo", plUserApi.LikeVideo)                   // 收藏视频
	}
	{
		plUserRouterWithoutRecord.GET("findPlUser", plUserApi.FindPlUser)            // 根据ID获取PlUser
		plUserRouterWithoutRecord.GET("getPlUserList", plUserApi.GetPlUserList)      // 获取PlUser列表
		plUserRouterWithoutRecord.GET("plGetUserInfo", plUserApi.GetPlUserInfo)      // pl用户获取PlUser信息
		plUserRouterWithoutRecord.GET("plBindPhone", plUserApi.BindPhone)            // pl用户绑定手机
		plUserRouterWithoutRecord.POST("plSetPswNickname", plUserApi.SetPswNickname) // pl用户绑定昵称密码
		plUserRouterWithoutRecord.POST("plLoginByPhone", plUserApi.LoginByPhone)     // pl用户通过手机号登录

	}
}
