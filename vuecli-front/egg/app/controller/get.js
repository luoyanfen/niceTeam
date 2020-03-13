'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    ctx.body = '这是get请求页面';
  }
  async searchtime() {
    const { ctx, service } = this;
    let namedata = ctx.query.name;
    // console.log(data)
    if(!namedata){
      namedata='&'
    }
    const result = await service.getShop.byshname(namedata);
    ctx.body = result;
  }

}

module.exports = HomeController;
