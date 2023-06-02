package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"time"
)

type PlVideoSearch struct{
    playlet.PlVideo
    StartCreatedAt *time.Time `json:"startCreatedAt" form:"startCreatedAt"`
    EndCreatedAt   *time.Time `json:"endCreatedAt" form:"endCreatedAt"`
    request.PageInfo
}
