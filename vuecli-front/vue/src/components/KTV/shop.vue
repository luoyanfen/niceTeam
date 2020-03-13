<template>
  <a href="/ktv-shop">
    <div class="shop">
      <div class="top">
        <!-- 店铺头像 -->
        <div class="avatar">
          <img :src="Avatar_url" alt />
        </div>
        <!-- 店铺信息 -->
        <div class="top-right">
          <span>KTV</span>
          <!-- 店铺评分 -->
          <el-rate
            v-model="value"
            disabled
            show-score
            text-color="#FBA54E"
            score-template="{value}分"
          ></el-rate>
          <!-- 店铺信息 -->
          <div class="top-right-bottom">
            <i>99元起</i>
            <div>hahahhaha</div>
            <span>148.12km</span>
          </div>
        </div>
      </div>
      <div class="line"></div>
      <!-- 团购优惠说明 -->
      <div class="bottom">
        <div>
          <img :src="tg_img" alt />
          <span>离开收费价格还算凉快</span>
        </div>
      </div>
    </div>
  </a>
</template>

<script>
import tuangou from "@/assets/tuangou.png";
export default {
  data() {
    return {
      Avatar_url:
        "https://p1.meituan.net/440.0/merchantpic/ba7d7639d74437585eec56f2c5e95fa0492794.jpg",
      value: 3.0,
      tg_img: tuangou,
      item: null
    };
  }

};
</script>

<style>
.shop {
  margin-top: 0.5rem;
  width: 100%;
  background-color: #fff;
  padding: 3%;
  font-size: 0.9rem;
  box-sizing: border-box;
  color: #6f6f6f;
  padding-bottom: 0;
}
.shop .top {
  display: flex;
  margin-bottom: 0.5rem;
}
.shop .top .avatar {
  width: 19%;
  margin-right: 3%;
}
.shop .top .avatar img {
  width: 100%;
}
.top-right {
  width: 80%;
}
.top-right > span {
  font-size: 1rem;
  color: #333333;
}
.top-right-bottom {
  width: 100%;
  display: flex;
  justify-content: space-between;
}
.top-right-bottom > i {
  color: #ff4d0f;
}
.top-right-bottom > div {
  max-width: 40%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.line {
  border-top: 1px solid #ccc;
}
.shop .bottom {
  font-size: 0.8rem;
  position: relative;
  left: 22%;
}
.shop .bottom > div {
  padding: 3% 0;
}
.shop .bottom img {
  width: 5%;
  vertical-align: middle;
  margin-right: 5px;
}
.shop .bottom span {
  vertical-align: middle;
}
</style>