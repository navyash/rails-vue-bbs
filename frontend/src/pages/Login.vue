<template>
  <div>
    <v-app id="inspire">
      <v-content>
        <v-container
          fluid
          fill-height
        >
          <v-layout
            align-center
            justify-center
          >
            <v-flex
              xs12
              sm8
              md4
            >
              <v-card class="elevation-12">
                <v-toolbar
                  color="primary"
                  dark
                  flat
                >
                  <v-toolbar-title>ログイン</v-toolbar-title>
                  <v-spacer></v-spacer>
                </v-toolbar>
                <validation-observer v-slot="{ handleSubmit }">
                  <v-form @submit.prevent="handleSubmit(onSubmit)">
                    <v-card-text>
                      <v-alert type="error" v-show="alertFlg">
                        {{ errorMessage }}
                      </v-alert>
                      <validation-provider name="メールアドレス" rules="required|email" v-slot="{ errors }">
                        <v-text-field
                          label="メールアドレス"
                          v-model="email"
                          :error-messages="errors"
                          name="email"
                          type="text"
                          prepend-icon="person"
                        ></v-text-field>
                      </validation-provider>
                      <validation-provider name="パスワード" rules="required" v-slot="{ errors }">
                        <v-text-field
                          id="password"
                          label="パスワード"
                          v-model="password"
                          :error-messages="errors"
                          name="password"
                          type="password"
                          prepend-icon="lock"
                        ></v-text-field>
                      </validation-provider>
                    </v-card-text>
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="primary" type="submit">ログイン </v-btn>
                    </v-card-actions>
                  </v-form>
                </validation-observer>
              </v-card>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
      email: '',
      password: '',
      errorMessage : '',
      alertFlg : false
  }),
  methods: {
    onSubmit() {
      axios
        .post('/api/v1/auth/sign_in', {
          email: this.email,
          password: this.password
        })
        .then(response => {
          console.log(response)
          this.$router.push('/')
          this.$router.go({path: '/', force: true})
        })
        .catch(
          this.errorMessage = 'ログインできませんでした。',
          this.alertFlg = true
        )
    }
  }
}
</script>