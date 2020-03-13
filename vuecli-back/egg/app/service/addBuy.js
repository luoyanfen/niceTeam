'use strict'

const Service = require('egg').Service;

class AddBuyService extends Service{
    
    //查所有店铺信息
    async index(data){
        const {app} = this;
        const result = await app.mysql.insert('buy', { uid: data.uid,gid:data.gid,shid:data.shid,buynum:data.buynum});
        return result;
    }
}

module.exports = AddBuyService;