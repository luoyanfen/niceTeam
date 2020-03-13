'use strict';

const Service = require('egg').Service;

class KTVshopService extends Service {
  async index() {
    const { app } = this;
    let sql=`select * from ktv_shop`;
    let result=await app.mysql.query(sql)
    return result;
  }

}

module.exports = KTVshopService;