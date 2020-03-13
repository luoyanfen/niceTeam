<template>
    <div class="root">
      <div class="items" v-for="(item,i) in rootArr" :key='i' >
         <a :href="item.src">
              <img :src="item.img" alt="">
              <span>{{item.desc}}</span>
         </a>
      </div>
     
    </div>
</template>

<script>
import foods from "../../assets/food.png";
import beauty from "../../assets/beauty.png";
import ktv from "../../assets/KTV.png";
import movie from "../../assets/movie.png";
import all from "../../assets/all.png";
export default {
  data() {
    return {
      rootArr: [
        { img: foods, desc: "美食", src: "/dlc" },
        { img: movie, desc: "电影", src: "/movie" },
        { img: ktv, desc: "KTV", src: "/ktv" },
        { img: beauty, desc: "丽人", src: "/beauyt" },
        { img: all, desc: "全部", src: "/all" }
      ]
    };
  },
  methods: {}
};
</script>


<style scoped>
.root {
  font-size: 0.26rem;
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  margin: 0.2rem 0;
}
.root a {
  display: block;
  width: 0.8rem;
  height: 0.8rem;
  text-align: center;
  border: 1px solid;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 0.2rem;
  border-radius: 50%;
  background-color: #ffcf00;
  text-decoration: none;
  color: #ccc
}
a img {
  width: 0.3rem;
  height: 0.3rem;
}
</style>

