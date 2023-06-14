package playlet

import (
	"fmt"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	"github.com/gofrs/uuid"
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
func (plUserService *PlUserService) DeletePlUser(plUser playlet.PlUser) (err error) {
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
func (plUserService *PlUserService) DeletePlUserByIds(ids request.IdsReq, deleted_by uint) (err error) {
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
func (plUserService *PlUserService) UpdatePlUser(plUser playlet.PlUser) (err error) {
	err = global.GVA_DB.Save(&plUser).Error
	return err
}

// GetPlUser 根据id获取PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService) GetPlUser(id uint) (plUser playlet.PlUser, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plUser).Error
	return
}

func (plUserService *PlUserService) GetPlUserByUUID(uuid uuid.UUID) (plUser playlet.PlUser, err error) {
	err = global.GVA_DB.Where("uuid = ?", uuid).First(&plUser).Error
	return
}

// GetPlUserInfoList 分页获取PlUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (plUserService *PlUserService) GetPlUserInfoList(info playletReq.PlUserSearch) (list []playlet.PlUser, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&playlet.PlUser{})
	var plUsers []playlet.PlUser
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Limit(limit).Offset(offset).Find(&plUsers).Error
	return plUsers, total, err
}

func (plUserService *PlUserService) RegistAndLogin(u *playlet.PlUser) (userInter *playlet.PlUser, err error) {
	if nil == global.GVA_DB {
		return nil, fmt.Errorf("db not init")
	}

	var user playlet.PlUser
	err = global.GVA_DB.Where("user_id = ?", u.UserId).First(&user).Error
	if err != nil {
		//没有 就注册一个
		u.UUID = uuid.Must(uuid.NewV4())
		u.RegisterTime = time.Now()
		u.LastLoginTime = time.Now()
		u.AuthorityId = 10
		err = global.GVA_DB.Create(&u).Error
		return u, err
	}
	err = global.GVA_DB.Model(&playlet.PlUser{}).Where("uuid = ?", user.UUID).Update("last_login_time", time.Now()).Error
	return &user, err
}
