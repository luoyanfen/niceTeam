<template>
  <div>

    <top></top>
    <root></root>
    <recommend>  </recommend>
  </div>
</template>

 
<script>
export default {
  components: {
    top: () => import("../components/home/Top.vue"),
    root: () => import("../components/home/Root.vue"),
    recommend: () => import("../components/home/Recommend.vue")
  },
 
  
};
</script>

