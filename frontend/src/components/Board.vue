<template>
  <v-row justify="center">
    <v-col cols="12">
      <v-card>
        <v-toolbar color="grey lighten-3">
            <v-toolbar-title>{{ topic.title }}
            <template v-for="(category, index) in categories">
              <v-chip class="ma-2" :key="index">{{ category.name }}</v-chip>
            </template>
          </v-toolbar-title>
        </v-toolbar>

        <v-list two-line>
          <template v-for="(comment, index) in comments">

            <v-list-item
              :key="index"
            >
              <v-list-item-content>
                <v-list-item-subtitle inset class="mb-4"><span class='text--primary'>{{ index + 1 }}： </span>{{ comment.name }}<span>：{{ comment.created_at | moment }}</span></v-list-item-subtitle>
                <v-list-item-title v-html="comment.content" inset></v-list-item-title>
              </v-list-item-content>

              <v-list-item-action
               :key="index"
              >
                <v-list-item-action-text></v-list-item-action-text>
              </v-list-item-action>
            </v-list-item>

            <v-divider
            v-if="index + 1 <= comments.length"
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
                      <validation-provider name="名前" rules="max:10" v-slot="{ errors }">
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
import axios from 'axios'
import moment from 'moment';
moment.lang('ja', {
    weekdaysShort: ["日","月","火","水","木","金","土"],
});

export default {
  props: ['topic'],
  data: () => ({
      name: '',
      content: '',
      comments: null,
      categories: null
  }),
  mounted () {
    axios
      .get('/api/v1/topics/' + this.topic.id)
      .then(response => {
        console.log(response)
        this.comments = response.data.data
      })
      .catch(error => console.log(error))
    axios
      .get('/api/v1/topic_categories/' + this.topic.id)
      .then(response => {
        this.categories = response.data.data
      })
      .catch(error => console.log(error))
  },
  methods: {
    onSubmit() {
      axios
        .post('/api/v1/comments', {
          topic_id: this.topic.id,
          name: this.name,
          content: this.content
        })
        .then(response => {
          console.log(response)
          this.comments.push(response.data.data)
          this.name = '';
          this.content = '';
          this.errors.clear();
        })
        .catch(error => alert(error))
    }
  },
  filters: {
    moment: function (date) {
      return moment(date).format('YYYY/MM/DD(ddd) HH:mm:ss');
    }
  },
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