'use strict';

const Service = require('egg').Service;

class LoginService extends Service {
  async index(value) {
    const { app } = this;
    let result = await app.mysql.select('nuser');
    let flag = result.some(
      item => item.uaccount == value.account && item.upassword == value.password
    )
    let flag2 = result.some(
      item => item.uaccount == value.account && item.upassword != value.password
    )
    let demo = '';
    result.forEach(item => { if (item.uaccount == value.account) { return demo = item } })
    console.log()
    if (flag2) {
      return {
        code: 0,
        mesg: '密码错误'
      }
    }
    if (flag) {
      return {
        code: 1,
        mesg: '登录成功',
        userInfo: demo,
      }
    }
    if (!flag) {
      return {
        code: -1,
        mesg: '用户不存在，请注册'
      }
    }
  }
}

module.exports = LoginService;