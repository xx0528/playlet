<template>
  <div>
    <div class="gva-form-box">
      <el-form :model="formData" ref="elFormRef" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="货币类型:" prop="moneyType">
          <el-input v-model.number="formData.moneyType" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="充值金额:" prop="costMoney">
          <el-input-number v-model="formData.costMoney" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="多送价值:" prop="giveMoney">
          <el-input-number v-model="formData.giveMoney" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="购买金币:" prop="buyGold">
          <el-input-number v-model="formData.buyGold" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="赠送金币:" prop="giveGold">
          <el-input-number v-model="formData.giveGold" :precision="2" :clearable="true"></el-input-number>
        </el-form-item>
        <el-form-item label="是否是首冲奖励:" prop="firstRecharge">
          <el-input v-model.number="formData.firstRecharge" :clearable="true" placeholder="请输入" />
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
  name: 'PlVip'
}
</script>

<script setup>
import {
  createPlVip,
  updatePlVip,
  findPlVip
} from '@/api/plVip'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from "vue-router"
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
            moneyType: 0,
            costMoney: 0,
            giveMoney: 0,
            buyGold: 0,
            giveGold: 0,
            firstRecharge: 0,
        })
// 验证规则
const rule = reactive({
               moneyType : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               costMoney : [{
                   required: true,
                   message: '',
                   trigger: ['input','blur'],
               }],
               buyGold : [{
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
      const res = await findPlVip({ ID: route.query.id })
      if (res.code === 0) {
        formData.value = res.data.replVip
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
               res = await createPlVip(formData.value)
               break
             case 'update':
               res = await updatePlVip(formData.value)
               break
             default:
               res = await createPlVip(formData.value)
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
