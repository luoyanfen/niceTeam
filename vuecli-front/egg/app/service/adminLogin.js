'use strict';

const Service = require('egg').Service;

class adminLoginService extends Service {
  async index(value) {
    const { app } = this;
    let result = await app.mysql.select('auser');
    let demo = '';
    let demoTwo=[];
    result.forEach(item => { if (item.aaccount == value.account && item.apassword==value.password) { return demo = item.a_id } }) 
    console.log("a_id为"+demo);
    let resultTwo=await app.mysql.select('nuser');
    resultTwo.forEach(item => { if (item.a_id == demo) { return demoTwo.push(item) } }) 
    console.log(demoTwo);
    return resultTwo;
  }
}

module.exports = adminLoginService;