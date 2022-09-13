<template>
  <div  class="headers">
<el-pagination
  background
  layout="total, prev, pager, next,jumper"
  :page-size=pageSize
  :total=total
:current-page.sync="center"
@current-change="changePage"
  >
</el-pagination>
  </div>
</template>

<script>
export default {

props:{
  // 数据数量
    total:{
        type:Number,
        default:100
    },
    
    // 每页多少条数据
    pageSize:{
          type:Number,
          default:10
    },
    // 页码
     currentPage:{
          type:Number,
          default:1
    },
},
  data() {
    return {
      center:this.currentPage
    }
  },
methods: {
    // 参数默认为页码
    changePage(page){
        this.$emit('changePage',page)
    }
},
}
</script>

<style scoped>
.headers{
   text-align: center;
   margin: 20px;
}
</style>