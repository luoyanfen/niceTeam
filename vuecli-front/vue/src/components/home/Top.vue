<template>  
   <div>
        <div class="serach">
        <div>
           <el-select v-model="value" placeholder="请选择" class="select" size="mini">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
             </el-option>
          </el-select>
        </div>
      <div class="center">请输入商品或店名</div>
      <img @click="toLogin" src="https://p0.meituan.net/travelcube/641521461179df7cfb88738dd1ea11ec1031.png" alt="" >
    </div> 

    <div class="topb">
        <img src="https://p1.meituan.net/travelcube/7264ce9c25de2e464e3acd996fe8ad362803.png"  alt="">
        <div class="toptext"><span>省钱利器&nbsp;购物超划算</span><br><span>吃喝玩乐尽在美团</span></div>
        <div class="button">去app</div>
    </div>
   </div>

</template>
<script>
export default {
  data() {
    return {
      options: [
        {
          value: "选项1",
          label: "昆明"
        }
      ],
      value: "昆明"
    };
  },
  methods:{
    toLogin(){
      this.$router.push({path:"/user"})
    }
  }
};
</script>
  

<style scoped>
.serach {
  display: flex;
  justify-content: space-around;
  align-items: center;
  background-color: #ffcf00;
  height: 0.8rem;
}
.serach img{
    width: 0.4rem;
    height: 0.4rem;
}
.el-select{
  width: 1.2rem;
 display: block;
}
.center {
  font-size: 0.24rem;
  color: #999;
  border:1px solid ;
  background-color: #FFFAE5;
  padding: 0 1rem;
  border-radius: .3rem;
  height: 0.45rem;
  line-height: 0.45rem;
  text-align: center;
  margin-left: -.2rem
}
.topb{
    font-size: 0.2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #000;
    height: 0.8rem;
    color: #fff;
    padding: 0 0.3rem
}
.topb img{
    width: 0.6rem;
    height: 0.6rem;
}
.topb .button{
  height: 0.6rem;
  width: 1rem;
  background-color: #FFCD00;
  border: 1px solid;
  border-radius: 15%;
  text-align: center;
  line-height: 0.6rem;
  font-size: 0.25rem
}
.topb .toptext{
    margin-left: -2rem
}


</style>



