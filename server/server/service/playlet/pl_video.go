package playlet

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	"gorm.io/gorm"
)

type PlVideoService struct {
}

// CreatePlVideo 创建PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) CreatePlVideo(plVideo *playlet.PlVideo) (err error) {
	err = global.GVA_DB.Create(plVideo).Error
	return err
}

// DeletePlVideo 删除PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) DeletePlVideo(plVideo playlet.PlVideo) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlVideo{}).Where("id = ?", plVideo.ID).Update("deleted_by", plVideo.DeletedBy).Error; err != nil {
			return err
		}
		if err = tx.Delete(&plVideo).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// DeletePlVideoByIds 批量删除PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) DeletePlVideoByIds(ids request.IdsReq, deleted_by uint) (err error) {
	err = global.GVA_DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&playlet.PlVideo{}).Where("id in ?", ids.Ids).Update("deleted_by", deleted_by).Error; err != nil {
			return err
		}
		if err := tx.Where("id in ?", ids.Ids).Delete(&playlet.PlVideo{}).Error; err != nil {
			return err
		}
		return nil
	})
	return err
}

// UpdatePlVideo 更新PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) UpdatePlVideo(plVideo playlet.PlVideo) (err error) {
	err = global.GVA_DB.Save(&plVideo).Error
	return err
}

// GetPlVideo 根据id获取PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) GetPlVideo(id uint) (plVideo playlet.PlVideo, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&plVideo).Error
	return
}

// GetPlVideoInfoList 分页获取PlVideo记录
// Author [piexlmax](https://github.com/piexlmax)
func (plVideoService *PlVideoService) GetPlVideoInfoList(info playletReq.PlVideoSearch) (list []playlet.PlVideo, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&playlet.PlVideo{})
	var plVideos []playlet.PlVideo
	// 如果有条件搜索 下方会自动创建搜索语句
	if info.StartCreatedAt != nil && info.EndCreatedAt != nil {
		db = db.Where("created_at BETWEEN ? AND ?", info.StartCreatedAt, info.EndCreatedAt)
	}
	err = db.Count(&total).Error
	if err != nil {
		return
	}

	err = db.Order("created_at desc").Limit(limit).Offset(offset).Find(&plVideos).Error
	return plVideos, total, err
}
