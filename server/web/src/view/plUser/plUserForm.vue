<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="用户名:" prop="userName">
          <el-input v-model="formData.userName" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="用户Id:" prop="userId">
          <el-input v-model="formData.userId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="访客id:" prop="guestId">
          <el-input v-model="formData.guestId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="累计充值:" prop="recharge">
          <el-input-number v-model="formData.recharge" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="当前金币:" prop="curGold">
          <el-input-number v-model="formData.curGold" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="解锁记录:" prop="buyVideos">
          <el-input v-model="formData.buyVideos" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="注册时间:" prop="registerTime">
          <el-date-picker v-model="formData.registerTime" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
        </el-form-item>
        <el-form-item label="最后登录时间:" prop="lastLoginTime">
          <el-date-picker v-model="formData.lastLoginTime" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
        </el-form-item>
        <el-form-item label="收藏剧集:" prop="likeVideos">
          <el-input v-model="formData.likeVideos" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save">保存</el-button>
          <el-button type="primary" @click="back">返回</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PlUser'
}
</script>

<script setup>
import {
  createPlUser,
  updatePlUser,
  findPlUser
} from '@/api/plUser'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            userName: '',
            userId: '',
            guestId: '',
            recharge: 0,
            curGold: 0,
            buyVideos: '',
            registerTime: new Date(),
            lastLoginTime: new Date(),
            likeVideos: '',
        })
// 验证规则
const rule = reactive({
               userId : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
})

const elFormRef = ref()

// 初始化方法
const init = async () => {
 // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
    if (route.query.id) {
      const res = await findPlUser({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.replUser
        type.value = 'update'
      }
    } else {
      type.value = 'create'
    }
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate( async (valid) => {
         if (!valid) return
            let res
           switch (type.value) {
             case 'create':
               res = await createPlUser(formData.value)
               break
             case 'update':
               res = await updatePlUser(formData.value)
               break
             default:
               res = await createPlUser(formData.value)
               break
           }
           if (res.code === 0) {
             ElMessage({
               type: 'success',
               message: '创建/更改成功'
             })
           }
       })
}

// 返回按钮
const back = () => {
    router.go(-1)
}

</script>

<style>
</style>
