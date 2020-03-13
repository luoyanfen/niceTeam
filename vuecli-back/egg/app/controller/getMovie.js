'use strict';

const Controller = require('egg').Controller;

class GetMovieController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getMovie.query();
        ctx.body=result;

    }
}

module.exports = GetMovieController;
