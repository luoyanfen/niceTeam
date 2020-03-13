'use strict';

const Controller = require('egg').Controller;

class AddbuyController extends Controller {
  //获取店铺信息
    async index() {
        const { ctx,service} = this;
        let data = ctx.request.body;
        const result = await service.addBuy.index(data);
        // console.log(data);
        let fromdate ={
            code:0,
            msg:"已加入购物车"
        }
        ctx.body = fromdate;
        // console.log(result)
      }
}

module.exports = AddbuyController;
