import Vue from "vue";
import Router from "vue-router";
import Login from './pages/Login.vue'
import Top from './pages/Top.vue'

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: 'top',
      component: Top
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    }
  ]
});