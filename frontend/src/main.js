import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify';
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
  render: h => h(App)
}).$mount('#app')
