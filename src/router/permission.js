import router from '@/router';
// 获取vuex
import store from '@/store/index'
//L路由拦截
router.beforeEach((to,from,next)=>{
    //1.判断是否需要登录    
    // console.log("777",to);
  if(to.matched.some(ele=>ele.meta.isLogin)){
  // 2.判断用户是否已经登陆
  let token=store.state.loginMoule.userinfo.token;
  if(token){
    next();
  }else{
    next('/login')
  }

    }else{//不需要登录
      next();
    }
}) 

