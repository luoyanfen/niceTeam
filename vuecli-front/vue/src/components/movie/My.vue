<template>
    <div class="bg">
       <div class="top">我的</div>
       <div class="avatar">
          <img src="https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3304134359,765230059&fm=26&gp=0.jpg" alt="">
       </div>
       <div class="wanter">
           <el-collapse  accordion>
                <el-collapse-item class="wantn" title="我的想看" name="1">
                   <div class="wantbox" v-for="(item,i) in wantArr" :key="i">
                     <span>{{i+1}}、</span><span>{{item.moviename}} </span> <button ref="del" class="del" @click="del(item.wantid)" type="button">移除</button>
                   </div>
                </el-collapse-item>
            </el-collapse>
       </div>
       <tabar></tabar>
    </div>
</template>

<script>
export default {
  components: {
    wantmovie: () => import("./HotMovies.vue"),
    tabar: () => import("./Tabar.vue")
  },
  data: function() {
    return {
      wantArr: []
    };
  },
  methods: {
    del(id) {
       this.$axios.post("/delWant",{id}).then(res => {
      this.wantArr = res.data;
    });
    }
  },
  created() {
    this.$axios.get("/getWantMovie").then(res => {
      this.wantArr = res.data;
    });
  },
  updated(){
     this.$axios.get("/getWantMovie").then(res => {
      this.wantArr = res.data;
    });
  }
};
</script>


<style scoped>
.bg {
  width: 100vw;
  height: 100vh;
  background-color: #f3f3f3;
}
.top {
  background-color: red;
  font-size: 0.4rem;
  height: 0.8rem;
  line-height: 0.8rem;
  text-align: center;
  color: white;
}
.avatar {
  height: 3rem;
  background-color: red;
  text-align: center;
  line-height: 3rem;
}
.avatar img {
  width: 1rem;
  height: 1rem;
  border-radius: 50%;
}
.wanter {
  font-size: 0.3rem;
  margin-top: 0.2rem;
  background-color: #fff;
}
.wanter .wanttitle {
  font-weight: 600;
  margin-left: 0.2rem;
}
.wanter .wantn {
  margin-left: 0.2rem;
}

.wantbox {
  font-size: 0.3rem;
}
.del {
  width: 0.8rem;
  margin-left: 2rem;
  background-color: red;
}
</style>
