'use strict';

const Service = require('egg').Service;

class adminHomeService extends Service {
  async index(value) {
    const { app } = this;
    const options={
        where:{
            uid: value.uid
        }
    }
    const demo={
        uname:value.uname,
        uaccount:value.uaccount,
        upassword:value.upassword,
        uemail:value.uemail,
    }
    let result =await app.mysql.update('nuser',demo,options);
    if(result.affectedRows === 1){
        return {
            code:1,
            msg:'更新成功'
        }
    }else{
        return {
            code:-1,
            msg:'更新失败'
        }
    }
    
  }
  
}

module.exports = adminHomeService;