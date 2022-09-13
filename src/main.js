import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import '@/assets/css/index.css'
import api from '@/api/index';
Vue.prototype.$api = api;
// 导入语言
// import './lang/index'
import i18n from './lang/index';
Vue.use(ElementUI);
//引入路由拦截
import './router/permission'
// 引入持久化 本地存储
import './utils'

// 导入echarts
import * as echarts from 'echarts'
Vue.prototype.$echarts=echarts
Vue.config.productionTip = false

const vm = new Vue({
  router,
  store,
  i18n,
  beforeCreate() {
    Vue.prototype.$bus = this //安装全局事件总线
  },
  render: h => h(App)
}).$mount('#app')
console.log(vm);