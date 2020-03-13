'use strict';

const Service = require('egg').Service;

class GetCinemaService extends Service  {
      async query( keyword) {
        const { app } = this;
        let sql=`select * from cinema where 1 `;
        if(keyword){
            sql+=`and cinemaname like '%${keyword}%' `
        }

        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetCinemaService;
