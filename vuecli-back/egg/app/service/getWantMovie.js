'use strict';

const Service = require('egg').Service;

class GetWantMovieService extends Service {
      async query() {
        const { app } = this;
        let sql=`select * from wantmovie `;
        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetWantMovieService;