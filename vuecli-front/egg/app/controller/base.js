const Controller = require('egg').Controller;
class BaseController extends Controller {
async verify() {
    const { ctx } = this;
    let formData = ctx.request.query;
    let captcha = await this.service.tools.captcha(formData.imgData); // 服务里面的方法
    ctx.response.type = 'image/svg+xml';  // 知道你个返回的类型
    ctx.body = captcha; // 返回一张图片  
  }
}

module.exports = BaseController;
