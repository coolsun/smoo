<template>
  <ModeTable v-bind="setting">
    <template v-for="tab in setting.tabs" #[tab.component]="props">
      <component :is="tab.component" v-bind="props"/>
    </template>
  </ModeTable>
</template>

<script>
import { ModeTable } from 'mdbvue';
import BoardNew from './BoardNew';
import SelectLocations from './SelectLocations';
import LocationsOrder from './LocationsOrder';
import BoardEdit from './BoardEdit';

export default {
  name: 'Board',
  components: {
    ModeTable,
    BoardNew,
    SelectLocations,
    LocationsOrder,
    BoardEdit
  },
  data() {
    return {
      setting: {
        langPath: 'boards',
        title: 'board_list',
        getData: this.getBoardsData,
        fields: [
          { name: "name" },
          { name: "count" },
          { name: "url", link: true }
        ],
        tabs: [
          { page: 'new', text: 'new_board', component: 'BoardNew' },
          { page: 'new', text: 'select_locations', component: 'SelectLocations' },
          { page: 'new', text: 'locations_order', component: 'LocationsOrder' },
          { page: 'edit', text: 'board_edit', component: 'BoardEdit' },
          { page: 'edit', text: 'select_locations', component: 'SelectLocations' },
          { page: 'edit', text: 'locations_order', component: 'LocationsOrder' }
        ]
      }
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    getBoardsData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/boards')
          .then(response => {
            resolve(response.data.boards.map(x => Object.assign(x, { url: `/boards/${x.id}` })));
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