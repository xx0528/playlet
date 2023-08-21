<template>
  <div>
    <div class="gva-form-box">
      <el-form ref="elFormRef" :model="formData" label-position="right" :rules="rule" label-width="80px">
        <el-form-item label="短剧名:" prop="videoName">
          <el-input v-model="formData.videoName" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="短剧类型:" prop="videoType">
          <el-input v-model.number="formData.videoType" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="类型名:" prop="typeName">
          <el-input v-model="formData.typeName" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="简介:" prop="videoDesc">
          <el-input v-model="formData.videoDesc" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="收藏数:" prop="likeCount">
          <el-input v-model.number="formData.likeCount" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="是否完结:" prop="finish">
          <el-input v-model.number="formData.finish" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="集数:" prop="count">
          <el-input v-model.number="formData.count" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="图片:" prop="imgUrl">
          <el-input v-model="formData.imgUrl" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="视频地址:" prop="videoUrl">
          <el-input v-model="formData.videoUrl" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="上架时间:" prop="createTime">
          <el-date-picker v-model="formData.createTime" type="date" placeholder="选择日期" :clearable="true" />
        </el-form-item>
        <el-form-item label="免费集数:" prop="freeCount">
          <el-input v-model.number="formData.freeCount" :clearable="true" placeholder="请输入" />
        </el-form-item>
        <el-form-item label="解锁集数:" prop="lockCount">
          <el-input v-model.number="formData.lockCount" :clearable="true" placeholder="请输入" />
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
  name: 'PlVideo'
}
</script>

<script setup>
import {
  createPlVideo,
  updatePlVideo,
  findPlVideo
} from '@/api/plVideo'

// 自动获取字典
import { getDictFunc } from '@/utils/format'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { ref, reactive } from 'vue'
const route = useRoute()
const router = useRouter()

const type = ref('')
const formData = ref({
  videoName: '',
  videoType: 0,
  typeName: '',
  videoDesc: '',
  likeCount: 0,
  finish: 0,
  count: 0,
  imgUrl: '',
  videoUrl: '',
  createTime: new Date(),
  freeCount: 0,
  lockCount: 0,
})
// 验证规则
const rule = reactive({
  videoName: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  videoType: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  count: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  videoUrl: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  freeCount: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
  lockCount: [{
    required: true,
    message: '',
    trigger: ['input', 'blur'],
  }],
})

const elFormRef = ref()

// 初始化方法
const init = async() => {
  // 建议通过url传参获取目标数据ID 调用 find方法进行查询数据操作 从而决定本页面是create还是update 以下为id作为url参数示例
  if (route.query.id) {
    const res = await findPlVideo({ ID: route.query.id })
    if (res.code === 0) {
      formData.value = res.data.replVideo
      type.value = 'update'
    }
  } else {
    type.value = 'create'
  }
}

init()
// 保存按钮
const save = async() => {
      elFormRef.value?.validate(async(valid) => {
        if (!valid) return
        let res
        switch (type.value) {
          case 'create':
            res = await createPlVideo(formData.value)
            break
          case 'update':
            res = await updatePlVideo(formData.value)
            break
          default:
            res = await createPlVideo(formData.value)
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
