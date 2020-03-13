'use strict';

const Controller = require('egg').Controller;

class LoginController extends Controller {
  async index() {
    const { ctx, service } = this;
    let formData = ctx.request.body;
    let result = await service.login.index(formData);
    ctx.body = result;
  }
}

module.exports = LoginController;
