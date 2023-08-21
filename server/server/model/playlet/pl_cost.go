/*
 * @Author: xx
 * @Date: 2023-06-02 18:43:54
 * @LastEditTime: 2023-06-02 18:48:53
 * @Description:
 */
// 自动生成模板PlCost
package playlet

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// PlCost 结构体
type PlCost struct {
	global.GVA_MODEL
	UserName  string    `json:"userName" form:"userName" gorm:"column:user_name;comment:用户名;"`
	UserId    string    `json:"userId" form:"userId" gorm:"column:user_id;comment:用户Id;"`
	CostGold  float64   `json:"costGold" form:"costGold" gorm:"column:cost_gold;comment:消费金币;"`
	Time      time.Time `json:"time" form:"time" gorm:"column:time;comment:时间;"`
	LeftGold  float64   `json:"leftGold" form:"leftGold" gorm:"column:left_gold;comment:剩余金币;"`
	BuyVideo  string    `json:"buyVideo" form:"buyVideo" gorm:"column:buy_video;comment:购买视频;"`
	CreatedBy uint      `gorm:"column:created_by;comment:创建者"`
	UpdatedBy uint      `gorm:"column:updated_by;comment:更新者"`
	DeletedBy uint      `gorm:"column:deleted_by;comment:删除者"`
}

// TableName PlCost 表名
func (PlCost) TableName() string {
	return "pl_cost"
}
