'use strict';

const Controller = require('egg').Controller;

class GetCinemaController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getCinema.query(formData.keyword);
        ctx.body=result;

    }
}

module.exports = GetCinemaController;
