'use strict';

const Controller = require('egg').Controller;

class AddCommentController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.body;
        console.log(formData);
        let result =await service.addComment.query(formData);

        ctx.body=result;

    }
}

module.exports = AddCommentController;
