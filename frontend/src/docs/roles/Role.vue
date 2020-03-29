<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import RoleNew from './RoleNew';
import RoleEdit from './RoleEdit';
import RolePermissions from './RolePermissions';

export default {
  name: 'Role',
  components: {
    ModeTable,
    RoleNew,
    RoleEdit,
    RolePermissions
  },
  data() {
    return {
      setting: {
        langPath: 'roles',
        title: 'role_list',
        getData: this.getRolesData,
        fields: [
          { name: 'name' },
          { name: 'users' },
          { name: 'site' }
        ],
        tabs: [
          { page: 'new', text: 'role_new', component: 'RoleNew' },
          { page: 'edit', text: 'role_edit', component: 'RoleEdit' },
          { page: 'edit', text: 'role_permissions', component: 'RolePermissions' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getRolesData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/roles')
          .then(response => {
            resolve(response.data.roles);
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