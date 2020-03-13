'use strict';
const Service = require('egg').Service;

class DelWantService extends Service {
      async query( formData) {
        const { app } = this;
        const result = await this.app.mysql.delete('wantmovie', {
            wantid: formData.id
          });
          console.log(result)
    }
}

module.exports = DelWantService;