'use strict';

const Service = require('egg').Service;

class AddCommmentService extends Service {
      async query( formData) {
        const { app } = this;
        const result = await this.app.mysql.insert('movie_comment', { commenttext: formData.text,uid:formData.id,movieid:formData.movieid }); 
        return {code:1,msg:"插入成功"};
    }
}

module.exports = AddCommmentService;