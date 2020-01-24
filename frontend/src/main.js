import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify';
import "vuetify/dist/vuetify.min.css";
import axios from 'axios';
import { ValidationProvider, ValidationObserver, localize, extend } from 'vee-validate';
import ja from 'vee-validate/dist/locale/ja.json';
import { required, max, email, min } from 'vee-validate/dist/rules'

extend('required', required)
extend('email', email)
extend('max', max)
extend('min', min)

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
localize('ja', ja);

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  axios,
  created() {
    axios.interceptors.request.use((config) => {
      config.headers.client = window.localStorage.getItem('client');
      config.headers['access-token'] = window.localStorage.getItem('access-token');
      config.headers.uid = window.localStorage.getItem('uid');
      config.headers['token-type'] = window.localStorage.getItem('token-type');
      config.headers['expiry'] = window.localStorage.getItem('expirye');

      return config;
    });

    axios.interceptors.response.use((response) => {
      // Set user headers only if they are not blank.
      // If DTA gets a lot of request quickly, it won't return headers for some requests
      // so you need a way to keep headers in localStorage to gettting set to undefined
      if (response.headers.client) {
        localStorage.setItem('access-token', response.headers['access-token']);
        localStorage.setItem('client', response.headers.client);
        localStorage.setItem('uid', response.headers.uid);
        localStorage.setItem('token-type', response.headers['token-type']);
        localStorage.setItem('expiry', response.headers['expiry']);
      }
      // You have to return the response here or you won't have access to it
      // later
      return response;
    });
  },
  render: h => h(App)
}).$mount('#app')
