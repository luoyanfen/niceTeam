'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;

  //陈锡明
  router.post('/login', controller.login.index);
  router.get('/getCinema', controller.getCinema.index);
  router.get('/getMovie', controller.getMovie.index);
  router.get('/getWantMovie', controller.getWantMovie.index);
  router.get('/getStars', controller.getStars.index);
  router.get('/getComment', controller.getComment.index);
  router.post('/addWant', controller.addWant.index);
  router.post('/addComment', controller.addComment.index);
  router.post('/addNum', controller.addNum.index);
  router.post('/delWant', controller.delWant.index);
  //徐聿成
  router.post('/login', controller.login.index);
  router.get('/getData', controller.getData.index);
  router.post('/register', controller.register.index);
  router.get('/login', controller.base.verify); 
  router.get('/adminLogin', controller.adminLogin.index);
  router.get('/adminHome', controller.adminHome.index);
  router.get('/adminDelete', controller.adminDelete.index);

  //茶世河
  router.post('/post',controller.post.index);
  router.get('/get', controller.get.index);
  //实时查询数据
  router.get('/searchtime', controller.get.searchtime);
  //首页查询所有店铺信息
  router.post('/index', controller.getinfo.index);
  //根据类型id查询店铺信息
  router.post('/Tshop', controller.getshop.byshtid);
  //根据id查询店铺信息
  router.post('/typeshop', controller.getshop.index);
  //根据店铺id查询团购信息
  router.post('/getgroup', controller.getgroup.index);
  //根据团购id查询团购信息
  router.post('/getgroupbyid', controller.getgroup.groupid);
  //获取店铺种类信息
  router.post('/gettypeimg', controller.gettype.index);
  //加入购物车信息
  router.post('/addcar', controller.addbuy.index);
  //后台管理
  router.get('/getsht', controller.getshtype.index);
  router.get('/addshop', controller.addshop.index);
  router.get('/allshop', controller.allshop.index);
  router.get('/getshopbyid', controller.getshop.byid);
  router.get('/updateshop', controller.getshop.updateshop);
  router.get('/deleteshop', controller.getshop.deleteshop);
  router.post('/uploadimg', controller.upload.index);

  //罗艳芬
  router.get('/getKtv', controller.getKtv.index);
  router.get('/KTVshop', controller.ktvShop.index);
};
