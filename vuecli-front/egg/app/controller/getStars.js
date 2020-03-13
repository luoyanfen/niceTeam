'use strict';

const Controller = require('egg').Controller;

class GetStarsController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getStars.query();
        ctx.body=result;

    }
}

module.exports = GetStarsController;
