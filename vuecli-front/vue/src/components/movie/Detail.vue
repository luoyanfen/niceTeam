<template>
    <div class="bg"> 
      <div class="box">
         <el-breadcrumb separator-class="el-icon-arrow-right" class="brand">
            <el-breadcrumb-item :to="{ path: '/movie' }">电影</el-breadcrumb-item>
            <el-breadcrumb-item>调酒师</el-breadcrumb-item>
          </el-breadcrumb>
          <div class="moviebox" >
            <img src="https://p1.meituan.net/128.180/moviemachine/6664cd8c31f1254bc52793a158dc53ff8811971.jpg" alt="">
            <div class="content">
                  <div class="left" >
                      <div class="name">调酒师</div>
                      <div class="want"><span class="wantnum">456</span> 人想看</div>
                      <div class="star">主演：刘婷</div>
                      <div class="date">2012-02-20上映</div>
                  </div>
            </div>
          </div>
          <div class="jianjie">
              <el-collapse v-model="activeName" accordion>
                <el-collapse-item title="简介" name="1">
                  <p>江上儿时经历大难，与唯一的亲人姐姐失散后被酒吧老板辛子收留。
                      由于姐姐是调酒师，所以江上非常有调酒天赋，但唯独无法调出姐姐最喜欢的“玉玲珑”酒。
                      江上一边做调酒师一边探寻姐姐的下落，终于在一次酒吧行业调酒师的“切磋”中见到了姐姐，姐弟二人相认并联手赢得了比赛，
                      保住了辛子的酒吧。
                  </p>
                </el-collapse-item>
             </el-collapse>
          </div>
          <comment></comment>
      </div>
    </div>
</template>
<script>
  export default {
      components: {
    comment: () => import("./Comment.vue"),
   
  },
    data() {
      return {
        activeName: '1'
      };
    }
  }
</script>
<style scoped>

.box .brand{
    padding-top: .2rem;
    font-size: 0.28rem;
    color: white
}
.moviebox {
  display: flex;
  font-size: 0.26rem;
  color: #fff;
  margin: 0.3rem 0 0.1rem 0rem;
   background-color: #221B40;
}
.moviebox img {
  width: 2rem;
  height: 3rem;
}
.content {
  width: 70%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-left: 0.2rem;
  border-bottom: 1px solid #ccc;
}
.content .name {
  font-size: 0.4rem;
  margin-bottom: 0.5rem;
}
.want {
  margin-bottom: 0.1rem;
}
.wantnum {
  color: #faaf00;
  font-size: 0.28rem;
  font-weight: 600;
}
.box .jianjie{
    background-color: #221B40;
}
</style>

