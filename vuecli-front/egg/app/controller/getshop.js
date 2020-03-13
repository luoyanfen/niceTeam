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
      async byid() {
        const { ctx, service } = this;
        let data = ctx.query;
        let result = await service.getShop.byid(data);
        ctx.body = result;
      }
      async updateshop() {
        const { ctx, service } = this;
        let data = ctx.query;
        // console.log(data)
        let result = await service.getShop.updateshop(data.alldate);
        ctx.body = result;
      }
      async deleteshop() {
        const { ctx, service } = this;
        let data = ctx.query;
        // console.log(data)
        let result = await service.getShop.deleteShop(data.id);
        ctx.body = result;
      }
      
}

module.exports = GetshopController;
