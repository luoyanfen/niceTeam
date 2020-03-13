'use strict';

const Controller = require('egg').Controller;

class GetKtvController extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getKtv.query(formData.keyword,formData.deptid);
        ctx.body=result;

    }
}

module.exports = GetKtvController;
