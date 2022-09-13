<template>
  <div class="params">
    <!-- 1.导航 -->
    <div class="nav">
      <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/' }">规格参数</el-breadcrumb-item>

        <el-breadcrumb-item>规格包装</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <!-- 2.搜索框 -->
    <div class="header">
      <el-input v-model="input" placeholder="请输入内容"    @change="searchInp"></el-input>
      <el-button type="primary">查询</el-button>
      <el-button type="primary" @click="showParams">页面添加 </el-button>
    </div>
    <!-- 3.表格 -->
    <template>
      <el-table
        :data="tableData"
        style="width: 100%"
        class="my-table"
        border=""
      >
        <el-table-column prop="itemCatId" label="规格参数ID" width="120">
        </el-table-column>
        <el-table-column prop="id" label="类目ID" width="120">
        </el-table-column>
        <el-table-column prop="specsName" label="规格名称" width="120">  </el-table-column>
        <el-table-column prop="paramData" label="规格参数" show-overflow-tooltip> </el-table-column>
        <el-table-column prop="address" label="操作">
          <template slot-scope="scope">
            <el-button size="mini" >查看</el-button
            >
            <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
              type="primary">编辑</el-button
            >
            <el-button
              size="mini"
              type="danger"
              @click="handleDelete(scope.$index, scope.row)"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </template>
    <!-- 4.分页 -->
    <MyPagination :pageSize="pageSize" :total="total" @changePage='changePage' :currentPage.sync="currentPage"/>
<!-- 5.弹框 -->
<ParamsDialog ref="dialog"/>



  </div>
</template>

<script>
import MyPagination from '../../../components/MyPagination.vue'
import ParamsDialog from './ParamsDialog.vue'
export default {
    components:{MyPagination,ParamsDialog},
  data() {
    return {
      input: "",
      tableData: [],
      pageSize: 1,
      total:10,
      currentPage:1,
      type:1, 
      list: [],
    };
  },
  methods: {
    //添加 
showParams(){
    this.$refs.dialog.dialogVisible=true
},
    // 分页
    changePage(page){
        if (this.type==1) {
            // this.currentPage=page
        this.http(page)
        }else{
              this.tableData = this.list.slice((page - 1) * 3, page * 3);
        }
    
      },
    //   搜索
   searchInp(val) {
      if (!val) {
        // 搜索无数据
        this.http(1);
        this.type=1;
        // this.currentPage=1
        return;
      } else {

        this.$api
          .getparamsSerch({
            search: val,
          })
          .then((res) => {
            // 有数据  就让页码初始为1
            // this.currentPage = 1;
            if (res.data.status === 200) {
                // console.log(res.data);
                 // 使用每一页三条数据 得进行分割
              this.list = res.data.result;
              this.total = res.data.result.length;
                  this.pageSize = 3;
                  this.type=2
             this.tableData = this.list.slice(0, 3);
            } else {
                 this.tableData = [];
              this.total = 1;
              this.pageSize = 1;
              this.type = 1; //定义页码执行哪一个语句
            }
          });
      }
    },














    http(page) {
      this.$api
        .getParams({
          page,
        })
        .then((res) => {
          console.log(res.data);
          if (res.data.status === 200) {
            this.tableData = res.data.data;
            //   获取分页
            this.pageSize = res.data.pageSize;
            this.total = res.data.total;
          }
          //   this.tableData=res.data
        });
    },
  },
  created() {
    this.http();
  },
};
</script>

<style scoped>
.params {
  margin: 10px;
}
.nav {
  padding: 10px;
}
.header {
  display: flex;
  background: #fff;
  padding: 10px;
  border: 1px solid #eee;
}
.header button {
  margin-left: 20px;
}
.my-table {
  margin: 10px auto;
}
</style>