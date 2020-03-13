<template>
    <div>
       <div class="top">猫眼电影</div>
      <scroll></scroll>
    </div>
</template>

<script>
export default {
   components: {
    scroll: () => import("./scroll.vue")
   
  },
  data() {
    return {
      activeIndex: "1"
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      // console.log(key, keyPath);
    }
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
.btn{
    height: 0.8rem;
}

</style>
