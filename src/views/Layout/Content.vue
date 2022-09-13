<template>
  <div>
    
<div class="header">
  <i class="iconfont icon-right-indent" @click="change" v-if="!isCollapse"></i>
    <!-- <i class="iconfont icon-left-indent">ss</i> -->
    <i class="iconfont icon-indent-increase" @click="change" v-else></i>
  <div class="header-right">
      <el-dropdown>
  <span class="el-dropdown-link" style="color:#fff">
    多语言<i class="el-icon-arrow-down el-icon--right"></i>
  </span>
  <el-dropdown-menu slot="dropdown">
    <el-dropdown-item>中文</el-dropdown-item>
    <el-dropdown-item>Eenlish</el-dropdown-item>

  </el-dropdown-menu>
</el-dropdown>
      <div class="user">
        欢迎{{userinfo.user}}
        <!-- <span>退出的登录</span> -->
        <i class="iconfont icon-tuichu"  @click="loginout"></i>
      </div>
  </div>

  </div>
    <!-- <div style="height:1200px;width:200px;background:red"></div> -->
  
  <!-- 路与出口 -->
  <router-view></router-view>
  </div>
  
</template>

<script>
import {mapState,mapMutations} from 'vuex'
export default {
  props:['isCollapse'],
data() {
  return {
   
  }
  
},
computed:{
      ...mapState('loginMoule',['userinfo'])
  },
 
methods: {
  ...mapMutations('loginMoule',['clearUser']),
  change(){
    this.$emit('ChangeCollapse')
  },
  // 退出登录
  loginout(){
    // 清空vuex数据
    this.clearUser();
    // 清空本地存储
    localStorage.removeItem('user');
    // 跳转到登录页面
    this.$router.push('/login')
  }
},
}
</script>

<style scoped>

.header{
  width: calc(100%-65px);
  height: 50px;
  line-height: 50px;
  background: #1574C2;
}
@font-face {
  font-family: "iconfont"; /* Project id 3418014 */
  src: url('//at.alicdn.com/t/font_3418014_654aljibisy.woff2?t=1653621298687') format('woff2'),
       url('//at.alicdn.com/t/font_3418014_654aljibisy.woff?t=1653621298687') format('woff'),
       url('//at.alicdn.com/t/font_3418014_654aljibisy.ttf?t=1653621298687') format('truetype');
}

.iconfont {
  font-family: "iconfont" !important;
  font-size: 18px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.icon-tuichu:before {
  content: "\e623";
}

.icon-right-indent:before {
  content: "\e805";
}

.icon-left-indent:before {
  content: "\e7b7";
}

.icon-indent-increase:before {
  content: "\e617";
}
.header-right{
  float: right;
  padding-right: 20px;
  display: flex;
  color: #fff;
}
.user{
  margin-left:20px ;

}

</style>