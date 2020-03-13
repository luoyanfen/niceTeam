<!-- 订单 -->
<template>
  <div>
  <el-container>
        <el-header>
            <el-col :span='1'  @click.native='toprofile'>
                <i class='el-icon-arrow-left'></i>
            </el-col>
            <el-col :span='6' :offset='8'>
                个人中心
            </el-col>
            <el-col :span='1' :offset='8'>
                <el-dropdown trigger="click">
                    <span class="el-dropdown-link">
                        <i class='el-icon-more'></i>
                    </span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item>首页</el-dropdown-item>
                        <el-dropdown-item>分类</el-dropdown-item>
                        <el-dropdown-item>购物车</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </el-col>
        </el-header>
        <el-main>
    <el-tabs v-model="activeName" @tab-click="handleClick">
    <el-tab-pane label="我是商家" name="first">我是商家</el-tab-pane>
    <el-tab-pane label="我要卖货" name="second">我要卖货</el-tab-pane>
    <el-tab-pane label="商品管理" name="third">商品管理</el-tab-pane>
    <el-tab-pane label="卖家订单" name="fourth">卖家订单</el-tab-pane>    
  </el-tabs>
  </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  data () {
    return {
        activeName: 'second'
    };
  },

  components: {},

  computed: {},

  methods: {
      handleClick(tab, event) {
        // console.log(tab, event);
      },

      toprofile(){
        let user=this.$route.query.userInfo;
        this.$router.push({path:'/profile',query:{userInfo:user}})
      }
  }
}

</script>
<style scoped>
.el-header{
    line-height: 50px;
    font-size: 14px;
}

.el-col{
  height:60px;
  text-align:center;
  line-height: 50px;
  font-size: 14px;
}
</style>