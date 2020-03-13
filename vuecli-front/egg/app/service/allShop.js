'use strict';

const Controller = require('egg').Controller;

class AllShopController extends Controller {
    async index() {
        // console.log(index);
        const { app } = this;
        let result = await app.mysql.select('shop');
       return result;
    }
}

module.exports = AllShopController;