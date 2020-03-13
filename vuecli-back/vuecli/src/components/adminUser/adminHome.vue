<!-- 管理员首页 -->
<template>
  <div>
    <el-container style="height: 910px; border: 1px solid #eee" >
  <el-aside width="200px" style="background-color: white">
    <el-menu :default-openeds="['1', '2']">
      <el-submenu index="1" @click.native='touser'>
        <template slot="title"><i class="el-icon-message"></i>用户信息</template>
        
        </el-submenu>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i>店铺信息</template>
        <el-menu-item-group>
            <el-submenu index="2-2">
          <template slot="title">电影</template>
          <el-menu-item index="2-2-1" @click='movie'>猫眼电影</el-menu-item>
          <el-menu-item index="2-2-2" @click='cinema'>电影院</el-menu-item>
          <el-menu-item index="2-2-3" @click='comment'>电影评论</el-menu-item>
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
      
      <el-table :data="tableData" ref='new' v-if='isuser'>
      <el-table-column prop="uid" label="Id" >
        </el-table-column>
        <el-table-column prop="uaccount" label="账号" >
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


      <el-table :data="cinemaData" ref='new' v-show='iscinema'>
      <el-table-column prop="cinemaid" label="Id" >
        </el-table-column>
        <el-table-column prop="cinemaname" label="影院" >
        </el-table-column>
        <el-table-column prop="cinemaaddress" label="地址">
        </el-table-column>
        <el-table-column prop="distance" label="距离">
        </el-table-column>
      </el-table>

       <el-table :data="movieData" ref='new' v-show='ismovie' min-height='80%'>
      <el-table-column prop="movieid" label="Id" >
        </el-table-column>
        <el-table-column prop="moviename" label="影名" >
        </el-table-column>
        <el-table-column prop='movieavatar' label="海报"  >
          <template slot-scope="scope">
          <img :src='scope.row.movieavatar' min-width='50%'/>
          </template>
        </el-table-column>
        <el-table-column prop="wantnum" label="想看人数">
        </el-table-column>
        <el-table-column prop="stars" label="收藏">
        </el-table-column>
        <el-table-column prop="ondate" label="上映日期">
        </el-table-column>
      </el-table>

       <el-table :data="commentData" ref='new' v-show='iscomment'>
      <el-table-column prop="commentid" label="Id" >
        </el-table-column>
        <el-table-column prop="commenttext" label="评论" >
        </el-table-column>
        <el-table-column prop="movieid" label="电影ID">
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
        cinemaData:[],
        movieData:[],
        commentData:[],
        dialogFormVisible: false,
        form:{
            uid:'',
            uname:'',
            uaccount:'',
            upassword:'',
            uemail:'',
        },
        formLabelWidth: '120px',
        arr:this.$store.getters.user,
        isuser: true,
        ismovie: false,
        iscinema: false,
        iscomment: false,
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
        axios.get('http://localhost:8080/adminDelete',
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
         axios.get('http://localhost:8080/adminHome',
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

      },

      cinema(){
      this.isuser=false;
      this.ismovie=false;
      this.iscinema=true;
      this.iscomment=false;
      let list=JSON.parse(this.$route.query.cinemaInfo);
      for(let i in list){
        this.cinemaData.push(list[i]);
      }  
      },

      movie(){
      this.ismovie=true;
      this.isuser=false;
      this.iscinema=false;
      this.iscomment=false;
      let list=JSON.parse(this.$route.query.movieInfo);
      for(let i in list){
        this.movieData.push(list[i]);
      }  
      
      },

       comment(){
      this.isuser=false;
      this.ismovie=false;
      this.iscomment=true;
      this.iscinema=false;
      let list=JSON.parse(this.$route.query.commentInfo);
      for(let i in list){
        this.commentData.push(list[i]);
      }  
      },

      touser(){
        console.log(1)
        this.isuser=true;
        this.ismovie=false;
        this.iscinema=false;
        this.iscomment=false;
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
      height:800px;
  }

  .el-input{
    width: 300px;
  }

  .el-dialog{
    width: 400px;
  }
</style>