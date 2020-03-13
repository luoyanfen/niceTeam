<!-- 普通用户登录界面 -->
<template>
  <div>
    <el-container>
        <el-main>
          <el-form ref='form' :model='form' status-icon :rules='rules'>
          <el-form-item prop='account'>
            <el-input type='number' v-model='form.account'  placeholder="请输入账号"></el-input>
          </el-form-item>   

          <el-form-item prop='password'>
            <el-input type='password' v-model='form.password'  placeholder="请输入密码"></el-input>
          </el-form-item>  
          </el-form>

          <div class='img-content'>
          <el-input class='imgData' v-model='imgData'></el-input>  
            <div v-html='img'>
            </div> 
           </div> 
          <el-row>
            <el-button plain @click='toLogin'>登录</el-button>
            <el-button plain @click="resetForm('form')">重置</el-button>
          </el-row>    
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
            password:'',      
        },
        img:'',
        imgData:'',

        rules:{    
          account:[
            { min: 11, max: 11,message: '账号长度为11位', trigger: 'blur'}
          ],
          password:[
            { min: 6, message: '密码至少为6位', trigger: 'blur'}
          ]
        },
    };
  },

  components: {},

  computed: {},

   created(){
    this.getDateil();
  },

  methods: {
      getDateil(){
      axios.get('http://127.0.0.1:8081/login',
         {})
          .then((res)=>{
            this.img=res.data.svg.data;
            })
          .catch((error)=>{
            alert(error);
          }) 
      },



      toLogin(){   

         axios.get('http://127.0.0.1:8081/login',
         {
           params:{
             imgData:this.imgData
           }
         })
          .then((res)=>{
            this.img=res.data.svg.data;
            if(res.data.coding==1){
              this.$store.state.boolean=true;
            }else{
              this.$store.state.boolean=false;
              alert(res.data.msg)
            }
            })
          .catch((error)=>{
            alert(error);
          }) 


          axios.post('http://127.0.0.1:8081/login',
         {
            account:this.form.account,
            password:this.form.password
          })
          .then((res)=>{
            if(res.data.code==1&&this.$store.state.boolean==true){
              this.$store.state.boolean=true;
              localStorage.setItem('token',res.data.token)
              this.$store.commit('UserName',res.data.userInfo.uname);
              this.$store.commit('UserPassword',res.data.userInfo.upassword);
              this.$store.commit('UserEmail',res.data.userInfo.uemail);
              // localStorage.setItem('username',res.data.userInfo.uname);
              this.$router.push({path:'/profile',query:{userInfo:res.data.userInfo}});
            }else if(res.data.code==-1){
              alert(res.data.mesg);
              console.log(res.data.code)
            }else if(res.data.code==1&&this.$store.state.boolean==false){
            }else{
              alert(res.data.mesg);
              console.log(res.data.code)
            }
            })
          .catch((error)=>{
            alert(error);
          })

         
                   
      },

       resetForm(value) {
        this.$refs[value].resetFields();
      },

     
  }     
    
}

</script>
<style scoped>

    .el-header{
       
    }

    .el-form-item{
      margin-top:20px;
    }

    .imgData{
      width: 100px;
    }

    .img-content{
      width: 70%;
      margin-left:15%;
      display:flex;
      justify-content:space-around;
      margin-bottom: 20px;
    }
    
</style>