/*
 * @Author: xx
 * @Date: 2023-06-14 10:34:27
 * @LastEditTime: 2023-06-16 15:24:59
 * @Description:
 */
package response

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
)

type PlLoginRes struct {
	playlet.PlUser
	Check      bool   `json:"check"`
	ChatServer string `json:"chatServer"`
	Token      string `json:"token"`
	ExpiresAt  int64  `json:"expiresAt"`
}

type PlPlayVideoRes struct {
	playletReq.PlVideoInfo
	Code     int            `json:"code"`
	Msg      string         `json:"msg"`
	UserInfo playlet.PlUser `json:"userInfo"`
}

type PlLikeVideoRes struct {
	LikeVideos string `json:"likeVideos"`
}
