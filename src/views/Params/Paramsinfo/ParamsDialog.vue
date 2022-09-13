<template>
  <div>
    <el-dialog
      title="添加规格参数"
      :visible.sync="dialogVisible"
      width="60%"
      :before-close="handleClose"
    >
      <TreeGoods @sendTreeData="sendTreeData" />

      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button
          type="primary"
          @click="innerVisible = true"
          :disabled="isdisabled"
          >确定并添加分组</el-button
        >
      </span>
      <!-- 二级弹框 -->
      <el-dialog
        width="45%"
        title="商品规格参数配置"
        :visible.sync="innerVisible"
        append-to-body
      >
        <p>当前选中的商品：{{ treeData.name }}</p>
        <br />
        <el-button type="primary" @click="addDomain" style="margin-bottom: 10px"
          >新增规格列表</el-button
        >
        <hr />
        <!-- 表单添加 -->

        <el-form
          :model="dynamicValidateForm"
          ref="dynamicValidateForm"
          label-width="120px"
          class="demo-dynamic"
        >
          <!-- 遍历外部  -->
          <el-form-item
            v-for="(item, index) in dynamicValidateForm.groups"
            :label="item.title + index"
            :key="index"
            :prop="item.title"
            :rules="{
              required: true,
              message: '域名不能为空',
              trigger: 'blur',
            }"
          >
            <div class="item">
              <el-input v-model="item.title"></el-input>
              <el-button @click.prevent="addChildDomain(index)"
                >增加子组</el-button
              >
              <el-button @click.prevent="removeDomain(index)">删除</el-button>
            </div>
            <!-- 遍历内部children -->
            <el-form-item
              v-for="(els, i) in item.children"
              :label="els.title + i"
              :key="i"
              :prop="els.title"
              :rules="{
                required: true,
                message: '域名不能为空',
                trigger: 'blur',
              }"
            >
              <div class="item">
                <el-input v-model="els.title"></el-input>
                <el-button @click.prevent="removeChildDomain(index, i)"
                  >删除</el-button
                >
              </div>
            </el-form-item>
          </el-form-item>
        </el-form>

        <!-- 尾部 -->
        <span slot="footer" class="dialog-footer">
          <el-button @click="submitForm('dynamicValidateForm')" type="primary"
            >提交</el-button
          >
          <el-button type="primary" @click="resetForm('dynamicValidateForm')"
            >重置</el-button
          >
        </span>
      </el-dialog>
    </el-dialog>
  </div>
</template>

<script>
import TreeGoods from "../../Goods/TreeGoods.vue";
export default {
  components: { TreeGoods },
  data() {
    return {
      dialogVisible: false,
      innerVisible: false,
      isdisabled: true,
      treeData: {},
      dynamicValidateForm: {
        groups: [],
      },
    };
  },
  methods: {
    sendTreeData(val) {
      this.isdisabled = false;
      this.treeData = val;
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then((_) => {
          done();
        })
        .catch((_) => {});
    },
    //   提交事件
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // 调用规格参数 添加接口
          // * 参数：itemCatId,content,specsName
          this.$api
            .insertItemParam({
              itemCatId: this.treeData.name,
              content: JSON.stringify(this.dynamicValidateForm.groups),
              specsName: this.treeData.name,
            })
            .then((res) => {
              if (res.data.status === 200) {
                // 1.关闭弹窗
                this.innerVisible = false;
                this.dialogVisible = false;
                //2. 清空列表
                this.dynamicValidateForm.groups = "";
                this.isdisabled = true;
                // 3.及时刷新
                this.$parent.http(1);
              }
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    // 重置表单
    resetForm(formName) {
      this.innerVisible = false;
      this.dialogVisible = false;
      //2. 清空列表
      this.dynamicValidateForm.groups = "";
      this.isdisabled = true;
    },
    // 删除当前组件按钮
    removeDomain(index) {
      this.dynamicValidateForm.groups.splice(index, 1);
    },
    // 删除当前组件的子组件
    removeChildDomain(index, i) {
      this.dynamicValidateForm.groups[i].children.splice(i, 1);
    },

    // 增加父组  大的规格配置
    addDomain() {
      this.dynamicValidateForm.groups.push({
        value: "",
        title: "",
        children: [],
      });
    },
    // 增加子组
    addChildDomain(index) {
      this.dynamicValidateForm.groups[index].children.push({
        value: "",
        title: "",
      });
    },
  },
};
</script>

<style scoped>
.item {
  display: flex;
  margin: 5px;
}
.item button {
  margin-left: 10px;
}
</style>