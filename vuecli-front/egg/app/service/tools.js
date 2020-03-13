const Service = require('egg').Service;
const svgCaptcha = require('svg-captcha');

class ToolsService extends Service {
  // 产生验证码
  async captcha(value) {
    const captcha = svgCaptcha.create({
      size: 4,
      fontSize: 50,
      width: 100,
      height: 40,
      bacground: '#cc9966'
    });
    this.ctx.session.code = captcha.text;
    console.log(this.config.arr)
    this.config.arr.push(captcha.text);
    if(value==this.config.arr[this.config.arr.length-2]){
        return {
            coding:'1',
            msg:'验证码正确',
            svg:captcha
        }
    }else{
        return {
            coding:'-1',
            msg:'验证码错误',
            svg:captcha
        }
    }
  }
}

module.exports = ToolsService;