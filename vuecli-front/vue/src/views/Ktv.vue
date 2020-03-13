<template>
  <div>
    <!-- KTV首页顶部！ -->
    <div class="KTV-top">
      <div class="top">
        <div>
          <a href="/" class="el-icon-arrow-left"></a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        <span>分类</span>
        <div>
          <a href="/" class="el-icon-user" style="color: black;"></a>&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="/" class="el-icon-search" style="color: black;"></a>
        </div>
      </div>
      <div class="bottom">
        <div v-for="(item,index) in topArr" :key="index" class="bottom-item">
          <span>{{item}}</span>
          <i class="el-icon-caret-bottom"></i>
        </div>
      </div>
    </div>
    <!-- KTV首页店铺信息，需从数据库获取店铺信息，进行页面渲染 -->
    <div class="KTV-shop">
      <KTV-shop v-for="(item,i) in shopArr" :key="i" ref="shop"></KTV-shop>
    </div>
  </div>
</template>

<script>
import Shop from "../components/KTV/shop.vue";
export default {
  components: {
    "KTV-shop": Shop
  },
  data() {
    return {
      topArr: ["KTV", "全城", "默认排序", "筛选"],
      shopArr: null,
    };
  },
  methods: {

  },
  mounted() {
    this.$axios
      .get("/KTVshop")
      .then(res=>(this.shopArr = res.data))
      .catch(function(error) {
        console.log(error);
      });
  }
};
</script>

<style>
*{
  text-decoration: none
}
.KTV-top {
  width: 100%;
}
.KTV-top .top {
  height: 3.01rem;
  background-image: linear-gradient(135deg, #ffd000 0%, #ffbd00 100%);
  display: flex;
  justify-content: space-between;
  line-height: 3.01rem;
  font-size: 1.2rem;
  padding: 0 3%;
  color: black;
}
.KTV-top .top a {
  font-size: 1.4rem;
  font-weight: 900;
}

.KTV-top .bottom {
  display: flex;
  width: 100%;
  background-color: #fff;
  color: #6f6f6f;
}
.KTV-top .bottom-item {
  height: 2.3rem;
  width: 25%;
  line-height: 2.01rem;
  text-align: center;
  border: 0.05rem solid rgba(241, 241, 241, 0.5);
}
</style>