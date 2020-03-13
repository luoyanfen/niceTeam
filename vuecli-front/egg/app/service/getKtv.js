'use strict';

const Controller = require('egg').Controller;

class GetKtvController extends Controller {
      async query( keyword,deptid ) {
        const { app } = this;
        let sql=`select * from e where 1 `;
        if(keyword){
            sql+=`and name like '%${keyword}%' `
        }
        if(deptid){
            sql+=`and deptid=${deptid}`
        }
       
        const result = await app.mysql.query(sql);
        return result;
    }
}

module.exports = GetKtvController;
