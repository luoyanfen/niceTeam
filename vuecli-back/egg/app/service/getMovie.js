'use strict';
const Service = require('egg').Service;

class GetMovieService extends Service {
      async query() {
        const { app } = this;
        let sql=`select * from movie `;
        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetMovieService;