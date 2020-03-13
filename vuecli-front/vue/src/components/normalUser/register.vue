<!-- 普通用户注册 -->
<template>
  <div>
   <el-container>
    <el-main>
        <el-form ref='form' :model='form' status-icon :rules='rules' >
                <el-upload class="avatar-uploader" action="http://127.0.0.1:8081/register" :show-file-list="false"
                    :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
                    <img v-if="imageUrl" :src="imageUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>

                <el-form-item label="用户名" prop="name">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item  label="账号" prop="account">
                    <el-input v-model="form.account"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" v-model="form.password" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="确认密码" prop="checkpassword">
                    <el-input type="password" v-model="form.checkpassword" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input v-model="form.email"></el-input>
                </el-form-item>

            </el-form-item>
        </el-form>
        <el-row>
            <el-button plain @click='toRegister'>注册</el-button>
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

    var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.form.checkpassword !== '') {
            this.$refs.form.validateField('checkpassword');
          }
          callback();
        }
      };

    var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.form.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };

    return {
        form:{
            name:'',
            account:'',
            password:'',
            checkpassword:'',
            email:'',
        },
        imageUrl:'',
        rules:{    
          name:[
            { min: 2, max: 8, message: '用户名在 2 到 8 个字符', trigger: 'blur' }
          ],
          account:[
            { min: 11, max: 11,message: '账号长度为11位', trigger: 'blur'}
          ],
          password:[
            {validator: validatePass, trigger: 'blur'},
            { min: 6, message: '密码至少为6位', trigger: 'blur'}
          ],
          checkpassword:[
            {validator: validatePass2, trigger: 'blur'},
            { min: 6, message: '密码至少为6位', trigger: 'blur'}
          ],
          email:[
            {  type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
          ]
        },
    };
  },

  components: {},

  computed: {},

  methods: {
        toRegister(){
        
            this.$axios.post('/register', {
                uname: this.form.name,
                uaccount: this.form.account,
                upassword: this.form.password,
                uemail: this.form.email,
            })
                .then((res) => {
                    if (res.data.code == 1) {
                        alert(res.data.msg);
                        this.$router.push('/login');
                    } else if (res.data.code == -1) {
                        alert(res.data.msg);
                    }
                })
                .catch((error) => {
                    alert(error);
                })
        

    },

    handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
        console.log(this.imageUrl)
    },
    beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/png' || 'image/jpg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
            this.$message.error('上传头像图片只能是 JPG或PNG 格式!');
        }
        if (!isLt2M) {
            this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
    },

    resetForm(value) {
        this.$refs[value].resetFields();
    }
  }
}

</script>
<style scoped>


    .el-form{
      margin-top: 20px;
    }

    .el-form-item{
      margin-top:20px;
    }

.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 48px;
    height: 48px;
    line-height: 48px;
    text-align: center;
  }
  .avatar {
    width: 48px;
    height: 48px;
    display: block;
    border-radius:50%;
  }
</style>
