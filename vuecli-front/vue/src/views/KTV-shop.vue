<template>
  <div>
    <div class="Shop-top">
      <!-- 顶部导航条 -->
      <div class="top">
        <div>
          <a href="/ktv" class="el-icon-arrow-left"></a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        <span>商家详情</span>
        <div>
          <el-row class="block-col-2">
            <el-col :span="12">
              <el-dropdown trigger="click">
                <span class="el-dropdown-link">
                  <i class="el-icon-s-operation el-icon--right"></i>
                </span>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item icon="el-icon-s-home">首页</el-dropdown-item>
                  <el-dropdown-item icon="el-icon-user">我的</el-dropdown-item>
                  <el-dropdown-item icon="el-icon-search">搜索</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </el-col>
          </el-row>
        </div>
      </div>
      <!-- 顶部店铺信息 -->
      <div class="shop-about">
        <img :src="Avatar_url" alt />
        <div class="shop-about-bottom">
          <span>音乐宝贝ktv</span>
          <!-- 店铺评分 -->
          <el-rate
            v-model="value"
            disabled
            show-score
            text-color="#FBA54E"
            score-template="{value}"
          ></el-rate>
          <div>KTV</div>
        </div>
        <!-- 店铺相关照片展示 -->
        <div class="demo-image__preview picturs">
          <el-image
            style="width: 90px; height: 80px"
            :src="url"
            :preview-src-list="srcList"
            :fit="contain"
          ></el-image>
        </div>
      </div>
    </div>
    <!-- 店铺地址部分 -->
    <div class="Shop-addr">
      <div class="addr">
        <div>
          <i class="el-icon-location-outline"></i>
          <span>石林彝族自治县财富中心</span>
        </div>
        <i class="el-icon-phone-outline"></i>
      </div>
      <div class="line"></div>
      <div class="info-botton">
        <div class="botton botton1">
          <i class="el-icon-star-off"></i>&nbsp;收藏
        </div>
        <div class="botton">
          <i class="el-icon-share"></i>&nbsp;分享
        </div>
        <div class="botton">
          <i class="el-icon-warning-outline"></i>&nbsp;报错
        </div>
      </div>
    </div>
    <!-- 店铺商品预定 -->
    <KTV-Reserve></KTV-Reserve>
    <!-- 店铺团购商品 -->
    <div class="group">
      <div class="group-top">
        <span>团</span>&nbsp;
        <i>团购</i>
        <i class="color">&nbsp;(4)</i>
      </div>
      <div v-for="i in 4" :key="i">
        <div class="line"></div>
        <div class="group-bottom">
          <img :src="Img_group" alt />
          <div class="bottom-right">
            <div>黄金场指定酒水套餐</div>
            <br />
            <br />
            <span>99元</span>
            <div class="display">门市价：279元</div>
            <div class="display">已售79</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 店铺评价 -->
    <div class="Shop-comments">
      <div class="top">评价</div>
      <div>
        <div class="line"></div>
        <div class="comment">
          <div class="comment-top">
            <el-row class="demo-avatar demo-basic">
              <el-col :span="12">
                <div class="demo-basic--circle">
                  <div class="block">
                    <el-avatar :size="40" :src="circleUrl"></el-avatar>
                  </div>
                </div>
              </el-col>
            </el-row>
            <div class="right">
              <span>匿名用户</span>
              <el-rate
                v-model="Comment_value"
                disabled
                text-color="#ff9900"
                disabled-void-color="#ddd"
              ></el-rate>
              <span class="date">2020-01-09</span>
            </div>
          </div>
          <div>
            <span>{{comment}}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Reserve from "@/components/KTV/reserve.vue";

export default {
  components: {
    "KTV-Reserve": Reserve
  },
  data() {
    return {
      Avatar_url:
        "https://p1.meituan.net/440.0/merchantpic/ba7d7639d74437585eec56f2c5e95fa0492794.jpg",
      value: 3.0,
      url:
        "http://p1.meituan.net/440.0/poi/32a6474ecf0b2216fd918e182d5966c857344.jpg",
      srcList: [
        "https://fuss10.elemecdn.com/8/27/f01c15bb73e1ef3793e64e6b7bbccjpeg.jpeg",
        "https://fuss10.elemecdn.com/1/8e/aeffeb4de74e2fde4bd74fc7b4486jpeg.jpeg"
      ],
      Img_group:
        "http://p1.meituan.net/200.0/dpdeal/0d3e40f8551ffea91117c9c5860d86cb152528.jpg",
      circleUrl: "https://www.dpfile.com/ugc/user/anonymous.png",
      Comment_value: 1.0,
      comment:"页面上有小包中包 来了只有小包 要中包必须消费一打酒或者其他 严重欺骗消费者 服务态度还不好"
    };
  }
};
</script>

<style scoped>
.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}
.demonstration {
  display: block;
  color: #8492a6;
  font-size: 14px;
  margin-bottom: 20px;
}
.Shop-top {
  width: 100%;
}
.Shop-top .top {
  height: 3.01rem;
  background-image: linear-gradient(135deg, #ffd000 0%, #ffbd00 100%);
  display: flex;
  justify-content: space-between;
  line-height: 3.01rem;
  font-size: 1.2rem;
  padding: 0 3%;
}
.Shop-top .top i {
  font-size: 1.5rem;
  font-weight: 900;
  color: #333;
}
.Shop-top .top a {
  font-size: 1.4rem;
  font-weight: 900;
}
.shop-about {
  height: 12rem;
  position: relative;
}
.shop-about > img {
  height: 12rem;
  width: 100%;
}
.shop-about > .shop-about-bottom {
  width: 100%;
  height: 43%;
  box-sizing: border-box;
  background-color: rgba(0, 0, 0, 0.5);
  color: #eee;
  padding: 3%;
  position: absolute;
  bottom: 0;
}
.shop-about .picturs {
  position: absolute;
  right: 4%;
  bottom: -5%;
  border: 1px solid #cccccc;
  border-bottom: 0px solid #ccc;
  box-sizing: border-box;
}
.Shop-addr {
  width: 100%;
  background-color: #fff;
  margin: 0.8rem 0;
  box-sizing: border-box;
  padding: 3%;
}
.Shop-addr .addr {
  display: flex;
  padding: 3%;
  padding-top: 0;
  justify-content: space-between;
}
.Shop-addr .addr i {
  font-size: 1.3rem;
  color: #aaa;
  vertical-align: top;
  padding-right: 0.5rem;
}
.Shop-addr .addr span {
  vertical-align: top;
}
.Shop-addr .addr > i {
  color: #333;
}
.line {
  border-top: 1px solid #ccc;
}
.Shop-addr .info-botton {
  width: 100%;
  display: flex;
  justify-content: space-around;
}
.Shop-addr .info-botton .botton {
  width: 26%;
  height: 1.7rem;
  border: 0.1rem solid #ff9900;
  color: #ff9900;
  border-radius: 3px;
  text-align: center;
  line-height: 1.7rem;
  margin-top: 0.8rem;
}
.Shop-addr .info-botton .botton1 {
  width: 40%;
}

.group {
  background-color: #fff;
  padding: 3%;
  margin-top: 3%;
}
.line {
  margin: 3% 0;
}
.group-top span {
  display: inline-block;
  width: 1rem;
  height: 1rem;
  border-radius: 2px;
  text-align: center;
  background-color: #f5716e;
  color: #fff;
  font-size: 13px;
  vertical-align: middle;
}
.group-top i {
  font-size: 1.2rem;
  vertical-align: middle;
}
.group-top .color {
  color: #666;
}
.group-bottom {
  display: flex;
  width: 100%;
}
.group-bottom > img {
  width: 25%;
  margin-right: 3%;
}
.group-bottom .bottom-right {
  width: 73%;
  position: relative;
}
.group-bottom .bottom-right > div {
  font-size: 0.7rem;
  color: #666;
}
.group-bottom .bottom-right > i {
  font-size: 1.1rem;
  font-weight: bold;
  margin: 0.8rem 0;
  position: absolute;
  right: 0px;
}
.group-bottom .bottom-right > span {
  color: #ff6d0b;
}
.group-bottom .bottom-right > .display {
  display: inline-block;
  margin-left: 21%;
}
.Shop-comments {
  width: 100%;
  margin-top: 3%;
  background-color: #fff;
  box-sizing: border-box;
  padding: 3%;
}
.Shop-comments .top {
  font-size: 1.3rem;
  color: #aaa;
  padding-top: 3%;
}
.Shop-comments .comment-top {
  display: flex;
  font-size: 12px;
  margin-bottom: 3%;
}
.Shop-comments .comment-top .right{
  margin-left: 2%;
}
</style>