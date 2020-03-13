'use strict';

const Controller = require('egg').Controller;

class AddWantController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.body;
        console.log(formData);
        let result =await service.addWant.query(formData);

        ctx.body=result;

    }
}

module.exports = AddWantController;