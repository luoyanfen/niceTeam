'use strict';
const Service = require('egg').Service;

class AddNumService extends Service {
      async query( formData) {
        const { app } = this;
        const movieId = formData.movieid;
        const results = await this.app.mysql.query('update movie set wantnum = (wantnum + ?) where movieid = ?', [1, movieId]);
    }
}

module.exports = AddNumService;