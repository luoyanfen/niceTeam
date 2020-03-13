'use strict';

const Service = require('egg').Service;

class adminLoginService extends Service {
  async index(value) {
    const { app } = this;
    let result = await app.mysql.select('auser');
    let demo = '';
    let demoUser=[];
    let demoCinema=[];
    let demoMovie=[];
    let demoComment=[];
    result.forEach(item => { if (item.aaccount == value.account && item.apassword==value.password) { return demo = item.a_id } }) 
    console.log("a_id为"+demo);
    let resultUser=await app.mysql.select('nuser');
    resultUser.forEach(item => { if (item.a_id == demo) { return demoUser.push(item) } })

    let resultCinema=await app.mysql.select('cinema');
    resultCinema.forEach(item => { if (item.a_id == demo) { return demoCinema.push(item) } }) 

    let resultMovie=await app.mysql.select('movie');
    resultMovie.forEach(item => { if (item.a_id == demo) { return demoMovie.push(item) } }) 

    let resultComment=await app.mysql.select('movie_comment');
    resultComment.forEach(item => { if (item.a_id == demo) { return demoComment.push(item) } }) 


    return {
      demoUser,
      demoCinema,
      demoMovie,
      demoComment,
    };
  }
}

module.exports = adminLoginService;