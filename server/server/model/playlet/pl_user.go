/*
 * @Author: xx
 * @Date: 2023-06-02 18:36:01
 * @LastEditTime: 2023-06-02 19:59:12
 * @Description:
 */
// 自动生成模板PlUser
package playlet

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// PlUser 结构体
type PlUser struct {
	global.GVA_MODEL
	UserName      string    `json:"userName" form:"userName" gorm:"column:user_name;comment:用户名;"`
	UserId        string    `json:"userId" form:"userId" gorm:"column:user_id;comment:用户Id;"`
	GuestId       string    `json:"guestId" form:"guestId" gorm:"column:guest_id;comment:访客id;"`
	Phone         string    `json:"phone" form:"phone" gorm:"column:phone;comment:手机;"`
	Recharge      float64   `json:"recharge" form:"recharge" gorm:"column:recharge;comment:累计充值;"`
	CurGold       float64   `json:"curGold" form:"curGold" gorm:"column:cur_gold;comment:当前金币;"`
	BuyVideos     string    `json:"buyVideos" form:"buyVideos" gorm:"column:buy_videos;type:text;comment:解锁记录;"`
	RegisterTime  time.Time `json:"registerTime" form:"registerTime" gorm:"column:register_time;comment:注册时间;"`
	LastLoginTime time.Time `json:"lastLoginTime" form:"lastLoginTime" gorm:"column:last_login_time;comment:最后登录时间;"`
	LikeVideos    string    `json:"likeVideos" form:"likeVideos" gorm:"column:like_videos;type:text;comment:收藏剧集;"`
	CreatedBy     uint      `gorm:"column:created_by;comment:创建者"`
	UpdatedBy     uint      `gorm:"column:updated_by;comment:更新者"`
	DeletedBy     uint      `gorm:"column:deleted_by;comment:删除者"`
}

// TableName PlUser 表名
func (PlUser) TableName() string {
	return "pl_user"
}
