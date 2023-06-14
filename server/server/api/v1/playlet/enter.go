/*
 * @Author: xx
 * @Date: 2023-06-02 18:17:02
 * @LastEditTime: 2023-06-14 10:49:04
 * @Description:
 */
package playlet

import "github.com/flipped-aurora/gin-vue-admin/server/service"

type ApiGroup struct {
	PlVideoApi
	PlUserApi
	PlRechargeApi
	PlCostApi
}

var jwtService = service.ServiceGroupApp.SystemServiceGroup.JwtService
