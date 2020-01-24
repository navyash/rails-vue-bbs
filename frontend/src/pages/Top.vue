<template>
  <v-app>
    <!-- <Navbar /> -->
    <v-content>
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
      items: null,
  }),
  mounted () {
    axios
      .get('/api/v1/topics')
      .then(response => {
        this.items = response.data.data
        console.log("success!")
        console.log(this.items)
      })
      .catch(error => console.log(error))
  }
};
</script>