<template>
  <el-form label-width="100px" size="small" class="demo-ruleForm login-container">
    <el-form-item label="账号" prop="pass">
      <el-input placeholder="请输入内容" clearable />
    </el-form-item>
    <el-form-item label="密码" prop="checkPass">
      <el-input placeholder="请输入密码" show-password></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary">提交</el-button>
      <el-button>重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.login-container {
  -webkit-border-radius: 5px;
  border-radius: 5px;
  -moz-border-radius: 5px;
  background-clip: padding-box;
  margin: 100px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
  .title {
    margin: 0px auto 30px auto;
    text-align: center;
    color: #505458;
  }
}
</style>