'use strict'

const Service = require('egg').Service;

class GetGroupService extends Service{
    
    //根据店铺id获取团购信息
    async index(data){
        const {app} = this;
        const results = await app.mysql.select('group',{
            where:{
                shid:data.id
            }
        });
        return results;
    }

    //根据团购id获取团购信息
    async groupid(data){
        const {app} = this;
        const results = await app.mysql.select('group',{
            where:{
                gid:data.id
            }
        });
        return results;
    }
}

module.exports = GetGroupService;