import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const VueRouterPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(to) {
  return VueRouterPush.call(this, to).catch(err => err)
}

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
    path: "/cinema",
    name: 'Cinema',
    component: () => import('../components/movie/Cinema.vue')
  },
  {
    path: "/my",
    name: 'My',
    component: () => import('../components/movie/My.vue')
  },
  {
    path: "/detail",
    name: 'Detail',
    component: () => import('../components/movie/Detail.vue')
  },
  {
    path: '/ktv',
    name: 'Ktv',
    component: () => import('../views/Ktv.vue')
  },
  {
    path: '/ktv-shop',
    name: 'KTV-shop',
    component: () => import('../views/KTV-shop.vue'),
  },
  {
    path: '/beauty',
    name: 'Beauty',
    component: () => import('../views/Beauty.vue')
  },
  {
    path: '/user',
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
    path: '/dlc',
    name: 'Delicious',
    component: () => import('../views/Delicious.vue')
  },
  {
    path: '/food',
    name: 'Food',
    component: () => import('../components/adminUser/Food.vue')
  },
  {
    path: '/sortv',
    name: 'Sortv',
    component: () => import('../components/delicious/sortview.vue')
  },
  {
    path: '/shopv',
    name: 'Shopv',
    component: () => import('../components/delicious/shopview.vue')
  },
  {
    path: '/groupfo',
    name: 'Groupinfo',
    component: () => import('../components/delicious/groupinfo.vue')
  },
  {
    path: '/buying',
    name: 'Buying',
    component: () => import('../components/delicious/buying.vue')
  },
  {
    path: '/search',
    name: 'Search',
    component: () => import('../components/delicious/search.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
