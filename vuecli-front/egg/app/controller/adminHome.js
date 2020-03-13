'use strict';

const Controller = require('egg').Controller;

class adminHomeController extends Controller {
  async index() {
    const { ctx, service } = this;
    let formData = ctx.request.query;
    let result = await service.adminHome.index(formData);
    ctx.body = result;
  }
}

module.exports = adminHomeController;