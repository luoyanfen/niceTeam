<template>
    <div>
        <div class="title">猜你喜欢</div>
        <div class="box"  v-for="(item,i) in indexshop" :key="i" @click="shopcli(item.shid)">
            <img :src="item.shimg" alt="">
            <div class="right">
                <div >{{item.shname}}</div>
                <div class="pre">{{item.shlocal}}</div>
                <div class="bottom"> <span class="price">{{item.shprice}}元/人</span><span class="yishou">已售{{item.shsales}}</span></div>
            </div>
        </div>
        <div class="seeall"><span>查看所有团购信息</span><span>></span></div>
        <div class="footer">----- @2020 niceTeam-----</div>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      indexshop: []
    };
  },
  methods: {
    shopcli(shid) {
      // console.log(shid);
      this.$router.push({ name: "Shopv", params: { key: shid } });
    }
  },
  created() {
    let this_ = this;
    this.$axios
      .post("/index", {})
      .then(function(response) {
        this_.indexshop = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  }
};
</script>


<style scoped>
.title {
  font-size: 0.3rem;
  border-bottom: 1px solid #ccc;
  color: #000;
  margin: 0 0.2rem;
  padding: 0.1rem;
}
.box {
  display: flex;
  padding: 0.1rem;
  margin: 0 0.2rem;

  border-bottom: 1px solid #ccc;
}
.box img {
  width: 1.5rem;
  height: 1.5rem;
}
.right {
  font-size: 0.3rem;
  margin-left: 0.2rem;
  width: 70%;
}
.right .pre {
  font-size: 0.22rem;
  margin-top: 0.1rem;
}
.right .bottom {
  margin-top: 0.2rem;
}
.bottom {
  display: flex;
  justify-content: space-between;
}
.bottom .price {
  font-size: 0.28rem;
  color: red;
}
.bottom .yishou {
  font-size: 0.2rem;
  color: #ccc;
}
.seeall {
  font-size: 0.26rem;
  color: #ffcf00;
  display: flex;
  justify-content: space-between;
  height: 0.5rem;
  align-items: center;
  margin: 0 0.2rem 0.1rem;

  border-bottom: 1.5px solid #ccc;
}
.footer {
  font-size: 0.2rem;
  text-align: center;
  color: #ccc;
}
</style>

