<template>
  <div>
    <el-dialog
      title="合同内容"
      :visible.sync="dialogVisible"
      width="70%"
      :before-close="handleClose"
    >
    <!-- 
        属性：
            src：文件路径

     -->
      <!-- <pdf src="./xst.pdf"></pdf> -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogVisible = false"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
  
</template>

<script>
// 1.安装pdf  npm i vue-pdf
// import pdf from 'vue-pdf'
export default {
     components: {
    // pdf
  },
  data() {
    return {
      dialogVisible: false,
    };
  },
  methods: {
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then((_) => {
          done();
        })
        .catch((_) => {});
    },
  },
};
</script>


<style>
</style>