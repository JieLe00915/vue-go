import Vue from 'vue'
import VueRouter from 'vue-router'
// 一级路由
import Layout from '../views/Layout/index.vue'
import login from '../views/login/index.vue'

// 二级路由
import Home from '../views/Home/index.vue'
// 异步写法
const Goods=()=>import('../views/Goods/Goods.vue')
const Advert=()=>import('../views/Advert/Advert.vue')
const Params=()=>import('../views/Params/Params.vue')
const Specifications=()=>import('../views/Params/Paramsinfo/Specifications.vue')

const user=()=>import('../views/user/index.vue')
const Order=()=>import('../views/Order/index.vue')
// order下的路由
const OrderList=()=>import('../views/Order/OrderList/index.vue')
const OrderBack=()=>import('../views/Order/OrderBack/index.vue')
const AddGoods=()=>import('../views/Goods/AddGoods.vue')

Vue.use(VueRouter)

const routes = [
  {
    path: '',
    name: 'Layout',
    component: Layout,
    meta:{ isLogin:true,},
    children:[
      {
        path: '/',
        name: 'Home',
        component: Home
      },
      {
        path: '/goods',
        name: 'Goods',
        component: Goods
      },
      {
        path: '/user',
        name: 'user',
        component: user
      },
      {
        path: '/add-goods',
        name: 'AddGoods',
        component: AddGoods
      },
      
      {
        path: '/advert',
        name: 'Advert',
        component: Advert
      },
      {
        path: '/params',
        name: 'Params',
        component: Params,
        redirect:'/params/specifications',
        children:[
          {
            path: 'specifications',
            name: 'Specifications',
            component: Specifications,
        }
      ]
      },
      {
        path: '/order',
        name: 'Order',
        component: Order,
        // 重定向
        redirect:'/order/order-list',
        children:[
          {
            path: 'order-list',
            name: 'OrderList',
            component: OrderList
          },
          {
            path: 'order-back',
            name: 'OrderBack',
            component: OrderBack
          },
          
        ]
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: login
  }

]

const router = new VueRouter({
  routes
})



export default router
