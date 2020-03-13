<template>
    <div class="box">
        <div class="title">热门影人</div>
    <!-- 注意需要给 el-scrollbar 设置高度，判断是否滚动是看它的height判断的 -->
        <el-scrollbar class="scroll" > <!-- 滚动条 -->
          <div class="a" v-for="(item,i) in starArr" :key="i">
             <img :src="item.starimg" alt="">
             <div class="name">{{item.starname}}</div>
          </div>
        </el-scrollbar><!-- /滚动条 -->
    </div>
</template>
<script>
export default {
  data:function(){
    return{
      starArr:[]
    }
  },
  created(){
       this.$axios.get("/getStars")
        .then(res => {
          this.starArr = res.data;
        });
  }
};
</script>
<style scoped>
.box {
  height: 2.6rem;
  white-space: nowrap;
  font-size: 0.26rem;
}
.box .title {
  font-size: 0.3rem;
  margin: 0.2rem
}
.box .el-scrollbar__view .a {
  display: inline-block;
  width: 2rem;
  height: 2rem;
  font-size: 0.28rem;
  text-align: center;
  margin:0 -0.1rem
}
.box .el-scrollbar__wrap {
  overflow-x: hidden;
}

.a img {
  width: 1.5rem;
  height: 2rem;
}
</style>
