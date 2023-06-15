package playlet

import (
	"encoding/json"
	"fmt"
	"math"
	"strconv"
	"time"

	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/playlet"
	playletReq "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/request"
	playletRes "github.com/flipped-aurora/gin-vue-admin/server/model/playlet/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/system"
	systemReq "github.com/flipped-aurora/gin-vue-admin/server/model/system/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"github.com/go-redis/redis/v8"
	"go.uber.org/zap"
)

type PlUserApi struct {
}

var plUserService = service.ServiceGroupApp.PlayletServiceGroup.PlUserService

// CreatePlUser 创建PlUser
// @Tags PlUser
// @Summary 创建PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "创建PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/createPlUser [post]
func (plUserApi *PlUserApi) CreatePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plUser.CreatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"UserId": {utils.NotEmpty()},
	}
	if err := utils.Verify(plUser, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plUserService.CreatePlUser(&plUser); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeletePlUser 删除PlUser
// @Tags PlUser
// @Summary 删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /plUser/deletePlUser [delete]
func (plUserApi *PlUserApi) DeletePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plUser.DeletedBy = utils.GetUserID(c)
	if err := plUserService.DeletePlUser(plUser); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeletePlUserByIds 批量删除PlUser
// @Tags PlUser
// @Summary 批量删除PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /plUser/deletePlUserByIds [delete]
func (plUserApi *PlUserApi) DeletePlUserByIds(c *gin.Context) {
	var IDS request.IdsReq
	err := c.ShouldBindJSON(&IDS)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	deletedBy := utils.GetUserID(c)
	if err := plUserService.DeletePlUserByIds(IDS, deletedBy); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdatePlUser 更新PlUser
// @Tags PlUser
// @Summary 更新PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body playlet.PlUser true "更新PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /plUser/updatePlUser [put]
func (plUserApi *PlUserApi) UpdatePlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindJSON(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	plUser.UpdatedBy = utils.GetUserID(c)
	verify := utils.Rules{
		"UserId": {utils.NotEmpty()},
	}
	if err := utils.Verify(plUser, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := plUserService.UpdatePlUser(plUser); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindPlUser 用id查询PlUser
// @Tags PlUser
// @Summary 用id查询PlUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playlet.PlUser true "用id查询PlUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /plUser/findPlUser [get]
func (plUserApi *PlUserApi) FindPlUser(c *gin.Context) {
	var plUser playlet.PlUser
	err := c.ShouldBindQuery(&plUser)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if replUser, err := plUserService.GetPlUser(plUser.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"replUser": replUser}, c)
	}
}

// GetPlUserList 分页获取PlUser列表
// @Tags PlUser
// @Summary 分页获取PlUser列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query playletReq.PlUserSearch true "分页获取PlUser列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /plUser/getPlUserList [get]
func (plUserApi *PlUserApi) GetPlUserList(c *gin.Context) {
	var pageInfo playletReq.PlUserSearch
	err := c.ShouldBindQuery(&pageInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := plUserService.GetPlUserInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}

// 播放一个视频
func (pUserApi *PlUserApi) PlayVideo(c *gin.Context) {
	var reqInfo playletReq.PlVideoInfo
	err := c.ShouldBind(&reqInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	verify := utils.Rules{
		"ID":      {utils.NotEmpty()},
		"Episode": {utils.NotEmpty()},
	}
	if err := utils.Verify(reqInfo, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	//获取视频信息
	videoInfo, err := plVideoService.GetPlVideo(reqInfo.ID)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	//免费集数
	if videoInfo.FreeCount >= reqInfo.Episode {
		response.OkWithData(playletRes.PlPlayVideoRes{
			PlVideoInfo: reqInfo,
			Code:        1,
			Msg:         "免费",
		}, c)
		return
	}

	//获取用户信息
	uuid := utils.GetUserUuid(c)
	user, err := plUserService.GetPlUserByUUID(uuid)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	// 购买过
	buyNum := getBuyVideoByID(user.BuyVideos, int(reqInfo.ID))
	if buyNum >= reqInfo.Episode {
		response.OkWithData(playletRes.PlPlayVideoRes{
			PlVideoInfo: reqInfo,
			Code:        2,
			Msg:         "已购",
		}, c)
		return
	}

	//不允许跳着播放
	if reqInfo.Episode-buyNum > 1 {
		reqInfo.Episode = int(math.Min(float64(buyNum+1), float64(videoInfo.Count)))
	}

	// 有钱直接花
	if user.CurGold > global.GVA_CONFIG.Playlet.EpisodeCost {
		//扣除金币
		user.CurGold = user.CurGold - global.GVA_CONFIG.Playlet.EpisodeCost
		user.BuyVideos = updateVideoRecord(user.BuyVideos, reqInfo, "buy")
		plCost := playlet.PlCost{
			UserName: user.UserName,
			UserId:   user.UserId,
			CostGold: global.GVA_CONFIG.Playlet.EpisodeCost,
			Time:     time.Now(),
			LeftGold: user.CurGold,
			BuyVideo: fmt.Sprintf("%s  ID:%d 第%d集", videoInfo.VideoName, reqInfo.ID, reqInfo.Episode),
		}
		//更新数据
		if err := plUserService.UpdatePlUser(user); err == nil {
			response.OkWithData(playletRes.PlPlayVideoRes{
				PlVideoInfo: reqInfo,
				Code:        3,
				Msg:         "解锁成功",
			}, c)
		}
		//记录日志
		if err := plCostService.CreatePlCost(&plCost); err != nil {
			global.GVA_LOG.Error("记录购买失败", zap.Error(err))
		}
		return
	}

	response.OkWithData(playletRes.PlPlayVideoRes{
		Code: 4,
		Msg:  "无法播放，请充值",
	}, c)
}

// 收藏视频
func (pUserApi *PlUserApi) LikeVideo(c *gin.Context) {
	var reqInfo playletReq.PlVideoInfo
	err := c.ShouldBind(&reqInfo)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	verify := utils.Rules{
		"ID": {utils.NotEmpty()},
	}
	if err := utils.Verify(reqInfo, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	// 因为是收藏 这里直接给个大值就可以
	reqInfo.Episode = 2

	//获取用户信息
	uuid := utils.GetUserUuid(c)
	user, err := plUserService.GetPlUserByUUID(uuid)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	user.LikeVideos = updateVideoRecord(user.LikeVideos, reqInfo, "like")
	//更新数据
	if err := plUserService.UpdatePlUser(user); err == nil {
		response.OkWithData(playletRes.PlLikeVideoRes{
			LikeVideos: user.LikeVideos,
		}, c)
	} else {
		response.FailWithMessage(err.Error(), c)
	}
}

// 获取playlet用户信息
func (plUserApi *PlUserApi) GetPlUserInfo(c *gin.Context) {
	uuid := utils.GetUserUuid(c)
	userInfo, err := plUserService.GetPlUserByUUID(uuid)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	response.OkWithDetailed(userInfo, "登陆成功", c)
}

// 登陆 没有账号就注册
func (plUserApi *PlUserApi) RegistAndLogin(c *gin.Context) {
	//这里需要鉴权 所以还是直接用 system.SysUser
	var l playletReq.PlLoginReq
	err := c.ShouldBind(&l)
	key := c.ClientIP()

	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	err = utils.Verify(l, utils.PlLoginVerify)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	// 判断验证码是否开启
	openCaptcha := global.GVA_CONFIG.Captcha.OpenCaptcha               // 是否开启防爆次数
	openCaptchaTimeOut := global.GVA_CONFIG.Captcha.OpenCaptchaTimeOut // 缓存超时时间
	v, ok := global.BlackCache.Get(key)
	if !ok {
		global.BlackCache.Set(key, 1, time.Second*time.Duration(openCaptchaTimeOut))
	}

	var oc bool = openCaptcha == 0 || openCaptcha < interfaceToInt(v)

	if !oc {
		usr := &playlet.PlUser{UserId: l.Username, Password: l.Password}
		user, err := plUserService.RegistAndLogin(usr)
		if err != nil {
			global.GVA_LOG.Error("登陆失败! 用户名不存在或者密码错误!", zap.Error(err))
			// 验证码次数+1
			global.BlackCache.Increment(key, 1)
			response.FailWithMessage("用户名不存在或者密码错误", c)
			return
		}
		if user.Enable != 1 {
			global.GVA_LOG.Error("登陆失败! 用户被禁止登录!")
			// 验证码次数+1
			global.BlackCache.Increment(key, 1)
			response.FailWithMessage("用户被禁止登录", c)
			return
		}
		plUserApi.TokenNext(c, *user)
		return
	}
	// 验证码次数+1
	global.BlackCache.Increment(key, 1)
}

// TokenNext 登录以后签发jwt 发jwt还是走的后台用户
func (plUserApi *PlUserApi) TokenNext(c *gin.Context, user playlet.PlUser) {
	j := &utils.JWT{SigningKey: []byte(global.GVA_CONFIG.JWT.SigningKey)} // 唯一签名
	claims := j.CreateClaims(systemReq.BaseClaims{
		Username:    user.UserId,
		ID:          user.ID,
		UUID:        user.UUID,
		NickName:    user.UserName,
		AuthorityId: user.AuthorityId,
	})
	token, err := j.CreateToken(claims)
	if err != nil {
		global.GVA_LOG.Error("获取token失败!", zap.Error(err))
		response.FailWithMessage("获取token失败", c)
		return
	}
	if !global.GVA_CONFIG.System.UseMultipoint {
		response.OkWithDetailed(playletRes.PlLoginRes{
			PlUser:    user,
			Token:     token,
			ExpiresAt: claims.RegisteredClaims.ExpiresAt.Unix() * 1000,
		}, "登录成功", c)
		return
	}

	if jwtStr, err := jwtService.GetRedisJWT(user.UserName); err == redis.Nil {
		if err := jwtService.SetRedisJWT(token, user.UserName); err != nil {
			global.GVA_LOG.Error("设置登录状态失败!", zap.Error(err))
			response.FailWithMessage("设置登录状态失败", c)
			return
		}
		response.OkWithDetailed(playletRes.PlLoginRes{
			PlUser:    user,
			Token:     token,
			ExpiresAt: claims.RegisteredClaims.ExpiresAt.Unix() * 1000,
		}, "登录成功", c)
	} else if err != nil {
		global.GVA_LOG.Error("设置登录状态失败!", zap.Error(err))
		response.FailWithMessage("设置登录状态失败", c)
	} else {
		var blackJWT system.JwtBlacklist
		blackJWT.Jwt = jwtStr
		if err := jwtService.JsonInBlacklist(blackJWT); err != nil {
			response.FailWithMessage("jwt作废失败", c)
			return
		}
		if err := jwtService.SetRedisJWT(token, user.UserName); err != nil {
			response.FailWithMessage("设置登录状态失败", c)
			return
		}
		response.OkWithDetailed(playletRes.PlLoginRes{
			PlUser:    user,
			Token:     token,
			ExpiresAt: claims.RegisteredClaims.ExpiresAt.Unix() * 1000,
		}, "登录成功", c)
	}
}

// 类型转换
func interfaceToInt(v interface{}) (i int) {
	switch v := v.(type) {
	case int:
		i = v
	default:
		i = 0
	}
	return
}

// 获取
func getBuyVideoByID(info string, id int) int {
	if len(info) <= 0 {
		return 0
	}
	var data map[string]interface{}
	if err := json.Unmarshal([]byte(info), &data); err != nil {
		return 0
	}

	buyNumIntf := data[strconv.Itoa(id)]
	if buyNumIntf == nil {
		return 0
	}
	buyNum := int(buyNumIntf.(float64))
	return buyNum
}

func updateVideoRecord(info string, vInfo playletReq.PlVideoInfo, updateType string) string {
	if len(info) <= 0 {
		data := make(map[string]interface{})
		data[strconv.Itoa(int(vInfo.ID))] = vInfo.Episode
		s, _ := json.Marshal(data)
		return string(s)
	}

	var data map[string]interface{}
	err := json.Unmarshal([]byte(info), &data)
	if err == nil {
		//如果是收藏 再点会取消收藏 这里置为0
		id := strconv.Itoa(int(vInfo.ID))
		if updateType == "like" && data[id] != nil && data[id].(float64) > 1 {
			data[id] = 0
		} else {
			data[id] = vInfo.Episode
		}
		s, _ := json.Marshal(data)
		return string(s)
	}
	return ""
}
