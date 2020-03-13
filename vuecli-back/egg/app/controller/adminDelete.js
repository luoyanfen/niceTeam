'use strict';

const Controller = require('egg').Controller;

class adminDeleteController extends Controller {
  async index() {
    const { ctx, service } = this;
    let formData = ctx.request.query;
    let result = await service.adminDelete.index(formData);
    ctx.body = result;
  }
}

module.exports = adminDeleteController;