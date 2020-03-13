'use strict';

const Controller = require('egg').Controller;

class ktvShopController extends Controller {
    async index() {
        const { ctx,service } = this;
        let result =await service.ktvShop.index();
        let data = result;
        ctx.body=data;
    }
}

module.exports =ktvShopController;
