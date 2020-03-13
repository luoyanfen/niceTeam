'use strict';

const Controller = require('egg').Controller;

class RegisterController extends Controller {
    async create(value,index) {
        // console.log(index);
        const { app } = this;
        let result = await app.mysql.select('nuser');
        let flag = result.some(
            item => item.uaccount == value.uaccount
        )
        if(flag){
            return {
                code: -1,
                msg:'用户名已存在,请重新输入'
            }
        }else{
            await app.mysql.insert('nuser', value);
            // await app.mysql.insert('nuser', {uavatar:index.data});
            return {
                code: 1,
                msg:'注册成功,请登录'
            }
        }
    }
}

module.exports = RegisterController;