<template>
  <div>
     <el-upload
  class="upload-demo"
  ref="upload"
  :action="url"
  :on-success='successupload'
  :on-preview="handlePreview"
  :on-remove="handleRemove"
  :file-list="fileList"
  :auto-upload="false">
  <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
  <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
  
</el-upload>
  </div>
</template>

<script>
import base from '../../api/base'
  export default {
    data() {
      return {
        url:base.uploadUrl,
        fileList: []
      };
    },
    methods: {
      submitUpload() {
        this.$refs.upload.submit();
      },
    //   成功
    successupload(response,file,list){
        console.log("上传成功",response,file,list);
    this.$message({
          message: '恭喜你，图片上传成功',
          type: 'success'
        });
    // 把成功的数据接口 response传递给父组件
    // http://localhost:8989/1654507378105-1.jpg
    let imgUrl=base.host+response.url.slice(7);
    this.$emit('senImg',imgUrl)
    this.fileList=[]
    },
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
      }
    }
  }
</script>
</script>

<style>

</style>