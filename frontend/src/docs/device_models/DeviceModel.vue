<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import DeviceModelNew from './DeviceModelNew.vue';
import DeviceModelDetails from './DeviceModelDetails.vue';
import DeviceModelProperties from './DeviceModelProperties.vue';

export default {
  name: 'DeviceModel',
  components: {
    ModeTable,
    DeviceModelNew,
    DeviceModelDetails,
    DeviceModelProperties
  },
  data() {
    return {
      setting: {
        langPath: 'device_models',
        title: 'device_model_list',
        getData: this.getDeviceModelsData,
        fields: [
          { name: "name" },
          { name: "normalize_json" },
          { name: "normalize_function" }
        ],
        tabs: [
          { page: 'new', text: 'new_device_model', component: 'DeviceModelNew' },
          { page: 'edit', text: 'details', component: 'DeviceModelDetails' },
          { page: 'edit', text: 'properties', component: 'DeviceModelProperties' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getDeviceModelsData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/device_models')
          .then(response => {
            resolve(response.data.device_models);
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