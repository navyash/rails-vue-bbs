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
              sm9
              md6
            >
              <v-card class="elevation-12">
                <v-toolbar
                  color="navy"
                  dark
                  flat
                >
                  <v-toolbar-title>新規掲示板作成</v-toolbar-title>
                  <v-spacer></v-spacer>
                </v-toolbar>
                <v-card-text>
                  <validation-observer v-slot="{ handleSubmit }">
                    <v-form @submit.prevent="handleSubmit(onSubmit)">
                      <v-container :class="grid-list-xs">
                        <v-row dense style="height:65px">
                          <v-col
                            cols="10"
                          >
                            <validation-provider name="掲示板の名前" rules="required" v-slot="{ errors }">
                              <v-text-field
                                label="掲示板の名前"
                                v-model="title"
                                :error-messages="errors"
                                outlined
                                dense
                              >
                              </v-text-field>
                            </validation-provider>
                          </v-col>
                        </v-row>
                        <v-row dense>
                          <v-col cols="12" sm="6">
                            <v-select
                              v-model="selectCategorie"
                              :items="categories"
                              item-text="name"
                              item-value="id"
                              label="Select"
                              multiple
                              chips
                              hint="カテゴリを選択してください（複数選択可）"
                              persistent-hint
                            ></v-select>
                          </v-col>
                        </v-row>
                        <v-row dense style="height:65px">
                          <v-col
                            cols="6"
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
                          <v-col cols="12" sm="10">
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
                </v-card-text>
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
      selectCategorie: [],
      categories: [],
      title: '',
      name: '',
      content: '',
      topicId: ''
  }),
  mounted () {
    axios
      .get('/api/v1/categories')
      .then(response => {
        this.categories = response.data.data
      })
      .catch(error => console.log(error))
  },
  methods: {
    onSubmit() {
      axios
        .post('/api/v1/topics', {
          title: this.title,
          category_ids: this.selectCategorie,
        })
        .then(response => {
            console.log(response)
            if (response.status == 200){
              this.topicId = response.data.data.id
              axios
                .post('/api/v1/comments', {
                  topic_id: this.topicId,
                  name: this.name,
                  content: this.content,
                })
                .then(response => {
                  if (response.status == 200){
                    this.$router.push('/')
                  }
                })
                .catch(error => alert(error))
            }
        })
        // .catch(alert('スレッドの作成に失敗しました。'))
      }
    }
  }
</script>