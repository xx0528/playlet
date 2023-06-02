/*
 * @Author: xx
 * @Date: 2023-06-02 18:28:19
 * @LastEditTime: 2023-06-02 18:54:32
 * @Description:
 */
// 自动生成模板PlVideo
package playlet

import (
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// PlVideo 结构体
type PlVideo struct {
	global.GVA_MODEL
	VideoName  string    `json:"videoName" form:"videoName" gorm:"column:video_name;comment:短剧名;"`
	VideoType  int       `json:"videoType" form:"videoType" gorm:"column:video_type;comment:短剧类型;"`
	TypeName   string    `json:"typeName" form:"typeName" gorm:"column:type_name;comment:类型名;"`
	VideoDesc  string    `json:"videoDesc" form:"videoDesc" gorm:"column:video_desc;comment:简介;"`
	LikeCount  int       `json:"likeCount" form:"likeCount" gorm:"column:like_count;comment:收藏数;"`
	Finish     int       `json:"finish" form:"finish" gorm:"column:finish;comment:是否完结;"`
	Hot        int       `json:"hot" form:"hot" gorm:"column:hot;comment:是否推荐;"`
	Count      int       `json:"count" form:"count" gorm:"column:count;comment:集数;"`
	ImgUrl     string    `json:"imgUrl" form:"imgUrl" gorm:"column:img_url;comment:图片;"`
	VideoUrl   string    `json:"videoUrl" form:"videoUrl" gorm:"column:video_url;comment:视频地址;"`
	CreateTime time.Time `json:"createTime" form:"createTime" gorm:"column:create_time;comment:上架时间;"`
	FreeCount  int       `json:"freeCount" form:"freeCount" gorm:"column:free_count;comment:免费集数;"`
	CreatedBy  uint      `gorm:"column:created_by;comment:创建者"`
	UpdatedBy  uint      `gorm:"column:updated_by;comment:更新者"`
	DeletedBy  uint      `gorm:"column:deleted_by;comment:删除者"`
}

// TableName PlVideo 表名
func (PlVideo) TableName() string {
	return "pl_video"
}
