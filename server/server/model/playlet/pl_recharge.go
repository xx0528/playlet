/*
 * @Author: xx
 * @Date: 2023-06-02 18:40:17
 * @LastEditTime: 2023-06-02 18:48:24
 * @Description:
 */
// 自动生成模板PlRecharge
package playlet

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// PlRecharge 结构体
type PlRecharge struct {
	global.GVA_MODEL
	UserName  string    `json:"userName" form:"userName" gorm:"column:user_name;comment:用户名;"`
	UserId    string    `json:"userId" form:"userId" gorm:"column:user_id;comment:用户Id;"`
	Recharge  float64   `json:"recharge" form:"recharge" gorm:"column:recharge;comment:充值金额;"`
	Time      time.Time `json:"time" form:"time" gorm:"column:time;comment:时间;"`
	BuyGold   float64   `json:"buyGold" form:"buyGold" gorm:"column:buy_gold;comment:购买金币;"`
	GiveGold  float64   `json:"giveGold" form:"giveGold" gorm:"column:give_gold;comment:赠送金币;"`
	LeftGold  float64   `json:"leftGold" form:"leftGold" gorm:"column:left_gold;comment:剩余金币;"`
	AdminId   int       `json:"adminId" form:"adminId" gorm:"column:admin_id;comment:操作人;"`
	CreatedBy uint      `gorm:"column:created_by;comment:创建者"`
	UpdatedBy uint      `gorm:"column:updated_by;comment:更新者"`
	DeletedBy uint      `gorm:"column:deleted_by;comment:删除者"`
}

// TableName PlRecharge 表名
func (PlRecharge) TableName() string {
	return "pl_recharge"
}
