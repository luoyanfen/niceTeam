'use strict';

const Controller = require('egg').Controller;

class GetShtypeController extends Controller {
    async index() {
        // console.log(index);
        const { app } = this;
        let result = await app.mysql.select('shtype');
       return result;
    }
}

module.exports = GetShtypeController;