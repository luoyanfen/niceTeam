<template>
    <div>
        <div class="title">热门电影</div>
      <div class="bot">
          <div  class="moviebox" v-for="(item,index) in movieArr" :key="index">
            <img :src="item.movieavatar"  @click="todDetail" alt="">
            <div class="content">
                  <div class="left" >
                      <div class="name">{{item.moviename}}</div>
                      <div class="wa"><span class="wantnum">{{item.wantnum}}</span> 人想看</div>
                      <div class="star">{{item.stars}}</div>
                      <div class="date">{{item.ondate}}上映</div>
                  </div>
                  <div ref="btn" @click="wantSee(index,item.moviename,item.movieid)" :class="{want:iswant,leave:nowant}">{{wanttext}}</div>
            </div> 
        </div>
      </div>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      movieArr: [],
      iswant: true,
      nowant: false,
      wanttext: "想看"
    };
  },
  methods: {
    todDetail() {
      this.$router.push({ path: "/detail" });
      console.log(1);
    },
    wantSee(i, moviename,movieid) {
      console.log(this.$refs, moviename);
      this.$refs.btn[i].style.display = "none";
      //加入喜欢
      this.$axios.post("/addWant",{
        moviename:moviename
      }).then(res => {
            if(res.data==0){
                this.$axios.post("/addNum",{
                    movieid:movieid
                  }).then(res => {
                  console.log(111)
                  });
            }else{
              alert("你已加入喜欢")
            }
      });
    }
  },
  created() {
    this.$axios.get("/getMovie").then(res => {
      this.movieArr = res.data;
    });
  }
};
</script>

<style scoped>
.title {
  font-size: 0.3rem;
  margin: 0.8rem 0.2rem 0.2rem;
}
.moviebox {
  display: flex;
  font-size: 0.26rem;
  margin: 0.1rem 0.2rem 0.1rem;
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.moviebox img {
  width: 1.5rem;
  height: 2rem;
}
.content {
  width: 70%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-left: 0.1rem;
  border-bottom: 1px solid #ccc;
}
.content .name {
  font-size: 0.3rem;
  margin-bottom: 0.1rem;
}
.wa {
  margin-bottom: 0.05rem;
}
.wantnum {
  color: #faaf00;
  font-size: 0.28rem;
  font-weight: 600;
}
.want {
  width: 0.8rem;
  height: 0.4rem;
  line-height: 0.4rem;
  text-align: center;
  border-radius: 12%;
  font-size: 0.26rem;
  color: white;
  font-weight: 600;
  border: 1px solid;
  background-color: #faaf00;
  cursor: pointer;
}
.leave {
  width: 0.8rem;
  height: 0.4rem;
  line-height: 0.4rem;
  text-align: center;
  border-radius: 12%;
  font-size: 0.26rem;
  color: white;
  font-weight: 600;
  border: 1px solid;
  background-color: #ccc;
  cursor: pointer;
}
.bot {
  margin-bottom: 1.2rem;
}
</style>

