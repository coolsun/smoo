<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import SiteNew from './SiteNew';
import SiteEdit from './SiteEdit';
import DeviceNew from '../devices/DeviceNew.vue';

export default {
  name: 'Site',
  components: {
    ModeTable,
    SiteNew,
    SiteEdit,
    DeviceNew
  },
  data() {
    return {
      setting: {
        langPath: 'sites',
        title: 'site_list',
        getData: this.getSitesData,
        fields: [
          { name: "name" },
          { name: "code" },
          { name: "city" },
          { name: "locations" },
          { name: "status" }
        ],
        tabs: [
          { page: 'new', text: 'new_site', component: 'SiteNew' },
          { page: 'edit', text: 'site_info', component: 'SiteEdit' },
          { page: 'newDevice', text: 'new_device', component: 'DeviceNew' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getSitesData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/sites')
          .then(response => {
            resolve(response.data.sites);
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