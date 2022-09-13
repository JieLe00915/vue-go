<template>
  <div class="goods">
    <!-- 1.搜索区域 -->
    <div class="header">
      <el-input
        v-model="input"
        placeholder="请输入内容"
        @change="searchInp"
      ></el-input>
      <el-button type="primary">查询</el-button>
      <el-button type="primary">
        <router-link to="/add-goods" style="color: #fff">页面添加</router-link>
      </el-button>
      <el-button type="primary" @click="addGoods">添加</el-button>
    </div>

    <!-- 2.表格内区域展示是图数据 -->
    <div class="wrapper">
      <template>
        <el-table :data="tableData" style="width: 100%" border>
          <el-table-column type="selection" width="55"> </el-table-column>
          <el-table-column prop="id" label="商品ID" width="100">
          </el-table-column>
          <el-table-column
            prop="title"
            label="商品名称"
            width="100"
            show-overflow-tooltip
          >
          </el-table-column>
          <el-table-column
            prop="price"
            label="商品价格"
            width="100"
            show-overflow-tooltip
          >
          </el-table-column>
          <el-table-column
            prop="num"
            label="商品数量"
            width="100"
            show-overflow-tooltip
          >
          </el-table-column>
          <el-table-column
            prop="category"
            label="规格类目"
            width="100"
            show-overflow-tooltip
          >
          </el-table-column>
          <el-table-column prop="image" label="商品图片" show-overflow-tooltip>
          </el-table-column>
          <el-table-column
            prop="sellPoint"
            label="商品卖点"
            show-overflow-tooltip
          >
          </el-table-column>
          <el-table-column prop="descs" label="商品描述" show-overflow-tooltip>
          </el-table-column>
          <el-table-column label="操作" width="180">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)"
                >编辑</el-button
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
    </div>

    <!-- 3.分页 -->
    <MyPagination
      :total="total"
      :pageSize="pageSize"
      :currentPage="currentPage"
      @changePage="changePage"
    />
    <!-- 4.弹框   操作子组件： 1.父传子  2.childr 3.ref-->
    <!-- <goodsDialog :dialogVisible="dialogVisible" @changeDialog="changeDialog" /> -->
    <goodsDialog ref="dialog" :title='title'  :rowData='rowData'/>
  </div>
</template>

<script>
import MyPagination from "@/components/MyPagination.vue";
import goodsDialog from "@/views/Goods/goodsDialog.vue";
export default {
  components: { MyPagination, goodsDialog },
  data() {
    return {
      rowData:{},//当前行的数据
      title:'添加商品',
      input: "",
      tableData: [],
      total: 1,
      pageSize: 10,
      list: [],
      type: 1, //自定义的 用于 判断 点击下面页码 执行搜索还是原本页面的
      dialogVisible: false,
      currentPage: 1, //选中的页码
    };
  },
  methods: {
    // 弹窗添加
    addGoods() {
      // this.dialogVisible = true;
      // 用ref 修改 子组件的 变量  此变量声明 子组件
      this.title="添加商品";
      // this.$refs.dialog.$refs.ruleForm.resetFields();
      this.$refs.dialog.dialogVisible = true;
    },  
    // 子传父 changeDialog
    // changeDialog(res) {
    //   this.dialogVisible = false;
    // },
    // 分页页码
    changePage(num) {
      this.currentPage = num;
      if (this.type === 1) {
        this.http(num);
      } else {
        // 0-3,3-6
        // console.log('执行分页');
        this.tableData = this.list.slice((num - 1) * 3, num * 3);
      }
    },
    // 搜索
    searchInp(val) {
      if (!val) {
        // 搜索无数据
        this.http(1);
        this.type = 1;
        this.currentPage = 1;
        return;
      } else {
        // console.log("搜索" + val);
        this.$api
          .getSearch({
            search: val,
          })
          .then((res) => {
            // 有数据  就让页码初始为1
            this.currentPage = 1;
            if (res.data.status === 200) {
              // 使用每一页三条数据 得进行分割
              this.list = res.data.result;
              // 总条数
              this.total = res.data.result.length;
              this.pageSize = 3;
              this.type = 2;
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

    // 编辑方法
    handleEdit(index,row) {
      // console.log(11);
      
       this.$refs.dialog.dialogVisible=true
       this.title="编辑商品"
      //  1.利用ref直接给goodsForm赋值
      // this.$refs.dialog.goodsForm=row
      // 2.设置变量传值 ... 每次都重新赋值 地址不同
        this.rowData={...row}
    },
    // 删除方法
    handleDelete(index, row) {
      console.log(index, row);
      this.$confirm("此操作将永久删除此商品信息, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 请求删除接口
          this.$api.deleteGoods({ id: row.id }).then((res) => {
            if (res.data.status === 200) {
              this.$message({
                type: "success",
                message: "删除成功!",
              });
              this.http(1);
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },

    // 请求数据
    http(page) {
      this.type = 1;
      this.$api
        .getGoodsList({
          // page:page 解构赋值
          page,
        })
        .then((res) => {
          console.log(res.data);
          if (res.data.status === 200) {
            (this.tableData = res.data.data),
              (this.total = res.data.total),
              (this.pageSize = res.data.pageSize);
          }
        });
    },
  },

  // 生命周期函数
  created() {
    this.http(1);
  },
};
</script>

<style  scoped >
.goods {
  padding: 20px;
}
.header {
  display: flex;
  margin-bottom: 15px;
}
button {
  margin-left: 20px;
}
</style>