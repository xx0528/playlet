package request

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
)

type PlUserSearch struct {
	playlet.PlUser
	StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
	EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
	request.PageInfo
}

// PlUser login structure
type PlLoginReq struct {
	Username string `json:"username" form:"username"` // 用户名
	Password string `json:"password" form:"password"` // 密码
}
