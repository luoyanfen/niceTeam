<!-- 管理员登录 -->
<template>
  <div>
    <el-container>
        <el-header>管理员登录</el-header>
        <el-main>
            <div class='form-content'>
                <el-form ref='form' :model='form' status-icon :rules='rules'>
          <el-form-item prop='account'>
            <el-input  v-model='form.account'  placeholder="请输入账号"></el-input>
          </el-form-item>   

          <el-form-item prop='password'>
            <el-input type='password' v-model='form.password'  placeholder="请输入密码"></el-input>
          </el-form-item>  
          </el-form>

          <el-row>
            <el-button plain @click='toLogin'>登录</el-button>
            <el-button plain @click="resetForm('form')">重置</el-button>
          </el-row>    
            </div>
        </el-main>
    </el-container>
  </div>
</template>

<script>

import axios from 'axios';

export default {
  data () {
    return {
        form:{
            account:'',
            password:''
        },

        rules:{    
          account:[
            // { min: 11, max: 11,message: '账号长度为11位', trigger: 'blur'}
          ],
          password:[
            // { min: 6, message: '密码至少为6位', trigger: 'blur'}
          ]
        },
    };
  },

  components: {},

  computed: {},

  

  methods: {
      toLogin(){
         axios.get('http://localhost:8080/adminLogin',
         {
            params:{
                account:this.form.account,
                password:this.form.password
            }       
          })
          .then((res)=>{
            console.log(res.data)
            this.$store.commit('user',res.data.demoUser);
            this.$router.push({path:'/adminHome',query:{userInfo:JSON.stringify(res.data.demoUser),
              cinemaInfo:JSON.stringify(res.data.demoCinema),
              movieInfo:JSON.stringify(res.data.demoMovie),
              commentInfo:JSON.stringify(res.data.demoComment)}});
            })
          .catch((error)=>{
            alert(error);
          })
      }

  }
}

</script>
<style  scoped>
.el-header{
    text-align:center;
    line-height: 100px;
}

.el-main{
    text-align:center;
}

.el-input{
    width: 300px;
}

.form-content{
    width: 20%;
    height: 300px;
    display: flex;
    margin-left:40%;
    margin-top: 2%;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

</style>