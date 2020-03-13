'use strict';

const Service = require('egg').Service;

class GetCommentService extends Service {
      async query( keyword) {
        const { app } = this;
        let sql=`select * from movie_comment `;
        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetCommentService;