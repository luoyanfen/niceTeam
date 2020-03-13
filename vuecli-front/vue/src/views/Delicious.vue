<template>
  <div class="Delicious">
    <div class="topbar">
      <div class="topbar-l"><img src="../image/home.png" alt=""></div>
      <div class="topbar-c" @click="gosearch"><div class="input">输入商家名、品名或商圈</div>
      </div>
      <div class="topbar-l"> <img src="../image/man.png" alt=""></div>
      <div class="clean"></div>
    </div>
    <div class="block">
      <el-carousel :interval="4000" type="card" height="2.1rem">
        <el-carousel-item v-for="(item,index) in indeximg" :key="index">
          <img :src="item.src" alt class="indeximg" />
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="content">
      <div class="type">
        <li class="xh-type" v-for="(type,index) in typearr" :key="index">
          <div class="type-item" @click="typecli(index)">
            <img :src="type.src" alt class="typeImg" />
            <span id="item">{{type.title}}</span>
          </div>
        </li>
      </div>
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
            <el-dropdown-item>待开发</el-dropdown-item>
            <el-dropdown-item>待开发</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <hr />
      <div id="list">
        <li
          class="list-for"
          v-for="(item,index) in shoparr"
          :key="index"
          @click="shopcli(item.shid)"
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
  </div>
</template>

<script>

export default {
  data: function() {
    return {
      indeximg: [
        {
          src:
            "http://p1.meituan.net/mogu/0002957556bc793c94ee2f298c0c9f1a129290.jpg@1500w_640h_1e_1c"
        },
        {
          src:
            "https://img.meituan.net/msmerchant/ee5e50c6fd4f623905b76a0018954c7c156595.jpg@600w_500h_1e_1c"
        },
        {
          src:
            "https://img.meituan.net/msmerchant/3285c519861c737c3dd0b1e043016d49172196.jpg@1500w_640h_1e_1c"
        },
        {
          src:
            "https://img.meituan.net/msmerchant/b931f1ae129630e9e30dd5dad67429292046534.jpg@600w_500h_1e_1c"
        }
      ],
      typearr: [
        {
          src:
            "http://p0.meituan.net/codeman/050ce6754d32482c75273e292407f2b312356.png",
          title: "火锅"
        },
        {
          src:
            "http://p0.meituan.net/codeman/e5277d18a450c1fe51c6cda9cff6a9e016621.png",
          title: "甜点饮品"
        },
        {
          src:
            "http://p1.meituan.net/codeman/962b082a549e88f2939dbee2ac3d235613019.png",
          title: "自助餐"
        },
        {
          src:
            "http://p0.meituan.net/codeman/12ff749bd7fdf473abd59e2651a9ee1913684.png",
          title: "小吃快餐"
        },
        {
          src:
            "http://p0.meituan.net/codeman/0fe84029cc6cf6ccf12838ce6546734a16488.png",
          title: "西餐"
        },
        {
          src:
            "http://p0.meituan.net/codeman/2ae734d26259e6138ea61f2dcdac8fa115018.png",
          title: "烧烤烤肉"
        },
        {
          src:
            "http://p1.meituan.net/codeman/a7c360a9aeca1f972a1819465154c6b414043.png",
          title: "香锅烤鱼"
        },
        {
          src:
            "http://p1.meituan.net/codeman/13a0d1537d45b237a07b665eb5a7845e17141.png",
          title: "海鲜"
        }
      ],
      shoparr: []
    };
  },
  created() {
    let this_ = this;
    this.$axios
      .post("/index", {})
      .then(function(response) {
        // console.log(response.data);
        this_.shoparr = response.data;
        // console.log(this_.shoparr);
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {
    typecli(index) {
      // console.log(index);
      this.$router.push({ name: "Sortv", params: { key: index } });
    },
    shopcli(shid) {
      // console.log(shid);
      this.$router.push({ name: "Shopv", params: { key: shid } });
    },
    gosearch() {
      this.$router.push({ name: "Search", params: { key: true } });
    }
  },
 
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  font-size: 0.16rem;
}
.topbar-l {
  float: left;
}
.topbar-c {
  float: left;
}
.Delicious .topbar .topbar-c .input {
  display: inline-block;
  background-color: #fff;
  width: 4rem;
  height: 0.5rem;
  margin: 0.16rem 0.35rem;
  text-align: center;
  line-height: 0.5rem;
  color: #999;
  border-radius: 0.1rem;
}
.Delicious .topbar .topbar-l img {
  width: 0.6rem;
  height: 0.6rem;
  margin-top: 0.1rem;
  margin-left: 0.1rem;
}
.topbar {
  line-height: 0.8rem;
  background-color: #0df;
  border-bottom: 0.01rem solid #ccc;
  height: 0.8rem;
}
.indeximg {
  object-fit: cover;
  width: 100%;
  height: 2.1rem;
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
  /* background-image: url("http://p1.meituan.net/mogu/4ab2665eab5820a1c945b8c4d98887c3700220.jpg@1500w_640h_1e_1c"); */
  width: 1.4rem;
  height: 1.4rem;
  object-fit: cover;
  /* background-size: 3.5rem; */
  /* background-position-x: -1.3rem; */
  /* background-position-y: -0.2rem; */
  /* background-repeat: no-repeat; */
  margin-top: 0.1rem;
  margin-left: 0.2rem;
}
.list-for-right {
  display: inline-block;
  height: 1.7rem;
  width: 3rem;
}
.dropdown {
  margin: 0.1rem 0.2rem;
}
.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.dropdown .el-dropdown-link {
  color: #000;
}
.el-icon-arrow-down {
  font-size: 12px;
}
.block {
  position: absolute;
  top: 0.8rem;
  left: 0;
  right: 0;
}
.el-carousel__item h3 {
  color: #475669;
  font-size: 0.14rem;
  opacity: 0.75;
  line-height: 0.4rem;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.content {
  background-color: #ccc;
}
.type {
  background-color: #fff;
  border-top: 2px solid #ccc;
  height: 3.3rem;
  margin-top: 2.1rem;
  position: relative;
}
.xh-type {
  list-style: none;
  display: inline-block;
}
.typeImg {
  width: 0.9rem;
  height: 0.9rem;
  display: inline-block;
  margin-top: 0.3rem;
}
.type-item {
  display: inline-block;
  width: 1.575rem;
  height: 1.45rem;
  text-align: center;
}
#item {
  display: inline-block;
  display: flex;
  justify-content: center;
}
.recommend {
  background-color: #fff;
  margin-top: 0.19rem;
}
</style>