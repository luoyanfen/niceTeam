'use strict';

const Controller = require('egg').Controller;

class GetCommentController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getComment.query();
        ctx.body=result;

    }
}

module.exports = GetCommentController;