<template>
  <div class="layout">
      <MyMenu class="mennu" :isCollapse="isCollapse"/>
      <Content class="content" :class="{isActive:isCollapse}" @ChangeCollapse='ChangeCollapse' :isCollapse="isCollapse"/>
  </div>
   
</template>

<script>
import MyMenu from '@/views/Layout/MyMenu.vue'
import Content from '@/views/Layout/Content.vue'
export default {
   components:{
        MyMenu,
        Content
   },
   data() {
     return {
       isCollapse:false
     }
   },
   methods: {
     ChangeCollapse(){
       this.isCollapse=!this.isCollapse
     }
   },

}
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
}
.mennu{
  /* width: 200px; */
  background: #183555;
  position: fixed;
  top: 0;
  bottom: 0;
}
.content{
  /* width: 80%; */
  margin-left: 200px;
  /* transition: 0s all linear; */
}
.isActive{
  margin-left: 64px;
   /* transition: 1s all linear; */
}
</style>