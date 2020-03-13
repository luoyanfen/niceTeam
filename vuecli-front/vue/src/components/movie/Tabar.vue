<template>
    <div class="btn">
       <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
            <el-menu-item index="1"><a href="/movie">电影</a></el-menu-item>
            <el-menu-item index="2"><a href="/cinema">影院</a></el-menu-item>
            <el-menu-item index="3"><a href="/my">我的</a></el-menu-item>
            
        </el-menu>
         
    </div>
</template>
<script>
export default {
  data() {
    return {
      activeIndex: "1"
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      // console.log(key, keyPath);
    },
    toCinema() {
      this.$router.push({ path: "/movie/cinema" });
    }
  },
  created() {
    if (this.$route.path == "/movie") {
      this.activeIndex = "1";
    }
    if (this.$route.path == "/cinema") {
      this.activeIndex = "2";
    }
    if (this.$route.path == "/my") {
      this.activeIndex = "3";
    }
  }
};
</script>

<style scoped>
.btn .el-menu-demo {
  width: 100vw;
  display: flex;
  justify-content: space-around;
  position: fixed;
  bottom: 0;
  left: 0;
}
a {
  text-decoration: none;
  color: #ccc;
}
</style>
