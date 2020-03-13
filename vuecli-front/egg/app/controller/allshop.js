'use strict';

const Controller = require('egg').Controller;

class AllshopController extends Controller {
  async index() {
    const { ctx, service } = this;
    let result = await service.allShop.index();
    ctx.body = result;
  }
}

module.exports = AllshopController;
