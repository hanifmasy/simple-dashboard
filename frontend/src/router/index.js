import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/LoginWeb.vue'
import Dashboard from '../views/DashboardWeb.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    component: Login
  },
  {
    path: '/dashboard',
    component: Dashboard
  },
  {
    path: '/',
    redirect: '/login'
  }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

export default router
