package playlet

import "github.com/flipped-aurora/gin-vue-admin/server/service"

type ApiGroup struct {
	PlVideoApi
	PlUserApi
	PlRechargeApi
	PlCostApi
	PlVipApi
}

var jwtService = service.ServiceGroupApp.SystemServiceGroup.JwtService
