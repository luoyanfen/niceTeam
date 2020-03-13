<template>
  <div class="searchbox">
    <div class="searchbar">
      <div class="float float-l" @click="back">
        <img src="../../image/back.png" alt />
      </div>
      <div class="float float-search">搜索</div>
      <div class="float float-r">
        <img src="../../image/home.png" alt />
      </div>
    </div>
    <div class="float-input">
      <div class="search-input">
        <div class="input">
          <img src="../../image/search.png" alt />
        </div>
        <input type="text" @focus="readysearch" v-model="searchdate" />
      </div>
    </div>
    <div class="search-input-right" @click="gosearch">搜索</div>
    <div class="clean"></div>
    <div class="recommend" v-if="remenss">
      <li class="recommend-for">
        <span class="recommend-item remen">热门搜索</span>
      </li>
      <li class="recommend-for" v-for="item in remen" :key="item">
        <span class="recommend-item">{{item}}</span>
      </li>
    </div>
    <div class="auxiliary" v-if="auxiliary">
      <div
        class="auxiliary-for"
        v-for="(item,index) in constantlydate"
        :key="index"
        @click="succes(item.shid)"
      >
        <li class="auxiliary-item">{{item.shname}}</li>
      </div>
    </div>
  </div>
</template>

<script>
import { log } from "util";


export default {
  data: function() {
    return {
      remen: [
        "德克士",
        "正新鸡排",
        "下一站",
        "云县鸡肉米线",
        "大理活螃蟹",
        "三只熊烘培店",
        "老仓醋米线"
      ],
      constantlydate: [],
      remenss: true,
      auxiliary: false,
      searchdate: ""
    };
  },
  watch: {
    searchdate() {
      // console.log(this.searchdate)
      let this_ = this;
   this.$axios
        .get("/searchtime", {
          params: {
            name: this.searchdate
          }
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.length == 0) {
            this_.constantlydate = [];
            this_.constantlydate.push({
              shname: "搜索:" + this_.searchdate
            });
          } else {
            this_.constantlydate = response.data;
          }
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  },
  methods: {
    succes(searchshid) {
      let this_ = this;
      this.$axios
        .post("/typeshop", {
          id: searchshid
        })
        .then(function(response) {
          console.log(response.data.length);
          if (response.data.length == 0) {
            this_.constantlydate = [];
            this_.constantlydate.push({
              shname: "暂时查询不到结构，换个关键字试试"
            });
          } else {
            this_.$router.push({ name: "Shopv", params: { key: searchshid } });
          }
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    readysearch() {
      this.remenss = false;
      this.auxiliary = true;
    },
    back() {
      this.$router.go(-1);
    },
    gosearch() {
      let this_ = this;
    this.$axios
        .get("/searchtime", {
          params: {
            name: this.searchdate
          }
        })
        .then(function(response) {
          console.log(response.data);
          if (response.data.length == 0) {
            this_.constantlydate = [];
            this_.constantlydate.push({
              shname: "暂时查询不到结构，换个关键字试试"
            });
          } else {
            this_.constantlydate = [];
            this_.constantlydate=response.data;
          }
        })
        .catch(function(error) {
          console.log(error);
        });
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
.auxiliary-for {
  background-color: #fff;
  border-bottom: 0.02rem solid #ccc;
}
.auxiliary-item {
  list-style: none;
  height: 0.5rem;
  font-size: 0.24rem;
  padding-left: 0.2rem;
  line-height: 0.5rem;
}
.remen {
  color: rgb(255, 145, 0);
}
.recommend-item {
  display: inline-block;
  height: 0.5rem;
  line-height: 0.5rem;
  margin-left: 0.3rem;
  font-size: 0.24rem;
  margin-top: 0.3rem;
  padding-right: 0.2rem;
  border-right: 0.02rem solid #ccc;
}
.recommend-for {
  display: inline-block;
  list-style: none;
}
.recommend {
  margin-top: 0.1rem;
  background-color: #fff;
}
.search-input-right {
  width: 1rem;
  margin: 0.1rem 0 0 0.24rem;
  float: left;
  height: 0.7rem;
  border-radius: 0.1rem;
  text-align: center;
  font-size: 0.28rem;
  color: #333;
  line-height: 0.7rem;
  background-color: #eee;
}
.float-input {
  float: left;
  margin-bottom: 0.1rem;
}
.clean {
  clear: both;
}
.searchbox {
  background-color: #ccc;
}
.search-input {
  background-color: #fff;
  width: 4.5rem;
  display: inline-block;
  height: 0.7rem;
  line-height: 0.2rem;
  border: 0.02rem solid #999;
  border-radius: 0.1rem;
  margin-left: 0.28rem;
  margin-top: 0.1rem;
}
.searchbox .search-input .input {
  float: left;
}
.searchbox .search-input input {
  height: 0.5rem;
  margin-top: 0.08rem;
  margin-left: 0.2rem;
  width: 3.5rem;
  font-size: 0.3rem;
  outline: none;
  border: none;
  /* border: 0.01rem solid #fff; */
}
.searchbox .search-input img {
  width: 0.5rem;
  height: 0.5rem;
  margin-top: 0.1rem;
  margin-left: 0.1rem;
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
.float {
  /* float: left; */
  display: inline-block;
}
.searchbox .searchbar img {
  width: 0.5rem;
  height: 0.5rem;
}
</style>