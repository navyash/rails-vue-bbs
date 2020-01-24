import Vue from "vue";
import Router from "vue-router";
import Login from './pages/Login.vue'
import SignUp from './pages/SignUp.vue'
import Top from './pages/Top.vue'
import Post from './pages/Post.vue'
import Search from './pages/Search.vue'
// import axios from 'axios'

Vue.use(Router);
const router = new Router({
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
    },
    {
      path: '/sign_up',
      name: 'sign_up',
      component: SignUp
    },
    {
      path: '/post',
      name: 'post',
      component: Post
    },
    {
      path: '/search',
      name: 'search',
      component: Search
    }
  ]
});

// var isLogin = false;

// async function loginCheck() {
//   try {
//     const response = await axios
//       .get('/api/v1/users', {
//         headers: {
//           'access-token': localStorage.getItem('access-token'),
//           'uid': localStorage.getItem('uid'),
//           'client': localStorage.getItem('client'),
//           'expiry': localStorage.getItem('expiry')
//         }
//       })
//     console.log(response)
//     isLogin = true
//   } catch (error) {
//     console.log(error)
//   }
// }

// router.beforeEach((to, from, next) => {
//   if (to.matched.some(record => record.meta.requiresAuth)) {
//     loginCheck()
//     if (isLogin === false) {
//           next({
//               path: '/login',
//               query: { redirect: to.fullPath }
//           })
//       } else {
//           next()
//       }
//   } else {
//       next();
//   }
// });

export default router