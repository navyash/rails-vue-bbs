<template>
  <v-row justify="center">
    <v-col cols="12">
      <v-card>
        <v-toolbar color="grey lighten-3">
          <v-app-bar-nav-icon></v-app-bar-nav-icon>

          <v-toolbar-title>Message Board</v-toolbar-title>

          <v-spacer></v-spacer>

          <v-btn icon>
            <v-icon>mdi-magnify</v-icon>
          </v-btn>
        </v-toolbar>

        <v-list two-line>
          <template v-for="(item, index) in items">

            <v-list-item
              :key="item.title"
            >
              <v-list-item-content>
                <v-list-item-subtitle v-html="item.subtitle" inset class="mb-4"></v-list-item-subtitle>
                <v-list-item-title v-html="item.title" inset></v-list-item-title>
              </v-list-item-content>

              <v-list-item-action
               :key="item.title"
              >
                <v-list-item-action-text v-text="item.action"></v-list-item-action-text>
              </v-list-item-action>
            </v-list-item>

            <v-divider
            v-if="index + 1 <= items.length"
            :key="index"
            ></v-divider>
          </template>
        </v-list>
        <v-list three-line>
          <template>
            <validation-observer v-slot="{ handleSubmit }">
              <v-form @submit.prevent="handleSubmit(onSubmit)">
                <v-container :class="grid-list-xs">
                  <v-row dense style="height:65px">
                    <v-col
                      cols="3"
                    >
                      <validation-provider name="名前" rules="required|max:10" v-slot="{ errors }">
                        <v-text-field
                          label="名前"
                          v-model="name"
                          :error-messages="errors"
                          outlined
                          dense
                        >
                        </v-text-field>
                      </validation-provider>
                    </v-col>
                  </v-row>
                  <v-row dense>
                    <v-col cols="12" sm="8">
                      <validation-provider name="内容" rules="required|max:1000" v-slot="{ errors }">
                        <v-textarea
                          v-model="content"
                          :error-messages="errors"
                          color="teal"
                          outlined
                          rows="4"
                        >
                          <template v-slot:label>
                            <div>
                              内容
                            </div>
                          </template>
                        </v-textarea>
                      </validation-provider>
                    </v-col>
                  </v-row>
                  <v-btn class="mr-4" type="submit">書き込む</v-btn>
                </v-container>
              </v-form>
            <validation-observer>
          </template>
        </v-list>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>


export default {
  data: () => ({
      name: '',
      content: '',
      items: [
        {
          subtitle: "<span class='text--primary'>1:</span> やまだ",
          title:
            "I'll be in your neighborhood",
          action: '15min'
        },
        {
          subtitle: "<span class='text--primary'>2:</span> スズキ",
          title:
            "Wish I could come.",
          action: '15min'
        },
        {
          subtitle: "<span class='text--primary'>3:</span> 佐藤",
          title:
            "Do you have Paris recommendations",
          action: '15min'
        },
        {
          subtitle: "<span class='text--primary'>4:</span> アンドウ",
          title:
            "Do you want to hang out?",
          action: '15min'
        },
        {
          subtitle: "<span class='text--primary'>5:</span> 山本",
          title:
            "Do you see what time it is?",
          action: '15min'
        },
      ],

  }),
  methods: {
    onSubmit() {
      alert(this.content)
    }
  }
}

</script>

<style scoped>
v-list-item {
  display: flex;
}
v-list-item-action {
  align-self: stretch;
}
</style>