<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
       <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import DeviceTypeNew from './DeviceTypeNew.vue';
import DeviceTypeDetails from './DeviceTypeDetails.vue';
import DeviceNormalizationProperties from './DeviceNormalizationProperties.vue';

export default {
  name: 'DeviceType',
  components: {
    ModeTable,
    DeviceTypeNew,
    DeviceTypeDetails,
    DeviceNormalizationProperties
  },
  data() {
    return {
      setting: {
        langPath: 'device_types',
        title: 'device_types_list',
        getData: this.getDeviceTypesData,
        fields: [
          { name: "name" }
        ],
        tabs: [
          { page: 'new', text: 'new_device_type', component: 'DeviceTypeNew' },
          { page: 'edit', text: 'type_details', component: 'DeviceTypeDetails' },
          { page: 'edit', text: 'normalization_properties', component: 'DeviceNormalizationProperties' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getDeviceTypesData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/device_types')
          .then(response => {
            resolve(response.data.device_types);
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