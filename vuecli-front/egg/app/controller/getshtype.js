'use strict';

const Controller = require('egg').Controller;

class GetshtypeController extends Controller {
  async index() {
    const { ctx, service } = this;
    let result = await service.getShtype.index();
    ctx.body = result;
  }
}

module.exports = GetshtypeController;
