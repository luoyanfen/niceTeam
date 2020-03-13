<!-- 管理员首页 -->
<template>
  <div>
    <el-container style="height: 910px; border: 1px solid #eee" >
  <el-aside width="200px" style="background-color: white">
    <el-menu :default-openeds="['1', '3']">
      <el-submenu index="1">
        <template slot="title"><i class="el-icon-message"></i>用户信息</template>
        
        </el-submenu>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i>店铺信息</template>
        <el-menu-item-group>
            <el-submenu index="2-2">
          <template slot="title">电影</template>
          <el-menu-item index="2-2-1">猫眼电影</el-menu-item>
          </el-submenu>
        </el-menu-item-group>
        
        <el-submenu index="2-3">
          <template slot="title">娱乐</template>
          <el-menu-item index="2-3-1">KTV</el-menu-item>
          <el-menu-item index="2-3-1">丽人</el-menu-item>
        </el-submenu>

        <el-submenu index="2-5">
          <template slot="title">美食</template>
        </el-submenu>
      </el-submenu>
      
    </el-menu>
  </el-aside>
  
  <el-container >
    <el-header style="text-align: right; font-size: 12px">
      <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>查看</el-dropdown-item>
          <el-dropdown-item>新增</el-dropdown-item>
          <el-dropdown-item>删除</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <span>用户名</span>
    </el-header>
    
    <el-main>
      <el-table :data="tableData">
      <el-table-column prop="uid" label="Id" ref='Id'>
        </el-table-column>
        <el-table-column prop="uaccount" label="账号">
        </el-table-column>
        <el-table-column prop="uname" label="用户名">
        </el-table-column>
        <el-table-column prop="upassword" label="密码">
        </el-table-column>
        <el-table-column prop="uemail" label="邮箱">
        </el-table-column>
        <el-table-column label="操作">
      <template slot-scope="scope">
          <el-button
          size="mini"
          @click="handleEdit(scope.$index, scope.row)">编辑</el-button>

<el-dialog title="编辑个人信息" :visible.sync="dialogFormVisible" width='400px'>
  <el-form :model="form">
    <el-form-item label="用户" prop="name">
                    <el-input v-model="form.uname"></el-input>
                </el-form-item>
                <el-form-item  label="账号" prop="account">
                    <el-input v-model="form.uaccount"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" v-model="form.upassword" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input v-model="form.uemail"></el-input>
                </el-form-item>
  </el-form>
  <div slot="footer" class="dialog-footer">
    <el-button @click="toReturn">取 消</el-button>
    <el-button type="primary" @click="tomodify(scope.$index, scope.row)">确 定</el-button>
  </div>
</el-dialog>


        <el-button
          size="mini"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
      </el-table>
    </el-main>
  </el-container>
</el-container>
  </div>
</template>

<script>

import axios from 'axios';

export default {
   data() { 
      return {
        user:this.$store.getters.user,
        tableData:[],
        dialogFormVisible: false,
         form:{
            uid:'',
            uname:'',
            uaccount:'',
            upassword:'',
            uemail:'',
        },
        formLabelWidth: '120px',
        arr:this.$store.getters.user
      }
    },

  components: {},

  computed: {},

  mounted(){
      let list=JSON.parse(this.$route.query.userInfo);
      for(let i=0;i<list.length;i++){
         this.tableData.push(list[i])
      }
  },

  methods: {
      handleEdit(index, row) {
        this.dialogFormVisible = true
        this.form=row;
      },
      handleDelete(index, row) {
        console.log(row.uid)
         this.$axios.get('/adminDelete',
         {
            params:{
              uid:row.uid,
            }       
          })
          .then((res)=>{
              alert(res.data.msg)
            })
          .catch((error)=>{
            alert(error);
          })
      },
      
      tomodify(){
        this.dialogFormVisible = false;
         this.$axios.get('/adminHome',
         {
            params:{
              uid:this.form.uid,
              uname:this.form.uname,
              uaccount:this.form.uaccount,
              upassword:this.form.upassword,
              uemail:this.form.uemail
            }       
          })
          .then((res)=>{
              alert(res.data.msg)
            })
          .catch((error)=>{
            alert(error);
          })
      },

      toReturn(){
        this.dialogFormVisible = false;

      }
  }
}

</script>
<style scoped>
    .el-header {
    background-color: white;
    color: #333;
    line-height: 60px;
    text-align:right;
  }
  
  .el-aside {
    color: #333;
    background-color:white;
  }

  .el-table-column{
    text-align:center;
  }

  .el-container{
      height:500px;
  }

  .el-input{
    width: 300px;
  }

  .el-dialog{
    width: 400px;
  }
</style>