<!--  -->
<template>
  <div v-html='img'>
    
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data () {
    return {
        img:'',
    };
  },

  components: {},

  computed: {},

   created(){
    this.getDateil();
  },

  methods: {
      getDateil(){
      axios.post('http://127.0.0.1:8081/verify',
         {
           
          }
        )
          .then((res)=>{
            this.img=res.data;
            })
          .catch((error)=>{
            alert(error);
          }) 
      }  
  }
}

</script>
<style scoped>
</style>