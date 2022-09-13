<template>
  <div>
    <!-- 外部弹框 -->
    <el-dialog
      :title="title"
      :visible.sync="dialogVisible"
      :before-close="clearForm"
      width="70%"
    >
      <!-- 内容区域 -->
      <div class="form">
        <el-form
          :model="goodsForm"
          :rules="rules"
          ref="ruleForm"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="类目选择" prop="category">
            <el-button type="primary" @click="innerVisible = true"
              >类目选择</el-button
            >
            <span style="margin-left: 10px">{{ goodsForm.category }}</span>
          </el-form-item>

          <el-form-item label="商品名称" prop="title">
            <el-input v-model="goodsForm.title"></el-input>
          </el-form-item>

          <el-form-item label="商品价格" prop="price">
            <el-input v-model="goodsForm.price"></el-input>
          </el-form-item>

          <el-form-item label="商品数量" prop="num">
            <el-input v-model="goodsForm.num"></el-input>
          </el-form-item>

          <el-form-item label="发布时间" required>
            <el-col :span="11">
              <el-form-item prop="date1">
                <el-date-picker
                  type="date"
                  placeholder="选择日期"
                  v-model="goodsForm.date1"
                  style="width: 100%"
                ></el-date-picker>
              </el-form-item>
            </el-col>
            <el-col class="line" :span="2">-</el-col>
            <el-col :span="11">
              <el-form-item prop="date2">
                <el-time-picker
                  placeholder="选择时间"
                  v-model="goodsForm.date2"
                  style="width: 100%"
                ></el-time-picker>
              </el-form-item>
            </el-col>
          </el-form-item>

          <el-form-item label="商品卖点" prop="sellPoint">
            <el-input v-model="goodsForm.sellPoint"></el-input>
          </el-form-item>

          <el-form-item label="商品图片" prop="image">
            <el-button
              type="primary"
              @click="innerVisibleImg = true"
              style="margin-right: 10px"
              >上传图片</el-button
            >
            <img :src="goodsForm.image" alt="" height="150px" />
          </el-form-item>

          <el-form-item label="商品描述" prop="descs">
            <!-- <textarea name="" id="" cols="30" rows="10"></textarea> -->
            <wangEditor @sendEditor="sendEditor" ref="myEditor" />
          </el-form-item>
        </el-form>
      </div>

      <!-- 底部区域 -->
      <div slot="footer" class="dialog-footer">
        <el-button @click="clearForm">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
      <!--1.类目 内部弹框 -->
      <div>
        <el-dialog
          width="40%"
          title="类目选择"
          :visible.sync="innerVisible"
          append-to-body
        >
          <TreeGoods @sendTreeData="sendTreeData" />
          <div slot="footer" class="dialog-footer">
            <el-button @click="innerVisible = false">取 消</el-button>
            <el-button type="primary" @click="showTreeData">确 定</el-button>
          </div>
        </el-dialog>
      </div>
      <!-- 2.图片 内部弹框 -->
      <div>
        <el-dialog
          width="50%"
          title="类目选择"
          :visible.sync="innerVisibleImg"
          append-to-body
        >
          <UploadImg @senImg="senImg" />
          <div slot="footer" class="dialog-footer">
            <el-button @click="innerVisibleImg = false">取 消</el-button>
            <el-button type="primary" @click="showImg">确 定</el-button>
          </div>
        </el-dialog>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import TreeGoods from "./TreeGoods.vue";
import UploadImg from "./UploadImg.vue";
import wangEditor from "./wangEditor.vue";
export default {
  components: { TreeGoods, UploadImg, wangEditor },
  // props: ["dialogVisible"],
  props: {
    title: {
      type: String,
      default: "添加商品",
    },
    rowData: {
      type: Object,
      default: function () {
        return {};
      },
    },
  },
  data() {
    return {
      dialogVisible: false,
      innerVisible: false,
      innerVisibleImg: false,
      treeData: {},
      imgUrl: {},
      goodsForm: {
        id:"",
        cid: "",
        title: "",
        price: "",
        num: "",
        sellPoint: "", //卖点
        image: "",
        category: "", //商品类目
        descs: "", //描述
        data1: "",
        data2: "",
      },
      rules: {
        title: [
          { required: true, message: "请输入商品名称", trigger: "blur" },
          { min: 2, max: 8, message: "长度在 2 到 8 个字符", trigger: "blur" },
        ],
        price: [{ required: true, message: "请输入商品价格", trigger: "blur" }],
        num: [{ required: true, message: "请输入商品数量", trigger: "blur" }],
        date1: [
          {
            type: "date",
            required: true,
            message: "请选择日期",
            trigger: "blur",
          },
        ],
        date2: [
          {
            type: "date",
            required: true,
            message: "请选择时间",
            trigger: "blur",
          },
        ],
      },
    };
  },
  // **监听器***
  watch: {
    rowData(val) {
      console.log("数据发生变化", val);
      console.log(this.title);
      this.goodsForm = val;
      // 设置富文本编辑器的数据内容
      this.$nextTick(() => {
        this.$refs.myEditor.editor.txt.html(val.descs);
      });
    },
  },
  methods: {
    /**
     * 接收富文本的数据  字组件
     */
    sendEditor(val) {
      this.goodsForm.descs = val;
    },

    /**
     * 图片子组件传过来
     */
    senImg(val) {
      console.log("显示图片的地址", val);
      this.imgUrl = val;
    },
    showImg() {
      (this.innerVisibleImg = false), (this.goodsForm.image = this.imgUrl);
    },

    /**
     * 获取子组件tree的值
     */
    sendTreeData(val) {
      console.log(val);
      this.treeData = val;
    },
    // 点击确定展示tree数据
    showTreeData() {
      this.innerVisible = false;
      // 显示tree数据
      this.goodsForm.category = this.treeData.name;
      this.goodsForm.cid = this.treeData.cid;
    },

    //自定义事件  子传父  通知父亲改 dialogVisible
    // close() {
    //   this.dialogVisible = false;
    //   // this.$emit("changeDialog");
    // },
    submitForm() {
      this.$refs.ruleForm.validate((valid) => {
        if (valid) {
          //  参数： title cid  category sellPoint price num descs paramsInfo image
          // console.log("获取的嘻信息", this.goodsForm);
          let {
            id,
            title,
            cid,
            category,
            sellPoint,
            price,
            num,
            descs,
            paramsInfo,
            image,
          
          } = this.goodsForm;
          // 判断当时的按钮是类型 因为公用了  确定
          if (this.title === "添加商品") {
            this.$api
              .addGoods({
                title,
                cid,
                category,
                sellPoint,
                price,
                num,
                descs,
                paramsInfo,
                image,
              })
              .then((res) => {
                if (res.data.status === 200) {
                  console.log("添加成功", res.data1);
                  this.$parent.http(1); //2.实时更新父组件列表数据
                  this.$message({
                    message: "恭喜你，这是一条成功消息",
                    type: "success",
                  });
                  //  清空表单 调用clearform
                  this.clearForm();
                } else {
                  this.$message.error("错了哦，这是一条错误消息");
                }
              });
          } else {
            console.log("编辑商品");
            this.$api.updateGoods({
              id,title,
            cid,
            category,
            sellPoint,
            price,
            num,
            descs,
            paramsInfo,
            image,
            }).then((res)=>{
              console.log(res.data);
               this.$parent.http(1); //2.实时更新父组件列表数据
                  this.$message({
                    message: "恭喜你，修改商品成功",
                    type: "success",
                  });
                  //  清空表单 调用clearform
                  this.clearForm();
            })
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    /**
     * 清空列表
     */
    clearForm() {
      this.dialogVisible = false; //1.关闭弹窗
      //1.1elemnet 清空表单   2手动更新goodForm为空
      // this.$refs.ruleForm.resetFields();//有问题 会影响富文本
      this.goodsForm = {
        cid: "",
        title: "",
        price: "",
        num: "",
        sellPoint: "", //卖点
        image: "",
        category: "", //商品类目
        descs: "", //描述
        data1: "",
        data2: "",
      };
      this.$refs.myEditor.editor.txt.clear();
    },
  },
};
</script>

<style>
</style>