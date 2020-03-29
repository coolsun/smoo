<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import DeviceNew from './DeviceNew.vue';
import DeviceEdit from './DeviceEdit.vue';

export default {
  name: 'Device',
  components: {
    ModeTable,
    DeviceNew,
    DeviceEdit
  },
  data() {
    return {
      setting: {
        langPath: 'devices',
        title: 'device_list',
        getData: this.getDevicesData,
        fields: [
          { name: 'name' },
          { name: 'device_model' },
          { name: 'location_name' }
        ],
        tabs: [
          { page: 'new', text: 'new_device', component: 'DeviceNew' },
          { page: 'edit', text: 'device_info', component: 'DeviceEdit' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getDevicesData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/devices')
          .then(response => {
            resolve(response.data.devices);
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