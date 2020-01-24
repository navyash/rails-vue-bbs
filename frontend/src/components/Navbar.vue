<template>
  <!-- <div style="max-width: 1100px;"> -->
    <v-navigation-drawer
      v-model="drawer"
      :clipped="$vuetify.breakpoint.lgAndUp"
      app
    >
      <v-list dense>
        <template v-for="item in categories">
          <v-layout
            v-if="item.heading"
            :key="item.heading"
            row
            align-center
          >
            <v-flex xs6>
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-flex>
            <v-flex
              xs6
              class="text-xs-center"
            >
              <a
                href="#!"
                class="body-2 black--text"
              >EDIT</a>
            </v-flex>
          </v-layout>
          <v-list-item
            v-else
            :key="item.text"
          >
            <v-list-item-content>
              <v-list-item-title>
                {{ item.name }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>
  <!-- </div> -->
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    idialog: false,
    drawer: null,
    categories: []
  }),
  mounted () {
    axios
      .get('/api/v1/categories')
      .then(response => {
        this.categories = response.data.data
        console.log(this.categories)
      })
      .catch(error => console.log(error))
  }
}
</script>