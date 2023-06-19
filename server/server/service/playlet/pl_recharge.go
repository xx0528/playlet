/*
 * @Author: xx
 * @Date: 2023-06-02 18:40:17
 * @LastEditTime: 2023-06-19 17:57:38
 * @Description:
 */
package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	"gorm.io/gorm"
)

type PlRechargeService struct {
}

// CreatePlRecharge 创建PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) CreatePlRecharge(plRecharge *playlet.PlRecharge) (err error) {
	err = global.GVA_DB.Create(plRecharge).Error
	return err
}

// DeletePlRecharge 删除PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) DeletePlRecharge(plRecharge playlet.PlRecharge) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlRecharge{}).Where("id = ?", plRecharge.ID).Update("deleted_by", plRecharge.DeletedBy).Error; err != nil {
			return err
		}
		if err = tx.Delete(&plRecharge).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// DeletePlRechargeByIds 批量删除PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) DeletePlRechargeByIds(ids request.IdsReq, deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlRecharge{}).Where("id in ?", ids.Ids).Update("deleted_by", deleted_by).Error; err != nil {
			return err
		}
		if err := tx.Where("id in ?", ids.Ids).Delete(&playlet.PlRecharge{}).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// UpdatePlRecharge 更新PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) UpdatePlRecharge(plRecharge playlet.PlRecharge) (err error) {
	err = global.GVA_DB.Save(&plRecharge).Error
	return err
}

// GetPlRecharge 根据id获取PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) GetPlRecharge(id uint) (plRecharge playlet.PlRecharge, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plRecharge).Error
	return
}

// GetPlRechargeInfoList 分页获取PlRecharge记录
// Author [piexlmax](https://github.com/piexlmax)
func (plRechargeService *PlRechargeService) GetPlRechargeInfoList(info playletReq.PlRechargeSearch) (list []playlet.PlRecharge, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&playlet.PlRecharge{})
	var plRecharges []playlet.PlRecharge
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Order("created_at desc").Limit(limit).Offset(offset).Find(&plRecharges).Error
	return plRecharges, total, err
}
