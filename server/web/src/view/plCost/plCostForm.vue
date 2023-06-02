<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="用户名:" prop="userName">
          <el-input v-model="formData.userName" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="用户Id:" prop="userId">
          <el-input v-model.number="formData.userId" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="消费金币:" prop="costGold">
          <el-input-number v-model="formData.costGold" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="时间:" prop="time">
          <el-date-picker v-model="formData.time" type="date" placeholder="选择日期" :clearable="true"></el-date-picker>
        </el-form-item>
        <el-form-item label="剩余金币:" prop="leftGold">
          <el-input-number v-model="formData.leftGold" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="购买视频:" prop="buyVideo">
          <el-input v-model="formData.buyVideo" :clearable="true" placeholder="请输入" />
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
  name: 'PlCost'
}
</script>

<script setup>
import {
  createPlCost,
  updatePlCost,
  findPlCost
} from '@/api/plCost'

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
            userId: 0,
            costGold: 0,
            time: new Date(),
            leftGold: 0,
            buyVideo: '',
        })
// 验证规则
const rule = reactive({
               userId : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               costGold : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               leftGold : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               buyVideo : [{
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
      const res = await findPlCost({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.replCost
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
               res = await createPlCost(formData.value)
               break
             case 'update':
               res = await updatePlCost(formData.value)
               break
             default:
               res = await createPlCost(formData.value)
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
