package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
    "gorm.io/gorm"
)

type PlVipService struct {
}

// CreatePlVip 创建PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService) CreatePlVip(plVip *playlet.PlVip) (err error) {
	err = global.GVA_DB.Create(plVip).Error
	return err
}

// DeletePlVip 删除PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService)DeletePlVip(plVip playlet.PlVip) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&playlet.PlVip{}).Where("id = ?", plVip.ID).Update("deleted_by", plVip.DeletedBy).Error; err != nil {
              return err
        }
        if err = tx.Delete(&plVip).Error; err != nil {
              return err
        }
        return nil
	})
	return err
}

// DeletePlVipByIds 批量删除PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService)DeletePlVipByIds(ids request.IdsReq,deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&playlet.PlVip{}).Where("id in ?", ids.Ids).Update("deleted_by", deleted_by).Error; err != nil {
            return err
        }
        if err := tx.Where("id in ?", ids.Ids).Delete(&playlet.PlVip{}).Error; err != nil {
            return err
        }
        return nil
    })
	return err
}

// UpdatePlVip 更新PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService)UpdatePlVip(plVip playlet.PlVip) (err error) {
	err = global.GVA_DB.Save(&plVip).Error
	return err
}

// GetPlVip 根据id获取PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService)GetPlVip(id uint) (plVip playlet.PlVip, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plVip).Error
	return
}

// GetPlVipInfoList 分页获取PlVip记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVipService *PlVipService)GetPlVipInfoList(info playletReq.PlVipSearch) (list []playlet.PlVip, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&playlet.PlVip{})
    var plVips []playlet.PlVip
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	err = db.Limit(limit).Offset(offset).Find(&plVips).Error
	return  plVips, total, err
}
