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
                  <v-toolbar-title>Login form</v-toolbar-title>
                  <v-spacer></v-spacer>
                </v-toolbar>
                <v-card-text>
                  <validation-observer v-slot="{ handleSubmit }">
                    <v-form @submit.prevent="handleSubmit(onSubmit)">
                      <validation-provider name="メールアドレス" rules="required|email" v-slot="{ errors }">
                        <v-text-field
                          label="メールアドレス"
                          v-model="email"
                          :error-messages="errors"
                          name="email"
                          type="text"
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
                        ></v-text-field>
                      </validation-provider>
                    </v-form>
                  </validation-observer>
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="primary" type="submit">Login</v-btn>
                </v-card-actions>
              </v-card>
            </v-flex>
          </v-layout>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<script>
export default {
  data: () => ({
      email: '',
      password: '',
  }),
  methods: {
    onSubmit() {
      alert(this.password)
    }
  }
}
</script>