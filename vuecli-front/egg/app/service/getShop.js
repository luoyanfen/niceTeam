'use strict'

const Service = require('egg').Service;

class GetShopService extends Service{
    //获取店铺信息
    async index(data){
        const {app} = this;
        const results = await app.mysql.select('shop',{
            where:{
                shid:data.id
            }
        });
        return results;
    }
    //根据店铺类型id获取店铺信息
    async byshtid(data){
        const {app} = this;
        const results = await app.mysql.select('shop',{
            where:{
                shtid:data.id
            }
        });
        return results;
    }
    async byshname(namedata){
        const {app} = this;
        const results = await app.mysql.query(`select shid,shname from shop where shname like '%${namedata}%'`);
        return results;
    }
    async byid(data) {
        // console.log(index);
        const { app } = this;
        let result = await app.mysql.select('shop',{
            where:{
                shid:data.id
            }
        });
       return result;
    }
    async updateshop(data) {
        const { app } = this;
        let fdata = JSON.parse(data);
        // console.log(fdata)
        let result = await app.mysql.update('shop',fdata,{
            where:{
                shid:fdata.shid
            }
        });
       return result;
    }
    async deleteShop(data) {
        const { app } = this;
        let result = await app.mysql.delete('shop',{
            shid:data
        });
       return result;
    }
    
}

module.exports = GetShopService;