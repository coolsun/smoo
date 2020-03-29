<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import UserNew from './UserNew';
import UserRole from './UserRole';
import UserEdit from './UserEdit';

export default {
  name: 'User',
  components: {
    ModeTable,
    UserNew,
    UserRole,
    UserEdit
  },
  data() {
    return {
      setting: {
        langPath: 'users',
        title: 'user_list',
        getData: this.getUsersData,
        fields: [
          { mix: 'full_name', name: 'last_name' },
          { mix: 'full_name', name: 'first_name' },
          { name: 'sex' },
          { name: 'email' }
        ],
        tabs: [
          { page: 'new', text: 'new_user', component: 'UserNew' },
          { page: 'new', text: 'role', component: 'UserRole' },
          { page: 'edit', text: 'user_info', component: 'UserEdit' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getUsersData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/users')
          .then(response => {
            resolve(response.data.users);
          })
          .catch(error => {
            reject(error.response.data.message);
          })
          .finally(() => {
            this.$store.commit('app/isLoading', false);
          });
      });
    }
  }
};
</script>