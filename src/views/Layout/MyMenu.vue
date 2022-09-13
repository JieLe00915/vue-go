<template>
  <div>
    <el-menu
      :default-active="$route.path"
      class="el-menu-vertical-demo"
      background-color="#183555"
      text-color="#fff"
      active-text-color="#ffd04b"
      router
      :collapse="isCollapse"
    >
      <el-menu-item>
        <span slot="title">家具商品管理系统</span>
      </el-menu-item>

      <el-menu-item index="/">
        <i class="el-icon-menu"></i>
        <!-- <span slot="title">首页</span> -->
        <span slot="title">{{ $t("menu.home") }}</span>
      </el-menu-item>

      <el-menu-item index="/goods">
        <i class="el-icon-document"></i>
        <span slot="title">{{ $t("menu.goods") }}</span>
      </el-menu-item>


   <!-- 下拉 -->
      <el-submenu index="/params">
        <template slot="title">
           <i class="el-icon-setting"></i>
        <span slot="title">规格参数</span>
        </template>

          <el-menu-item index="/params/specifications">
              <i class="el-icon-setting"></i>
            <span>规格与包装</span>
          </el-menu-item>
      
      </el-submenu>




      <el-menu-item index="/advert">
        <i class="el-icon-setting"></i>
        <span slot="title">广告分类</span>
      </el-menu-item>

      <!-- 下拉 -->
      <el-submenu index="/order">
        <template slot="title">
          <i class="el-icon-location"></i>
          <span>订单管理</span>
        </template>

        <el-menu-item-group>
          <el-menu-item index="/order/order-list">
            <i class="el-icon-location"></i>
            <span>订单列表</span>
          </el-menu-item>

          <el-menu-item index="/order/order-back">
            <i class="el-icon-menu"></i>
            <span>退货管理</span>
          </el-menu-item>
        </el-menu-item-group>
      </el-submenu>
      
      <el-menu-item index="/user">
        <i class="el-icon-data-board"></i>
        <span slot="title">个人中心</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // isCollapse:false
    };
  },
  props: ["isCollapse"],
  // 全局事件总线实现兄弟间组件通信
  // mounted() {
  //   this.$bus.$on('isCollapse',()=>{
  //     this.isCollapse=!this.isCollapse
  //   })
  // },
};
</script>

<style>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}
.is-active {
  background: #054476 !important;
}
</style>