'use strict';

const Controller = require('egg').Controller;

class adminLoginController extends Controller {
  async index() {
    const { ctx, service } = this;
    let formData = ctx.request.query;
    let result = await service.adminLogin.index(formData);
    ctx.body = result;
  }
}

module.exports = adminLoginController;