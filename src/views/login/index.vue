<template>
  <div>
    <div class="login-box">
      <h3 class="title">登录界面</h3>
      <el-form
        :model="loginForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="80px"
        class="demo-ruleForm"
      >
        <el-form-item label="账号" prop="username">
          <el-input
            type="text"
            v-model="loginForm.username"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input
            type="password"
            v-model="loginForm.password"
            autocomplete="off"
          ></el-input>
        </el-form-item>
       
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >提交</el-button
          >
          <el-button @click="resetForm('ruleForm')">重置</el-button>
          <el-button @click="register">注册</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import jwt from 'jwt-decode'
import {mapMutations} from 'vuex'
export default {
  data() {
    var validateUser = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入账号"));
      } else {
        callback();
      }
    };
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } {
        callback();
      }
    };
    return {
      loginForm: {
        username: "",
        password: "",
        
      },
      rules: {
        username: [{ validator: validateUser, trigger: "blur" }],
        password: [{ validator: validatePass, trigger: "blur" }],
      
      },
    };
  },
  methods: {
    ...mapMutations('loginMoule',['setUser']),
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // alert("验证通过!",this.loginForm);
          let{username,password}=this.loginForm;
          // 请求登录接口
          this.$api.getLogin({
            username,password
          }).then((res) => {
             console.log("------",res.data.data);
             if (res.data.status===200) {
             console.log(jwt(res.data.data));
            //  登录成功 1.存储登录信息 2.跳转页面  3.顶部区域显示用户信息  4.持久化
                let obj={
                  user:jwt(res.data.data).username,
                  token:res.data.data
                }
                this.setUser(obj);
                // 存储到本地  为了持久化做准备
                localStorage.setItem('user',JSON.stringify(obj))
                // 跳转
                this.$router.push('/')

             }else{
               //账号或者密码错误
              this.$message.error('错了哦，这是一条错误消息');
             }
          });

        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    register(){
      let{username,password}=this.loginForm;
      this.$api.getregister({
        username,password
      }).then((res) => {
         this.$message('注册成功！');
        // console.log("111",res.data);
        this.loginForm={}
      });
    }
  },
};
</script>

<style scoped>
.login-box {
  height: 300px;
  width: 400px;
  padding: 20px;
  margin: 150px auto;
  border: 1px solid #eee;
  background: #fff;
}
.title{
  margin-bottom: 20px;
  text-align: center;
  color: #666;
}
</style>