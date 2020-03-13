'use strict';

const Service = require('egg').Service;

class adminDeleteService extends Service {
  async index(value) {
    const { app } = this;
    console.log(value.uid)
    let result=await app.mysql.delete('nuser',{uid:value.uid});
    if(result.affectedRows === 1){
        return {
            code:1,
            msg:'删除成功'
        }
    }else{
        return {
            code:-1,
            msg:'删除失败'
        }
    }
    
  }
  
}

module.exports = adminDeleteService;