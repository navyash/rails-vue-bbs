<template>
  <div style="max-width: 1100px;">
    <v-navigation-drawer
      v-model="drawer"
      :clipped="$vuetify.breakpoint.lgAndUp"
      app
    >
      <v-list dense>
        <template v-for="item in items">
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
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
  export default {
    data: () => ({
      idialog: false,
        drawer: null,
      items: [
        { text: '経済' },
        { text: 'スポーツ' },
        { text: '娯楽' },
        { text: '美容' },
        { text: '国際' },
        { text: 'ローカル' },
        { text: '金' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
        { text: 'ゲーム' },
      ],
    }),
  }
</script>