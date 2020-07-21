import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home.vue'
import NotFound from '@/views/404'
import Login from '@/views/Login'

Vue.use(Router)


export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    }, 
    {
      path: '/login',
      name: 'Login',
      component: Login
    }, 
    {
      path: '/404',
      name: 'notFound',
      component: NotFound
    }
  ]
})
