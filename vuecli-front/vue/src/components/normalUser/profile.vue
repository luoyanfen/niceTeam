<!-- 个人界面 -->
<template>
  <div>
    <el-container>
        <el-header>
            <el-col :span='1'>
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
                        <el-dropdown-item @click.native='tologin'>登录</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
            </el-col>
        </el-header>
        <el-main>
            <div class='content'>
                <el-col :span='4'>
                    <el-avatar :src="circleUrl"></el-avatar>
                </el-col>
                <el-col :span='4'>{{username}}</el-col>
                <el-col :span='4' :offset="12" @click.native='toModify'>修改</el-col>
                <router-view />
            </div>
            <div class='content-item'>
                <div class='content-item-msg'>我的订单</div>
                <el-row>
                    <el-col :span='8' @click.native='toOrder'>
                        <div class='imgbox'><img src='../../../public/img/profile/待付款.png'></div>待付款
                    </el-col>
                    <el-col :span='8' @click.native='toOrder'>
                        <div class='imgbox'><img src='../../../public/img/profile/待发货.png'></div>待收货
                    </el-col>
                    <el-col :span='8' @click.native='toOrder'>
                        <div class='imgbox'><img src='../../../public/img/profile/待收货.png'></div>已完成
                    </el-col>
                </el-row>
            </div>
            <div class='content-item'>
                <div class='content-item-msg'>我是商家</div>
                <el-row>
                    <el-col :span='8' @click.native='toShop'>
                        <div class='imgbox'><img src='../../../public/img/profile/待付款.png'></div>我要卖货
                    </el-col>
                    <el-col :span='8' @click.native='toShop'>
                        <div class='imgbox'><img src='../../../public/img/profile/待付款.png'></div>商品管理
                    </el-col>
                    <el-col :span='8' @click.native='toShop'>
                        <div class='imgbox'><img src='../../../public/img/profile/待付款.png'></div>卖家订单
                    </el-col>
                </el-row>
            </div>
        </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  data () {
    return {
      username:'',
      avatar:'',
      circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },

  components: {},

  computed: {},

  created(){
    this.getDateil();
  },

  methods: {
    toModify(){
      let user=this.$route.query.userInfo;
      this.$router.push({path:'/modify',query:{userInfo:user}})
    },

    getDateil(){
      if(this.$route.query.userInfo.uname==undefined){
        this.username=this.$store.getters.username;
      }else{
        this.username=this.$route.query.userInfo.uname;
      }
    },

    toOrder(){
      let user=this.$route.query.userInfo;
      this.$router.push({path:'/order',query:{userInfo:user}})
    },

    toShop(){
      let user=this.$route.query.userInfo;
      this.$router.push({path:'/shop',query:{userInfo:user}})
    },

    tologin(){
      this.$router.push('/login');
    }
  }
}

</script>
<style scoped>
*{
  font-size:16px
}

.el-main{

}

.content{
  height: 100px;
}

.content-item{
  height: 110px;
  margin-bottom: 20px;

}

.content-item-msg{
  height: 50px;
  line-height: 50px;
}

.el-col{
  height:60px;
  text-align:center;
  line-height: 50px;
  font-size: 14px;
}

.el-col .imgbox{
  height: 20px;
  text-align:center;
}

.imgbox img{
  width:20px;
}

</style>