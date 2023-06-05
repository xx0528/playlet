/*
 * @Author: xx
 * @Date: 2023-06-02 16:53:55
 * @LastEditTime: 2023-06-05 14:58:35
 * @Description: 
 */
/*
*/

// var child_process = require('child_process')

// var url = 'https://www.gin-vue-admin.com'
// var cmd = ''
console.log(process.platform)
switch (process.platform) {
  case 'win32':
    cmd = 'start'
    // child_process.exec(cmd + ' ' + url)
    break

  case 'darwin':
    cmd = 'open'
    // child_process.exec(cmd + ' ' + url)
    break
}
