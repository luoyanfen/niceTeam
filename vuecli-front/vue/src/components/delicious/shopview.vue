<template>
  <div class="shop-bigbox">
    <div class="searchbar">
      <div class="floataaa float-l" @click="back">
        <img src="../../image/back.png" alt />
      </div>
      <div class="floataaa float-search">店铺信息</div>
      <div class="floataaa float-r">
        <img src="../../image/home.png" alt />
      </div>
    </div>

    <img :src="shop.shimg" class="shopindeximg" alt />
    <div class="card-A">
      <div class="shoptitle">
        <span class="shoptitle-mz">{{shop.shname}}</span>
        <span class="shoptitle-xl">销量：{{shop.shsales}}</span>
        <span class="shoptitle-jg">人均：{{shop.shprice}}</span>
      </div>
      <hr />
      <div class="shoptitle-local">
        <div class="imgbox">
          <img src="../../image/local.png" class="localImg" alt />
        </div>
        <div class="shoptitle-wz">{{shop.shlocal}}</div>
        <div class="imgbox">
          <img src="../../image/phone.png" class="localImg" alt />
        </div>
        <div class="clean"></div>
      </div>
    </div>
    <div class="group-type">
      <div class="group-type-A">
        <div class="type-A-left">
          <img src="../../image/group.png" class="group-img" alt />
        </div>
        <div class="type-A-right">团购（{{groupnum}}）</div>
        <div class="clean"></div>
      </div>
      <li class="group-item" v-for="(item,index) in group" :key="index" @click="groupinfo(item.gid)">
        <div class="group-item-left">
          <img :src="item.gimg" class="group-item-img" alt />
        </div>
        <div class="group-item-right">
          <span>{{item.gname}}</span>
          <div class="group-item-right-A">
            <span class="item-right-price">{{item.gprice}}元</span>
            <span class="item-right-sale">已售:{{item.gsold}}</span>
          </div>
        </div>
        <div class="clean"></div>
      </li>
    </div>
  </div>
</template>

<script>


(function(doc, win) {
  var docEl = doc.documentElement,
    resizeEvt = "orientationchange" in window ? "orientationchange" : "resize",
    recalc = function() {
      var clientWidth = docEl.clientWidth;
      if (!clientWidth) return;
      if (clientWidth >= 640) {
        docEl.style.fontSize = "100px";
      } else {
        docEl.style.fontSize = 100 * (clientWidth / 640) + "px";
      }
    };

  if (!doc.addEventListener) return;
  win.addEventListener(resizeEvt, recalc, false);
  doc.addEventListener("DOMContentLoaded", recalc, false);
})(document, window);
export default {
  data: function() {
    return {
      group: [],
      groupnum: "",
      shop: []
    };
  },
  created() {
    let shopid = this.$router.app._route.params.key;
    let this_ = this;
     if (!shopid) {
      shopid = localStorage.shopid;
    }
    this_.group = [];
    this_.shop = [];
    //获取团购信息
   this.$axios
      .post("/getgroup", {
        id: shopid
      })
      .then(function(response) {
        this_.group = response.data;
        this_.groupnum = this_.group.length;
      })
      .catch(function(error) {
        console.log(error);
      });
    //获取店铺标题图片等
   this.$axios
      .post("/typeshop", {
        id: shopid
      })
      .then(function(response) {
        this_.shop = response.data[0];
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods:{
    groupinfo(gid){
      localStorage.shopvid = this.shopid;
      this.$router.push({ name: "Groupinfo", params: { key: gid } });
    },
    back(){
      this.$router.go(-1);
    }
  }
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  font-size: 0.16rem;
}
.shop-bigbox .searchbar img {
  width: 0.5rem;
  height: 0.5rem;
}
.float-l {
  position: absolute;
  left: 0.1rem;
  margin-top: 0.15rem;
}
.float-r {
  position: absolute;
  right: 0.1rem;
  margin-top: 0.15rem;
}
.searchbar {
  background-color: #0df;
  height: 0.8rem;
  line-height: 0.8rem;
  text-align: center;
}
.float-search {
  font-size: 0.38rem;
}
.floataaa{
  display: inline-block;
}
.item-right-price {
  font-size: 0.28rem;
  color: rgb(2, 120, 255);
  font-weight: 800;
}
.item-right-sale {
  margin-left: 2.8rem;
}
.group-item {
  list-style: none;
  margin-left: 0.2rem;
  border-bottom: 0.02rem solid #999;
}
.group-item-img {
  width: 1.4rem;
  height: 1.4rem;
}
.group-item-left {
  margin-top: 0.1rem;
  float: left;
}
.group-item-right {
  margin-top: 0.1rem;
  margin-left: 0.2rem;
  float: left;
}
.group-item-right-A {
  margin-top: 0.7rem;
}
.group-type-A {
  margin-left: 0.2rem;
  border-bottom: 0.02rem solid #999;
  height: 0.7rem;
  line-height: 0.7rem;
}
.type-A-left {
  float: left;
  height: 0.7rem;
  line-height: 1rem;
}
.type-A-right {
  float: left;
  margin-left: 0.2rem;
  font-size: 0.28rem;
}
.group-type {
  background-color: #fff;
  margin-top: 0.2rem;
}
.group-img {
  width: 0.5rem;
  height: 0.5rem;
}
.shop-bigbox {
  background-color: #ccc;
}
.card-A {
  background-color: #fff;
}
.clean {
  clear: both;
}
.imgbox {
  float: left;
  width: 0.6rem;
  height: 0.8rem;
  line-height: 01rem;
}
.localImg {
  width: 0.4rem;
  height: 0.4rem;
  margin-right: 0.2rem;
}
.shopindeximg {
  width: 100%;
  height: 3rem;
}
.shoptitle {
  height: 1.2rem;
  /* background-color: #fff; */
  margin-left: 0.2rem;
  line-height: 0.6rem;
}
.shoptitle-mz {
  display: block;
  font-size: 0.4rem;
  font-weight: 800;
}
.shoptitle-xl {
  display: inline-block;
}
.shoptitle-jg {
  display: inline-block;
  margin-left: 2rem;
}
.shoptitle-local {
  height: 0.8rem;
  margin-left: 0.2rem;
  line-height: 0.6rem;
  /* background-color: #fff; */
}
.shoptitle-wz {
  float: left;
  height: 0.8rem;
  font-size: 0.24rem;
  width: 4.8rem;
  line-height: 0.8rem;
  margin-top: 0;
}
</style>