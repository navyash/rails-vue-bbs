<template>
  <v-app>
    <!-- <Navbar /> -->
    <v-content>
      <v-card style="padding:10px">
        <v-text-field
          v-model="search"
          solo-inverted
          hide-details
          prepend-inner-icon="search"
          label="Search"
          color="#fff"
          @change="onChange"
          >
        </v-text-field>
      </v-card>
      <v-container fluid fill-height>
        <template v-for="item in items">
          <Board v-bind:topic="item" :key="item.id">
        </template>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
// import Navbar from "../components/Navbar";
import Board from "../components/Board";
import axios from 'axios'

export default {
  name: 'App',
  components: {
    // Navbar,
    Board,
  },
  data: () => ({
      search: null,
      items: []
  }),
  methods: {
    onChange: function() {
      axios
        .get('/api/v1/search/' + this.search)
        .then(response => {
          this.items = response.data.data
          console.log(this.items)
        })
        .catch(error => console.log(error))
    }
}
};
</script>

<style scoped>
</style>