'use strict';

const Controller = require('egg').Controller;

class GetDataService extends Controller {
    async index() {
        const { ctx,service } = this;
        let formData = ctx.request.query;
        let result =await service.getData.query(formData.keyword,formData.deptid);
        ctx.body=result;
    }
}

module.exports = GetDataService;
