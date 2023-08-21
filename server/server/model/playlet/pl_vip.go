/*
 * @Author: xx
 * @Date: 2023-06-15 17:39:20
 * @LastEditTime: 2023-06-19 15:24:25
 * @Description:
 */
// 自动生成模板PlVip
package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// PlVip 结构体
type PlVip struct {
	global.GVA_MODEL
	MoneyType     int    `json:"moneyType" form:"moneyType" gorm:"column:money_type;comment:货币类型;"`
	CostMoney     string `json:"costMoney" form:"costMoney" gorm:"column:cost_money;comment:充值金额;"`
	GiveMoney     string `json:"giveMoney" form:"giveMoney" gorm:"column:give_money;comment:多送价值;"`
	BuyGold       string `json:"buyGold" form:"buyGold" gorm:"column:buy_gold;comment:购买金币;"`
	GiveGold      string `json:"giveGold" form:"giveGold" gorm:"column:give_gold;comment:赠送金币;"`
	FirstRecharge int    `json:"firstRecharge" form:"firstRecharge" gorm:"column:first_recharge;comment:是否是首冲奖励;"`
	CreatedBy     uint   `gorm:"column:created_by;comment:创建者"`
	UpdatedBy     uint   `gorm:"column:updated_by;comment:更新者"`
	DeletedBy     uint   `gorm:"column:deleted_by;comment:删除者"`
}

// TableName PlVip 表名
func (PlVip) TableName() string {
	return "pl_vip"
}