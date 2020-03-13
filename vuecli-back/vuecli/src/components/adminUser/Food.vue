<template>
  <div>
    <div class="tt">添加店铺</div>
    <table border="1">
      <tr>
        <th>店铺种类id</th>
        <th>店铺名</th>
        <th>店铺主题图片</th>
        <th>店铺特色</th>
        <th>店铺位置</th>
        <th>平均价格</th>
      </tr>
      <tr>
        <td>
          <input type="number" v-model="shtid" />
        </td>
        <td>
          <input type="text" v-model="shname" />
        </td>
        <td>
          <img :src="uploadimg" class="uploadimg" @click="testClick" v-if="disimg" />
          <input type="file" @change="upload" ref="fileid" multiple="multiple" class="uploadbtn" />
        </td>
        <td>
          <input type="text" v-model="shspecial" />
        </td>
        <td>
          <input type="text" v-model="shlocal" />
        </td>
        <td>
          <input type="text" v-model="shprice" />
        </td>
      </tr>
    </table>
    <button type="button" @click="enter">确定添加</button>
    <div class="tt">店铺种类参考</div>
    <table border="1">
      <tr>
        <th>店铺种类id</th>
        <th>店铺种类名</th>
      </tr>
      <tr v-for="(item,index) in shtype" :key="index">
        <td>{{item.shtid}}</td>
        <td>{{item.shtname}}</td>
      </tr>
    </table>
    <div v-if="allshopdis">
      <div class="tt">现有店铺</div>
      <table border="1">
        <tr>
          <th>店铺种类id</th>
          <th>店铺名</th>
          <th>店铺主题图片</th>
          <th>店铺特色</th>
          <th>店铺位置</th>
          <th>平均价格</th>
        </tr>
        <tr v-for="(item,index) in allshop" :key="index">
          <td>{{item.shtid}}</td>
          <td>{{item.shname}}</td>
          <td>
            <img :src="item.shimg" alt width="150px" height="70px" />
          </td>
          <td>{{item.shspecial}}</td>
          <td>{{item.shlocal}}</td>
          <td>{{item.shprice}}</td>
          <td>
            <span class="update" @click="updateshop(item.shid)">点击修改</span>
          </td>
          <td>
            <span class="update" @click="deleteshop(item.shid)">点击删除</span>
          </td>
        </tr>
      </table>
    </div>
    <div v-if="!allshopdis">
      <div class="tt">修改数据</div>
      <table border="1">
        <tr>
          <th>店铺种类id</th>
          <th>店铺名</th>
          <th>店铺主题图片</th>
          <th>店铺特色</th>
          <th>店铺位置</th>
          <th>平均价格</th>
        </tr>
        <tr>
          <td>
            <input type="number" v-model="update.shtid" />
          </td>
          <td>
            <input type="text" v-model="update.shname" />
          </td>
          <td>
            <img :src="update.shimg" alt width="150px" height="70px" />
          </td>
          <td>
            <input type="text" v-model="update.shspecial" />
          </td>
          <td>
            <input type="text" v-model="update.shlocal" />
          </td>
          <td>
            <input type="text" v-model="update.shprice" />
          </td>
          <td style="border:none">
            <span class="update" @click="enterup">
              确定修改
              <span style="display:none">{{update.shid}}</span>
            </span>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { rename } from "fs";
export default {
  data: function() {
    return {
      shtid: "",
      shname: "",
      shspecial: "",
      shlocal: "",
      shprice: "",
      shtype: [],
      allshop: [],
      update: [],
      allshopdis: true,
      fileList: [{ name: "", url: "" }],
      uploadimg: "",
      disimg: false
    };
  },
  watch: {
    uploadimg() {
      this.disimg = true;
    }
  },
  created() {
    let this_ = this;
    this.$axios
      .get("/getsht", {
        params: {}
      })
      .then(function(response) {
        console.log(response);
        this_.shtype = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    this.$axios
      .get("/allshop", {
        params: {}
      })
      .then(function(response) {
        console.log(response);
        this_.allshop = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
  },
  methods: {
    enter() {
      let this_ = this;
      let shop = {
        shtid: this.shtid,
        shname: this.shname,
        shimg: this.uploadimg,
        shspecial: this.shspecial,
        shlocal: this.shlocal,
        shprice: this.shprice
      };
      this.$axios
        .get("/addshop", {
          params: {
            shopobj: shop
          }
        })
        .then(function(response) {
          console.log(response);
          this_.shtype = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
      this.$axios
        .get("/getsht", {
          params: {}
        })
        .then(function(response) {
          console.log(response);
          this_.shtype = [];
          this_.shtype = response.data;
          alert("添加成功")
        })
        .catch(function(error) {
          console.log(error);
        });
      this.$router.go(0);
    },
    updateshop(shid) {
      let this_ = this;
      this.allshopdis = false;
      this.$axiosaxios
        .get("/getshopbyid", {
          params: {
            id: shid
          }
        })
        .then(function(response) {
          this_.update = response.data[0];
          console.log(this_.update);
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    enterup() {
      // console.log(this.update)
     this.$axios
        .get("/updateshop", {
          params: {
            alldate: this.update
          }
        })
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
      this.allshopdis = true;
      this.$router.go(0);
    },
    deleteshop(shid) {
      let isd = confirm("是否删除该项店铺");
      if (isd) {
       this.$axios
          .get("/deleteshop", {
            params: {
              id: shid
            }
          })
          .then(function(response) {
            // console.log(response);
          })
          .catch(function(error) {
            console.log(error);
          });
        this.$router.go(0);
        alert("删除成功");
      } else {
        alert("取消删除");
      }
    },
    testClick() {
      console.log("ddd");
    },
    upload() {
      let file = this.$refs.fileid.files[0];
      console.log(file);
      let formData = new FormData();
      formData.append("file", file);
       this.$axios({
        method: "post",
        url: "/uploadimg",
        data: formData
      }).then(res => {
        console.log(res);
        this.uploadimg = res.data.src;
      });
    }
  }
};
</script>

<style scoped>
*{
  margin: 0;padding: 0;
  font-size: 0.16rem;
}
.uploadimg {
  width: 100px;
  height: 80px;
}
input {
  border: none;
  height: 100px;
}
input:focus {
  border: none;
}
.uploadbtn {
  height: 24px;
}
.update {
  background-color: rgb(255, 145, 0);
  border-radius: 5px;
  display: inline-block;
  width: 80px;
  height: 25px;
  line-height: 25px;
  text-align: center;
  cursor: pointer;
}
.tt {
  font-size: 29px;
  margin-bottom: 10px;
}
</style>