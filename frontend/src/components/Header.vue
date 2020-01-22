<template>
  <div>
    <v-app-bar
      :clipped-left="$vuetify.breakpoint.lgAndUp"
      app
      color="navy darken-3"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title
        class="ml-0 pl-3"
      >
        <span>Bulletin Board System</span>
      </v-toolbar-title>

      <v-spacer></v-spacer>
      <v-btn text>ログイン</v-btn>
      <v-btn text>会員登録</v-btn>
    </v-app-bar>
  </div>
</template>

<style>
.v-toolbar__content {
    max-width: 1100px;
    margin: 0 auto;
}
</style>