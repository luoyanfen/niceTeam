<template>
  <div class="sortv">
    <div class="searchbar">
      <div class="floataaa float-l" @click="back">
        <img src="../../image/back.png" alt />
      </div>
      <div class="floataaa float-search">{{shoptype.shtname}}</div>
      <div class="floataaa float-r">
        <img src="../../image/home.png" alt />
      </div>
    </div>

    <img :src="shoptype.shtimg" class="sortImg" alt />
    <div class="recommend">
      <el-dropdown class="dropdown">
        <span class="el-dropdown-link">
          全部类目
          <i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>火锅</el-dropdown-item>
          <el-dropdown-item>甜点饮品</el-dropdown-item>
          <el-dropdown-item>小吃快餐</el-dropdown-item>
          <el-dropdown-item>西餐</el-dropdown-item>
          <el-dropdown-item>烧烤烤肉</el-dropdown-item>
          <el-dropdown-item>香锅烤鱼</el-dropdown-item>
          <el-dropdown-item>海鲜</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-dropdown class="dropdown">
        <span class="el-dropdown-link">
          按价格排列
          <i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>升序</el-dropdown-item>
          <el-dropdown-item>降序</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-dropdown class="dropdown">
        <span class="el-dropdown-link">
          按销量排列
          <i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>升序</el-dropdown-item>
          <el-dropdown-item>降序</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-dropdown class="dropdown">
        <span class="el-dropdown-link">
          筛选
          <i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>。。。</el-dropdown-item>
          <el-dropdown-item>。。。</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <hr />
    <div id="list">
      <li
        class="list-for"
        v-for="(item,index) in typeshoparr"
        :key="index"
        @click="goshop(item.shid)"
      >
        <div class="cent">
          <div class="list-for-left">
            <img class="list-for-left-co" :src="item.shimg" />
          </div>
          <div class="list-for-right">
            <div>
              <li class="tt titl">{{item.shname}}</li>
              <li class="tt">销量：{{item.shsales}}</li>
              <li class="tt">{{item.shprice}}元/人</li>
              <li class="tt">{{item.shspecial}}</li>
            </div>
          </div>
          <span class="loc">{{item.shlocal}}</span>
        </div>
        <hr />
      </li>
    </div>
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      typeshoparr: [],
      shoptype: [],
      shtid: ""
    };
  },
  created() {
    // console.log(this.$router.app._route.params.key);
    let shtid = this.$router.app._route.params.key + 1;
    this.shtid = shtid;
    let this_ = this;
    console.log(shtid);
    if (!shtid) {
      shtid = localStorage.shtoid;
    }
    console.log(shtid);
    this_.typeshoparr = [];
    this_.shoptype = [];

    this.$axios
      .post("/Tshop", {
        id: shtid
      })
      .then(function(response) {
        console.log(response.data);
        this_.typeshoparr = response.data;
        // console.log(this_.shoparr);
      })
      .catch(function(error) {
        console.log(error);
      });
   this.$axios
      .post("/gettypeimg", {
        typeid: shtid
      })
      .then(function(response) {
        console.log(response.data);
        this_.shoptype = response.data[0];
        // console.log(this_.shoparr);
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {
    goshop(shid) {
      localStorage.shtoid = this.shtid;
      this.$router.push({ name: "Shopv", params: { key: shid } });
    },
    back() {
      this.$router.go(-1);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
* {
  margin: 0;
  padding: 0;
  font-size: 0.16rem;
}
.sortv .searchbar .floataaa img {
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
.floataaa {
  display: inline-block;
}
.float-search {
  font-size: 0.38rem;
}
.floataaa {
  display: inline-block;
}
.sortImg {
  width: 100%;
  height: 3rem;
}
.recommend {
  margin-top: 0;
}
.titl {
  font-size: 0.28rem;
}
.loc {
  display: inline-block;
  height: 1.7rem;
  line-height: 1.7rem;
  width: 1.7rem;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  text-align: center;
}
.cent {
  display: flex;
  justify-content: space-between;
  height: 1.7rem;
  line-height: 0.4rem;
  padding-top: 0.1rem;
}
.list-for {
  list-style: none;
  background-color: #fff;
}
.list-for-left {
  display: inline-block;
  width: 1.9rem;
  height: 1.7rem;
}
.list-for-left-co {
  display: inline-block;
  width: 1.4rem;
  height: 1.4rem;
  object-fit: cover;
  margin-top: 0.1rem;
  margin-left: 0.2rem;
}
.list-for-right {
  display: inline-block;
  height: 1.7rem;
  width: 3rem;
}
</style>
