'use strict';

const Controller = require('egg').Controller;

class DelWantController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.body;
        console.log(formData);
        let result =await service.delWant.query(formData);

        ctx.body=result;

    }
}

module.exports = DelWantController;