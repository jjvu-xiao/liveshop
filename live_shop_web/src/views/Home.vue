<template>
  <div class="container">
    <!-- 导航菜单栏 -->
    <nav-bar></nav-bar>
    <!-- 头部区域 -->
    <head-bar></head-bar>
    <!-- 主要内容区域 -->
    <main-content></main-content>
  </div>
  <!-- <div class="page">
    <h2>Home Page</h2>
    <li class="fa fa-home fa-lg"></li>
    <el-button type="primary" @click="testAxios()">测试Axios调用</el-button>
    <el-button type="primary" @click="getUser()">获取用户信息</el-button>
    <el-button type="primary" @click="getMenu()">获取菜单信息</el-button>
      <h3>{{$t('common.doc')}}</h3>
       <el-button type="success" @click="changeLanguage('zh_cn')">简体中文</el-button>
    <el-button type="success" @click="changeLanguage('en_us')">English</el-button>
  </div> -->
</template>

<script>
import axios from 'axios'
import mock from '@/mock/index.js'
import HeadBar from '@/views/HeadBar'
import NavBar from '@/views/NavBar'
import MainContent from '@/views/MainContent'
export default {
  components:{
        HeadBar,
        NavBar,
        MainContent
  }
};
</script>

<style scoped lang="scss">
  .container {
    position:absolute;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
    // background: rgba(224, 234, 235, 0.1);
  }
</style>  