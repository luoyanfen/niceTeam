'use strict';

const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path');

class UploadController extends Controller {
   //上传头像
  async index(){
    //接受客户端传递过来的图片
    const {ctx} = this;
    const dest = '/public/img'
    const file = ctx.request.files[0];
    console.log(file);
    let to = path.dirname(__dirname) + dest + path.basename(file.filepath);
    fs.copyFileSync(file.filepath, to);
    //删除临时文件
    fs.unlinkSync(file.filepath);
    //返回图片的访问路径
    let cluster = this.app.config.cluster.listen;
    //客户端要求是是json格式的数据
    ctx.body = {
        code : 1,
        src : `http://${cluster.hostname}:${cluster.port}${dest}${path.basename(file.filepath)}`
    }
  }
}


module.exports = UploadController;