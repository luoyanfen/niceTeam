
<template>
  <div >  
       <top></top>
       <hotmovies></hotmovies> 
       <tabar></tabar>  
 </div>
</template>

<script>
 
export default {
  components: {
    tabar: () => import("../components/movie/Tabar.vue"),
    top: () => import("../components/movie/Top.vue"),
    hotmovies: () => import("../components/movie/HotMovies.vue")
  },

  created() {
  
  }
};
</script>

<style scoped>
</style>

