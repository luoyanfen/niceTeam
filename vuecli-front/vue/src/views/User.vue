<!-- 普通用户 -->
<template>
  <div>
    <el-tabs @tab-click='handleClick'>
        <el-tab-pane label="登录" name="first" ></el-tab-pane>
        <el-tab-pane label="注册" name="second" ></el-tab-pane>
        <router-view/>
    </el-tabs>  
  </div>
</template>

<script>
export default {
  data () {
    return {

    };
  },

  components: {},

  computed: {},

  methods: {
      handleClick(tab){
          if(tab.name=='first'){
              this.$router.push('/login');
          }else{
              this.$router.push('/register');
          }
      }
  }
}

</script>
<style scoped>

.el-tabs{
    text-align:center;
}

</style>