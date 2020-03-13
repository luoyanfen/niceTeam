<template>
  <div class="groupinfobox">
    <div class="searchbar">
      <div class="floataaa float-l" @click="back">
        <img src="../../image/back.png" alt />
      </div>
      <div class="floataaa float-search">团购信息</div>
      <div class="floataaa float-r">
        <img src="../../image/home.png" alt />
      </div>
    </div>

    <img
      src="http://p0.meituan.net/deal/f2deb8bb9feb62341baa44a000f66e96110476.jpg"
      class="groupimg"
      alt
    />
    <div class="group-title">
      <div class="T">
        <li class="TT">{{group.gname}}</li>
      </div>
      <div class="float">
        <span class="group-price">{{group.gprice}}元</span>
        <span>已售：{{group.gsold}}</span>
      </div>
      <div class="group-Btn" @click="buying">立即抢购</div>
      <div class="clean"></div>
        <hr>
      <div class="group-title-zhu">
        <li>支持随时退款</li>
        <li>支持过期自动退款</li>
        <li>支持打包带走</li>
      </div>
    </div>
    <div class="group-taocan">
      <li class="group-taocan-a">备注</li>
      <li>{{group.gremarks}}</li>
    </div>
    <div class="group-gmxz">
      <li class="group-gmxz-a">购买须知</li>
      <li class="gmxz-a">有效期</li>
      <li>2019.8.4 至 2020.7.3 23:59（周末、法定节假日通用）</li>
      <li class="gmxz-a">使用规则</li>
      <li>{{group.grule}}</li>
    </div>
  </div>
</template>

<script>
import axios from "axios";

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
      group: []
    };
  },
  created() {
    let gid = this.$router.app._route.params.key;
    let this_ = this;
    if (!gid) {
      gid = localStorage.groupgid;
    }
    // console.log(gid);
    //获取团购表信息
    this.$axios
      .post("/getgroupbyid", {
        id: gid
      })
      .then(function(response) {
        this_.group = response.data[0];
        // console.log(response.data);
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {
    buying() {
      // console.log(this.group.gid);
      let gid = this.group.gid;
      let shid = this.group.shid;
      let gprice = this.group.gprice;
      localStorage.groupgid = gid;
      localStorage.groupgprice = gprice;
      this.$router.push({
        name: "Buying",
        params: { key: gid, key1: shid, key2: gprice }
      });
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
.groupinfobox .searchbar img {
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
.T {
  margin-left: 0.2rem;
}
.TT {
  font-size: 0.46rem;
}
.gmxz-a {
  font-size: 0.26rem;
  color: rgb(255, 166, 0);
}
.group-taocan,
.group-gmxz {
  background-color: #fff;
  margin-top: 0.2rem;
  padding-left: 0.2rem;
}
.group-taocan-a,
.group-gmxz-a {
  border-bottom: 0.01rem solid #999;
  font-size: 0.32rem;
  height: 0.6rem;
  line-height: 0.6rem;
  margin-bottom: 0.1rem;
}
.groupinfobox {
  background-color: #ddd;
}

.clean{
  clear: both;
}
.group-title-zhu li {
  font-size: 0.24rem;
  color: rgb(0, 214, 0);
  margin-top: 0.1rem;
  margin-left: 0.2rem;
}
li {
  list-style: none;
}
.group-title {
  padding-top: 0.2rem;
  background-color: #fff;
}
.float {
  float: left;
  margin-top: 0.2rem;
}
.group-Btn {
  border-radius: 0.06rem;
  background-color: rgb(255, 153, 0);
  color: #fff;
  float: left;
  width: 2rem;
  height: 0.7rem;
  margin-top: 0.2rem;
  margin-bottom: 0.1rem;

  line-height: 0.7rem;
  text-align: center;
  font-size: 0.3rem;
  margin-left: 1.6rem;
}
.group-price {
  display: inline-block;
  font-size: 0.4rem;
  margin-left: 0.2rem;
  margin-right: 0.1rem;
  color: rgb(3, 207, 221);
}
.groupimg {
  width: 100%;
  height: 3rem;
  object-fit: cover;
}
</style>