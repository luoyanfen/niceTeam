<template>
  <div class="buyingbox">
    <div class="searchbar">
      <div class="floataaa float-l" @click="back">
        <img src="../../image/back.png" alt />
      </div>
      <div class="floataaa float-search">下单</div>
      <div class="floataaa float-r">
        <img src="../../image/home.png" alt />
      </div>
    </div>

    <span class="buying-title">牢房老舍重庆火锅</span>
    <div class="buying-content">
      <li>
        单价：
        <span class="pri">{{gprice}}元</span>
      </li>
      <li>
        数量：
        <span class="pric">
          <div class="float add" @click="ajj">-</div>
          <div class="floato">
            <input type="number" class="int" v-model="buynum" />
          </div>
          <div class="float ajj" @click="add">+</div>
          <div class="clean"></div>
        </span>
      </li>
      <li>
        总价：
        <span class="pr">{{totalp}}元</span>
      </li>
      <li>
        还需支付：
        <span class="pr">{{totalp}}元</span>
      </li>
    </div>
    <div class="buying-tj" @click="enterbuy">立即付款</div>
    <div class="buying-gwc" @click="addcar">加入购物车</div>
    <div :class="{msg:start ,dis:disp}">{{msg}}</div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      buynum: 1,
      start: true,
      disp: true,
      gprice: "",
      totalp: "",
      gid: "",
      shid: "",
      msg: ""
    };
  },
  watch: {
    buynum() {
      //   console.log(222);
      this.totalp = this.buynum * this.gprice;
    }
  },
  created() {
    let gid = this.$router.app._route.params.key;
    this.gid = gid;
    let shid = this.$router.app._route.params.key1;
    this.shid = shid;
    let gprice = this.$router.app._route.params.key2;
    this.gprice = gprice;
    this.totalp = this.buynum * this.gprice;
    let this_ = this;
    if (!gid) {
      this.gid = localStorage.buygid;
    }
    if (!shid) {
      this.shid = localStorage.buyshid;
    }
    if (!gprice) {
      this.gprice = localStorage.buypri;
      this.totalp = this.buynum * this.gprice;
    }
  },
  methods: {
    add() {
      this.buynum++;
    },
    ajj() {
      if (this.buynum == 1) {
        return;
      } else {
        this.buynum--;
      }
    },
    addcar() {
      let uname = this.$root.$store.getters.username;
      // console.log(this.$root.$store.getters.username)
      if (!uname) {
        alert("请登录");
        this.$router.push({ name: "Login" });
        localStorage.buygid = this.gid;
        localStorage.buyshid = this.shid;
        localStorage.buypri = this.gprice;
        return;
      }
      this.disp = false;
      let this_ = this;
      setTimeout(() => {
        this.disp = true;
        this.msg = "";
      }, 2000);
      this.$axios
        .post("/addcar", {
          gid: this.gid,
          shid: this.shid,
          uname: uname,
          buynum: this.buynum
        })
        .then(function(response) {
          console.log(response.data);
          this_.msg = response.data.msg;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    enterbuy() {
      this.msg = "付款成功（功能待开发）";
      this.disp = false;
      setTimeout(() => {
        this.disp = true;
        this.msg = "";
      }, 2000);
    },
    back() {
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
.buyingbox .searchbar img {
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
.floataaa {
  display: inline-block;
}
.dis {
  display: none;
}
.msg {
  position: fixed;
  top: 9rem;
  width: 5rem;
  text-align: center;
  font-size: 0.28rem;
  color: rgb(71, 71, 71);
  left: 0.8rem;
}
.add,
.ajj {
  height: 0.5rem;
  width: 0.5rem;
  font-size: 0.36rem;
  border-radius: 0.1rem;
  text-align: center;
  line-height: 0.5rem;
  margin-top: 0.1rem;
  border: 0.02rem solid #ccc;
}
.floato {
  float: left;
}
.int {
  width: 0.8rem;
  height: 0.4rem;
  margin: 0 0.1rem;
  border-radius: 0.06rem;
}
.clean {
  clear: both;
}
.float {
  float: left;
}
.pric {
  position: absolute;
  right: 0.2rem;
  height: 0.8rem;
  line-height: 0.8rem;
}
.pri {
  position: absolute;
  right: 0.2rem;
}
.pr {
  color: rgb(255, 123, 0);
  font-weight: 900;
  position: absolute;
  right: 0.2rem;
}
.buying-tj,
.buying-gwc {
  height: 0.7rem;
  border-radius: 0.1rem;
  margin: 0.3rem 0.2rem 0 0.2rem;
  font-size: 0.3rem;
  color: #fff;
  line-height: 0.7rem;
  text-align: center;
  background-color: rgb(255, 124, 1);
}
.buyingbox {
  background-color: #ddd;
}
.buyingbox .buying-content li {
  list-style: none;
  height: 0.8rem;
  line-height: 0.8rem;
  font-size: 0.26rem;
  margin-left: 0.2rem;
  border-bottom: 0.01rem solid #ccc;
}
.buying-content {
  margin-top: 0.2rem;
  background-color: #fff;
}
.buying-title {
  margin-left: 0.2rem;
  margin-top: 0.2rem;
  display: inline-block;
  font-size: 0.4rem;
}
</style>