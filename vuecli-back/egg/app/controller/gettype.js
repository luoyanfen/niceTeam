'use strict';

const Controller = require('egg').Controller;

class GettypeController extends Controller {
    //获取店铺类型表
    async index() {
        const { ctx,service} = this;
        let data = ctx.request.body;
        const result = await service.getType.index(data);
        // console.log(data);
        ctx.body = result;
        // console.log(result)
      }
}

module.exports = GettypeController;
