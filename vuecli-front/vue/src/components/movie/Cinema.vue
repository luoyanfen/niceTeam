<template>
    <div>
        <div class="top">影院</div>
        <el-input v-model="keyword" placeholder="搜影院" prefix-icon="el-icon-search" @keyup.enter.native="serach">
        </el-input>
        <div class="cinema" v-for="(item,i) in cinemaArr" :key="i" >
             <div class="name">{{item.cinemaname}}</div>
             <div class="address"><span>{{item.cinemaaddress}}</span><span class="distance">{{item.distance}}</span></div>
             <div class="label" > <span class="tui">退</span> <span class="gaiqian">改签</span> <span class="youhui">折扣卡</span></div>
             <div class="ka"> <span class="x">卡</span> <span>开卡特惠，首单2张最高立减6元</span></div>
        </div>
        <tabar></tabar>
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
  components: {
    tabar: () => import("./Tabar.vue")
  },
  data() {
    return {
      keyword: "",
      cinemaArr: []
    };
  },
  methods: {
    serach() {
      this.$axios
        .get("/getCinema", {
          params: {
            keyword: this.keyword
          }
        })
        .then(res => {
          this.cinemaArr = res.data;
        });
    }
  },
  created() {
    this.$axios.get("/getCinema").then(res => {
      this.cinemaArr = res.data;
    });

 
  }
};
</script>

<style scoped>
.top {
  background-color: red;
  font-size: 0.3rem;
  height: 0.8rem;
  line-height: 0.8rem;
  text-align: center;
}
.el-input {
  display: block;
}
.cinema {
  font-size: 0.28rem;
  margin-left: 0.2rem;
  border-bottom: 1px solid #ccc;
  margin-right: 0.5rem;
  padding-bottom: 0.1rem;
}
.cinema .name {
  margin: 0.2rem 0 0.2rem 0;
}
.cinema .address {
  display: flex;
  justify-content: space-between;
}
.cinema .address {
  font-size: 0.24rem;
}
.label {
  margin: 0.1rem 0;
}

.label .gaiqian,
.tui {
  font-size: 0.2rem;
  border: 1px solid green;
  color: green;
}
.label .youhui {
  font-size: 0.2rem;
  border: 1px solid #faaf00;
  color: #faaf00;
}
.ka {
  font-size: 0.2rem;
  color: #ccc;
}
.ka .x {
  background-color: skyblue;
  color: white;
  margin-right: 0.1rem;
}
</style>
