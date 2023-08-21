/*
 * @Author: xx
 * @Date: 2023-06-14 17:07:25
 * @LastEditTime: 2023-06-19 14:49:27
 * @Description:
 */
package config

type Playlet struct {
	EpisodeCost  float64 `mapstructure:"episode-cost" json:"episode-cost" yaml:"episode-cost"`    // 每集消耗
	Check        bool    `mapstructure:"check" json:"check" yaml:"check"`                         // 审核
	ChatServer   string  `mapstructure:"chat-server" json:"chat-server" yaml:"chat-server"`       // 客服地址
	RechargeDesc string  `mapstructure:"recharge-desc" json:"recharge-desc" yaml:"recharge-desc"` // 充值描述
}
