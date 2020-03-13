'use strict'

const Service = require('egg').Service;

class GetTypeService extends Service{
    
    //获取店铺类型表
    async index(data){
        const {app} = this;
        const results = await app.mysql.select('shtype',{
            where:{
                shtid:data.typeid
            }
        });
        return results;
    }
}

module.exports = GetTypeService;