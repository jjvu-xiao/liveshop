<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <el-container>
      <el-aside width="200px">
          <el-tree :data="data" :props="defaultProps" accordion @node-click="handleNodeClick"></el-tree>
         <!-- <router-link to="/home">Home</router-link> -->
         <!-- <router-link to="/about">About</router-link> -->
      </el-aside>
      <el-container>
          <el-header>Header</el-header>
          <el-main>
              <el-table :data="tableData" style="width: 100%">
                  <el-table-column
                      prop="date"
                      label="日期"
                      width="180">
                  </el-table-column>
                  <el-table-column
                      prop="name"
                      label="姓名"
                      width="180">
                  </el-table-column>
                  <el-table-column
                      prop="address"
                      label="地址">
                  </el-table-column>
              </el-table>
          </el-main>
          <el-footer>Footer</el-footer>
      </el-container>
    </el-container>
    
    <!-- <router-view></router-view> -->
  </div>
</template>

<script>
import aside from './components/aside.vue'
export default {
  name: 'App',
  data() {
      return {
        tableData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1517 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1519 弄'
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1516 弄'
        }],
        
      }
    }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
