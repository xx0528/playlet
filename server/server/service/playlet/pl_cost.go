package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	"gorm.io/gorm"
)

type PlCostService struct {
}

// CreatePlCost 创建PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) CreatePlCost(plCost *playlet.PlCost) (err error) {
	err = global.GVA_DB.Create(plCost).Error
	return err
}

// DeletePlCost 删除PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) DeletePlCost(plCost playlet.PlCost) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlCost{}).Where("id = ?", plCost.ID).Update("deleted_by", plCost.DeletedBy).Error; err != nil {
			return err
		}
		if err = tx.Delete(&plCost).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// DeletePlCostByIds 批量删除PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) DeletePlCostByIds(ids request.IdsReq, deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlCost{}).Where("id in ?", ids.Ids).Update("deleted_by", deleted_by).Error; err != nil {
			return err
		}
		if err := tx.Where("id in ?", ids.Ids).Delete(&playlet.PlCost{}).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// UpdatePlCost 更新PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) UpdatePlCost(plCost playlet.PlCost) (err error) {
	err = global.GVA_DB.Save(&plCost).Error
	return err
}

// GetPlCost 根据id获取PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) GetPlCost(id uint) (plCost playlet.PlCost, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plCost).Error
	return
}

// GetPlCostInfoList 分页获取PlCost记录
// Author [piexlmax](https://github.com/piexlmax)
func (plCostService *PlCostService) GetPlCostInfoList(info playletReq.PlCostSearch) (list []playlet.PlCost, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&playlet.PlCost{})
	var plCosts []playlet.PlCost
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Order("created_at desc").Limit(limit).Offset(offset).Find(&plCosts).Error
	return plCosts, total, err
}
