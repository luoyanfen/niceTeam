'use strict';

const Service = require('egg').Service;

class AddShopService extends Service {
    async index(data) {
        const { app } = this;
        const fordata = JSON.parse(data);
        console.log(fordata)
        let result = await app.mysql.insert('shop',fordata);
        return result;
    }
}
module.exports = AddShopService;