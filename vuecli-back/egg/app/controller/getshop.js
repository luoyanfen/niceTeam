'use strict';

const Controller = require('egg').Controller;

class GetshopController extends Controller {
  //获取店铺信息
    async index() {
        const { ctx,service} = this;
        let data = ctx.request.body;
        const result = await service.getShop.index(data);
        // console.log(data);
        ctx.body = result;
        // console.log(result)
      }
      async byshtid() {
        const { ctx,service} = this;
        let shtdata = ctx.request.body;
        const result = await service.getShop.byshtid(shtdata);
        // console.log(data);
        ctx.body = result;
        // console.log(result)
      }
      
}

module.exports = GetshopController;
