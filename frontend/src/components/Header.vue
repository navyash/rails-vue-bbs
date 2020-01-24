<template>
  <div>
    <v-app-bar
      :clipped-left="$vuetify.breakpoint.lgAndUp"
      app
      color="navy darken-3"
      dark
    >
      <v-toolbar-title
        class="ml-0 pl-3"
        to="/"
      >
        <router-link to="/">
        <span>BBS</span>
        </router-link>
      </v-toolbar-title>

      <v-spacer></v-spacer>
      <span class="hidden-md-and-down" v-show="isLogin">{{ user }}</span>
      <v-btn icon to="/search">
          <v-icon small>fas fa-search</v-icon>
      </v-btn>
      <v-btn text to="/login" v-show="!isLogin">ログイン</v-btn>
      <v-btn text @click="logOut" v-show="isLogin">ログアウト</v-btn>
      <v-btn text to="/sign_up">会員登録</v-btn>
    </v-app-bar>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
      isLogin: false,
      user: ''
  }),
  mounted () {
    axios
      .get('/api/v1/users', {
        headers: {
          'access-token': localStorage.getItem('access-token'),
          'uid': localStorage.getItem('uid'),
          'client': localStorage.getItem('client'),
          'expiry': localStorage.getItem('expiry')
        }
      })
      .then(response => {
        console.log(response)
        this.user = response.data.data.email
        this.isLogin = true
      })
      .catch(error => console.log(error))
  },
  methods: {
    logOut() {
      localStorage.removeItem('access-token')
      localStorage.removeItem('uid')
      localStorage.removeItem('client')
      localStorage.removeItem('expiry')
      this.$router.go({path: '/', force: true})
    }
  }
}
</script>

<style scoped>
a {
  color : #fff;
  text-decoration: none;
}
@media screen and (max-width: 640px) {
  html { font-size: 12px;}
}

</style>