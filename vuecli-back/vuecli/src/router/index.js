import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/movie',
    name: 'Movie',
    component: () => import('../views/Movie.vue'),
  
  },
  {
    path: '/ktv',
    name: 'Ktv',
    component: () => import('../views/Ktv.vue')
  },
  {
    path: '/ktv',
    name: 'Ktv',
    component: () => import('../views/Ktv.vue')
  },
  {
    path: '/User',
    component: () => import('../views/User.vue'),
    children:[
      {
        path: '/login',
        name: 'Login',
        component: () => import('../components/normalUser/Login.vue'),
      },
      {
        path: '/register',
        name: 'register',
        component: ()=> import('../components/normalUser/register.vue'),
      }
    ]
  },
  {
    path:'/profile',
    name:'profile',
    component:()=>import('../components/normalUser/profile.vue')
  },
  {
    path:'/modify',
    name:'modify',
    component:()=>import('../components/normalUser/modify.vue')
  },
  {
    path: '/food',
    name: 'Food',
    component: () => import('../components/adminUser/Food.vue'),
  },
  {
    path: '/verify',
    name: 'verify',
    component: () => import('../views/verify.vue'),
  },
  {
    path: '/order',
    name: 'order',
    component: ()=> import('../components/normalUser/order.vue')
  },
  {
    path: '/adminLogin',
    name: 'adminLogin',
    component: ()=> import('../components/adminUser/adminLogin.vue'),
  },
  {
    path: '/adminHome',
    name: 'adminHome',
    component: ()=> import('../components/adminUser/adminHome.vue'),
  },
  {
    path: '/shop',
    name: 'shop',
    component: ()=> import('../components/normalUser/shop.vue')
  },
  {
    path: '/beauty',
    name: 'Beauty',
    component: () => import('../views/Beauty.vue')
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})



export default router
