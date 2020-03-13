'use strict';

const Controller = require('egg').Controller;

class addshopController extends Controller {
  async index() {
    const { ctx, service } = this;
    let formData = ctx.query.shopobj;
    console.log(formData)
    let result = await service.addShop.index(formData);
    ctx.body = result;
  }
}

module.exports = addshopController;