// 持久化  防止刷新页面  导致密码丢失  回到登录页面
import store from "@/store";
let user=localStorage.getItem('user')
if (user) {
    user=JSON.parse(user);
    store.commit('loginMoule/setUser',user)
}