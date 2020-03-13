<template>
    <!-- KTV预定模块 -->
  <div class="reserve">
      <div class="res-top">
          <span>订</span>&nbsp;
          <i>预订</i>
      </div>
      <div class="line"></div>
      <div class="res-bottom">
          <img :src="Img" alt="">
          <div class="bottom-right">
              <div>一键预定，K歌特快通道</div>
              <i class="el-icon-arrow-right"></i><br><br>
              <span>101</span>起
          </div>
      </div>
  </div>
</template>

<script>
import resImg from '@/assets/reserve.png';
export default {
    data(){
        return {
            Img:resImg
        }
    }
}
</script>

<style scoped>
.reserve{
    background-color: #fff;
    padding: 3%;
}
.res-top{
    padding-bottom: 1.3%;
}
.res-top span{
    display: inline-block;
    width: 1rem;
    height: 1rem;
    border-radius: 2px;
    text-align: center;
    background-color:  #f5716e;
    color: #fff;
    font-size: 13px;
    vertical-align: middle;
}
.res-top i{
    font-size: 1.2rem;
    vertical-align: middle;
}
.line{
    border-top: 1px solid #ccc;
}
.res-bottom{
    display: flex;
    margin-top: 3%;
    width: 100%;
}
.res-bottom>img{
    width: 25%;
    margin-right: 3%;
}
.res-bottom .bottom-right{
    width: 73%;
    position: relative;
}
.res-bottom .bottom-right>div{
    font-size: 0.7rem;
    color: #666;
}
.res-bottom .bottom-right>i{
    font-size: 1.1rem;
    font-weight: bold;
    margin: 0.8rem 0;
    position: absolute;
    right: 0px;
}
.res-bottom .bottom-right>span{
    color: #FF6D0B;
}
</style>