<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import LocationNew from './LocationNew';
import LocationOverview from './LocationOverview';
import LocationEdit from './LocationEdit';
import LocationChartAnalysis from './LocationChartAnalysis';
import LocationDeviceTandem from './LocationDeviceTandem';
import LocationMppt from './LocationMppt';

export default {
  name: 'Location',
  components: {
    ModeTable,
    LocationNew,
    LocationOverview,
    LocationEdit,
    LocationChartAnalysis,
    LocationMppt,
    LocationDeviceTandem
  },
  data() {
    return {
      setting: {
        langPath: 'locations',
        title: 'location_list',
        light: true,
        modes: [
          { text: 'normal', getData: this.getLocationsData },
          { text: 'chart', getData: this.getLocationsChart }
        ],
        filters: [
          {
            field: 'city',
            value: 'all',
            options: [
              'all', 'taipei_city', 'new_taipei_city', 'taoyuan_city', 'hsinchu_city', 'hsinchu_county', 'miaoli_county', 'taichung_city', 'changhua_county',
              'yunlin_county', 'chiayi_city', 'chiayi_county', 'tainan_city', 'kaohsiung_city', 'pingtung_county', 'taitung_county', 'hualien_county',
              'yilan_county', 'keelung_city', 'penghu_county', 'kinmen_county', 'lianjiang_county'
            ]
          },
          {
            field: 'status',
            value: 'all',
            options: ['all', 'normal', 'warning', 'danger']
          }
        ],
        fields: [
          { name: 'code'},
          { name: 'name'},
          { name: 'city'},
          { name: 'daily_power'},
          { name: 'total_power'},
          { name: 'total_device'},
          { name: 'daily_kilowatt'},
          { name: 'now_pr'},
          { name: 'goal_pr'},
          { name: 'formate_time'}
        ],
        tabs: [
          { page: 'new', text: 'new_location', component: 'LocationNew' },
          { page: 'edit', text: 'location_overview', component: 'LocationOverview' },
          { page: 'edit', text: 'location_edit', component: 'LocationEdit' },
          { page: 'edit', text: 'location_chart_analysis', component: 'LocationChartAnalysis' },
          { page: 'edit', text: 'location_mppt', component: 'LocationMppt' },
          { page: 'edit', text: 'location_device_tandem', component: 'LocationDeviceTandem' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getLocationsData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/locations')
          .then(response => {
            resolve(response.data.locations);
          })
          .catch(error => {
            reject(error.response.data.message);
          })
          .finally(() => {
            this.$store.commit('app/isLoading', false);
          });
      });
    },
    getLocationsChart() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/locations/graphs')
          .then(response => {
            resolve(response.data.locations);
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