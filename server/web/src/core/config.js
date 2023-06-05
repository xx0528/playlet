/*
 * @Author: xx
 * @Date: 2023-06-02 16:53:56
 * @LastEditTime: 2023-06-05 15:32:56
 * @Description: 
 */
/**
 * 网站配置文件
 */

const config = {
  appName: 'Playlet-Admin',
  appLogo: 'https://www.gin-vue-admin.com/img/logo.png',
  showViteLogo: true
}

export const viteLogo = (env) => {
  if (config.showViteLogo) {
    const chalk = require('chalk')
    console.log(
      chalk.green(
        `> 当前版本:v2.5.5`
      )
    )
    console.log('\n')
  }
}

export default config
