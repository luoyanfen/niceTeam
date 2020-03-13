'use strict';

const Controller = require('egg').Controller;

class GetshopController extends Controller {
    async index() {
        const { ctx,service} = this;
        let data = ctx.request.body;
        const result = await service.getGroup.index(data);
        // console.log(data);
        ctx.body = result;
        // console.log(result)
      }

      async groupid() {
        const { ctx,service} = this;
        let data = ctx.request.body;
        const result = await service.getGroup.groupid(data);
        // console.log(data);
        ctx.body = result;
        // console.log(result)
      }
}

module.exports = GetshopController;
