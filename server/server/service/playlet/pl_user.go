package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
    "gorm.io/gorm"
)

type PlUserService struct {
}

// CreatePlUser 创建PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService) CreatePlUser(plUser *playlet.PlUser) (err error) {
	err = global.GVA_DB.Create(plUser).Error
	return err
}

// DeletePlUser 删除PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService)DeletePlUser(plUser playlet.PlUser) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&playlet.PlUser{}).Where("id = ?", plUser.ID).Update("deleted_by", plUser.DeletedBy).Error; err != nil {
              return err
        }
        if err = tx.Delete(&plUser).Error; err != nil {
              return err
        }
        return nil
	})
	return err
}

// DeletePlUserByIds 批量删除PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService)DeletePlUserByIds(ids request.IdsReq,deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
	    if err := tx.Model(&playlet.PlUser{}).Where("id in ?", ids.Ids).Update("deleted_by", deleted_by).Error; err != nil {
            return err
        }
        if err := tx.Where("id in ?", ids.Ids).Delete(&playlet.PlUser{}).Error; err != nil {
            return err
        }
        return nil
    })
	return err
}

// UpdatePlUser 更新PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService)UpdatePlUser(plUser playlet.PlUser) (err error) {
	err = global.GVA_DB.Save(&plUser).Error
	return err
}

// GetPlUser 根据id获取PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService)GetPlUser(id uint) (plUser playlet.PlUser, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plUser).Error
	return
}

// GetPlUserInfoList 分页获取PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService)GetPlUserInfoList(info playletReq.PlUserSearch) (list []playlet.PlUser, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&playlet.PlUser{})
    var plUsers []playlet.PlUser
    // 如果有条件搜索 下方会自动创建搜索语句
    if info.StartCreatedAt !=nil && info.EndCreatedAt !=nil {
     db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
    }
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }

	err = db.Limit(limit).Offset(offset).Find(&plUsers).Error
	return  plUsers, total, err
}
