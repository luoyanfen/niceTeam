import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
      username:localStorage.getItem('username'),
      userAvatar:localStorage.getItem('avatar'),
      userpassword:localStorage.getItem('userpassword'),
      useremail:localStorage.getItem('useremail'),
      boolean:true,

      user: localStorage.getItem('user')
  },
  mutations: {
    UserName: (state, username) => {
      state.username = username
      localStorage.setItem('username', username)
    },
    UserPassword: (state, userpassword) => {
      state.userpassword = userpassword
      localStorage.setItem('userpassword', userpassword)
    },
    UserEmail: (state, useremail) => {
      state.useremail = useremail
      localStorage.setItem('useremail', useremail)
    },
    user:(state,user)=>{
      state.user=user
      localStorage.setItem('user',user)
    }
  },
  actions: {
  },
  modules: {
  },
  getters:{
    username:(state)=>state.username,
    userpassword:(state)=>state.userpassword,
    useremail:(state)=>state.useremail,
    user:(state)=>state.user
  }
})
