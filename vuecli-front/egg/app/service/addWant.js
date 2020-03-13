'use strict';

const Service = require('egg').Service;

class AddWantService extends Service {
      async query( formData) {
        const { app } = this;
        let sql =`SELECT * FROM wantmovie where moviename="${formData.moviename}" `
        let results = await app.mysql.query(sql);
        if (results.length > 0) {
          return { code: -1, msg: '账号已存在' }
        }
        const result = await this.app.mysql.insert('wantmovie', { moviename:formData.moviename }); 
        return {code:1,msg:"插入成功"};
    }
}

module.exports = AddWantService;