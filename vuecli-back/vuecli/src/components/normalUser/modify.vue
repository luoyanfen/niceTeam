<!-- 修改信息 -->
<template>
<div>
    <el-container>
        <el-header>
            <el-col :span='1' @click.native='toProfile'>
                <i class='el-icon-arrow-left'></i>
            </el-col>
            <el-col :span='6' :offset='8'>
                个人资料
            </el-col>
            <el-col :span='1' :offset='8'>
                <i class='el-icon-more'></i>
            </el-col>
        </el-header>
        <el-main>
            <el-row>
                <el-col :span="4">头像<div class="grid-content bg-purple-dark"></div>
                </el-col>
                <el-col :span="4" :offset="16">
                    <el-avatar :src="circleUrl"></el-avatar>
                    <div class="grid-content bg-purple-dark"></div>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="4">昵称<div class="grid-content bg-purple-dark"></div>
                </el-col>
                <el-col :span="4" :offset="16" ref='name' @click.native='changeName'>{{userInfo.username}}<div
                        class="grid-content bg-purple-dark"></div>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="4">密码<div class="grid-content bg-purple-dark"></div>
                </el-col>
                <el-col :span="4" :offset="16">{{userInfo.password}}<div class="grid-content bg-purple-dark"></div>
                </el-col>
            </el-row>
            <el-row>
                <el-col :span="4">邮箱<div class="grid-content bg-purple-dark"></div>
                </el-col>
                <el-col :span="4" :offset="12">{{userInfo.email}}<div class="grid-content bg-purple-dark"></div>
                </el-col>
            </el-row>
            </el-form>
        </el-main>
    </el-container>
</div>
</template>

<script>
export default {
  data () {
    return {
       userInfo:{
         username:'',
         account:'',
         password:'',
         email:'',
       },
       circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },

  components: {},

  computed: {},

  created(){
    this.getDateil();
  },

  methods: {
    changeName(){
      return this.$refs.name.tag='textarea'
    },

    toChange(){
      console.log(this.$refs.name.value);
    },

     getDateil(){
       if(this.$route.query.userInfo.uname==undefined){
        this.userInfo.username=this.$store.getters.username;
        this.userInfo.password=this.$store.getters.userpassword;
        this.userInfo.email=this.$store.getters.useremail;
      }else{
        this.userInfo.username=this.$route.query.userInfo.uname;
        this.userInfo.password=this.$route.query.userInfo.upassword;
        this.userInfo.email=this.$route.query.userInfo.uemail;
      }   
    },

    toProfile(){
      let user=this.$route.query.userInfo;
      this.$router.push({path:'/profile',query:{userInfo:user}})
    }
  }
}

</script>
<style scoped>
.el-input{
  width: 50px;
  height: 10px;
}

.el-col{
  text-align: center;
  margin-bottom: 30px;
  height: 50px;
  line-height: 50px;
  font-size: 14px;
}

textarea{
  border: 0px;
  resize: none;
}

textarea:hover{
  border: 0px;
}


</style>