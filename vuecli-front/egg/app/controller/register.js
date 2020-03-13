'use strict';

const Controller = require('egg').Controller;

class RegisterController extends Controller {
    async index() {
        const { ctx, service } = this;
        //接收客户端提交上来的数据
        let formData = ctx.request.body;
        let fileData = ctx.request.files;
        let result = await service.register.create(formData);
        ctx.body = result;
    }
}

module.exports = RegisterController;
