<template>
    <div>
       <div class="top">讨论</div>
        <el-input v-model="comtext" placeholder="请发表你的评论" @keyup.enter.native="addComment()">
        </el-input>
        <div class="comment" v-for="(item,i) in comArr" :key="i">
           <div class="info" >
                <img src="//p1.meituan.net/maoyanuser/18f12b5125d7b4813276b980df594ed64937.jpg@68w_68h" alt=""> 
                <span>{{item.uid}}</span>
           </div>
            <div class="text"> {{item.commenttext}}</div>
        </div>
    </div>
</template>

<script>

export default {
  data: function() {
    return {
      comtext: "",
      comArr: []
    };
  },
  methods: {
    addComment() {
      console.log(this.comtext);
      this.$axios
        .post("/addComment", {
          text: this.comtext,
          id: 1,
          movieid: 1
        })
        .then(res => {
          console.log("上传成功！");
        });
    }
  },
  
  updated() {
    this.$axios.get("/getComment").then(res => {
      this.comArr = res.data;
    });
  },
  created() {
    this.$axios.get("/getComment").then(res => {
      this.comArr = res.data;
    });
 
 }
  
};
</script>

<style scoped>
.top {
  font-size: 0.28rem;
  height: 0.4rem;
  line-height: 0.4rem;
  margin-left: 0.1rem;
}
.comment {
  font-size: 0.26rem;
  margin: 0.2rem;
}
.comment .info {
  height: 0.5rem;
  display: flex;
  align-items: center;
  margin-bottom: 0.1rem;
}
.comment img {
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 50%;
  margin-right: 0.2rem;
}
.comment .text {
  margin-left: 0.5rem;
  height: 1rem;
  border-bottom: 0.5px solid #ccc;
}
</style>

