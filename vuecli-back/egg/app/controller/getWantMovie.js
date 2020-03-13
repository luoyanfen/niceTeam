'use strict';

const Controller = require('egg').Controller;

class GetWantMovieController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getWantMovie.query();
        ctx.body=result;

    }
}

module.exports = GetWantMovieController;