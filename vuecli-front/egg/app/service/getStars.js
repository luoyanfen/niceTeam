'use strict';

const Service = require('egg').Service;

class GetStarsService extends Service {
      async query() {
        const { app } = this;
        let sql=`select * from star`;
        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetStarsService;