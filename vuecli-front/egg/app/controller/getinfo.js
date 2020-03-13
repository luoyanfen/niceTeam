'use strict';

const Controller = require('egg').Controller;

class GetinfoController extends Controller {
  //查询所有店铺信息
  async index() {
    const { ctx,service} = this;
    const result = await service.getInfo.index();
    ctx.body = result;
  }
}

module.exports = GetinfoController;
