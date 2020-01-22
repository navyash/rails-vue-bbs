<template>
  <v-app>
    <Navbar />
    <Header />
    <v-content>
      <v-container fluid fill-height>
        <v-layout justify-center align-center>
          <router-view></router-view>
          <Board />
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>


<script>
import Navbar from "@/components/Navbar";
import Header from "@/components/Header";
import Board from "@/components/Board";

export default {
  name: 'App',

  components: {
    Header,
    Navbar,
    Board,
  },

  data: () => ({
    //
  }),
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /* text-align: center; */
  color: #2c3e50;
}
</style>
