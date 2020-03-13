'use strict'

const Service = require('egg').Service;

class GetInfoService extends Service{
    
    //查所有店铺信息
    async index(){
        const {app} = this;
        const results = await app.mysql.select('shop');
        return results;
    }
}

module.exports = GetInfoService;