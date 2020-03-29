<template>
  <div class="container">
    <mdbRow class="custom-control custom-radio" v-for="option in locationOptions" :key="option.location_id">
      <input class="form-check-input" type="checkbox" v-model="selectedLocations" :value="option.location_id" :disabled="disableInput">{{ option.name }}
    </mdbRow>

    <mdbRow id="button-row" end>
      <template v-for="btn in buttons">
        <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
          <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
    </mdbRow>
  </div>
</template>

<script>
import { mdbRow, mdbBtn, mdbIcon, IconStack } from 'mdbvue';

export default {
  name: 'SelectLocations',
  components: {
    mdbRow,
    mdbBtn,
    mdbIcon,
    IconStack
  },
  data() {
    return {
      buttonMode: 'showMode',
      locationOptions: [],
      selectedLocations: [],
      newPageButtons: [
        { icon: 'arrow-circle-right', type: 'button', method: 'updateSelectedLocations' }
      ],
      editPageButtons: [
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'save', type: 'button', method: 'updateSelectedLocations', show: 'editMode' },
        { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode', show: 'editMode' }
      ]
    };
  },
  computed: {
    currentPage() {
      return this.$store.state.modeTable.currentPage;
    },
    editID() {
      return this.$store.state.modeTable.editID;
    },
    showMode() {
      return this.buttonMode == 'showMode';
    },
    editMode() {
      return this.buttonMode == 'editMode';
    },
    buttons() {
      return this.currentPage == 'new' ? this.newPageButtons : this.editPageButtons;
    },
    disableInput() {
      return this.currentPage == 'edit' && this.showMode;
    }
  },
  created() {
    this.getLocationOptions();
  },
  methods: {
    getLocationOptions() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/boards/${this.editID}/edit_locations`)
        .then(response => {
          this.locationOptions = response.data.board.locations;
          this.selectedLocations = response.data.board.locations.filter(x => x.selected).map(x => x.location_id);
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateSelectedLocations() {
      this.$store.commit('app/isLoading', true);

      var updateData = {
        board: {
          locations: this.locationOptions.map(option => {
            var locationIndex = this.selectedLocations.findIndex(x => x == option.location_id);

            return {
              location_id: option.location_id,
              selected: locationIndex >= 0,
              index: locationIndex == -1 ? null : locationIndex
            };
          })
        }
      };

      this.$axios.put(`/apis/boards/${this.editID}/update_locations`, updateData)
        .then(() => {
          this.$store.commit('app/isLoading', false);
          if (this.currentPage == 'new') this.$store.commit('modeTable/goToTab', 'next');
        })
        .catch(error => {
          console.log(error.response.data.message);
          this.$store.commit('app/isLoading', false);
        });
    },
    goToTab(action) {
      this.$store.commit('modeTable/goToTab', action);
    },
    changeButtonMode(mode) {
      this.buttonMode = mode;
    },
    showButton(showCondition) {
      if (showCondition) {
        var show = [];

        showCondition.split(', ').forEach(element => {
          show.push(this[element]);
        });

        return !show.includes(false);
      }

      return true;
    },
    clickEvent(method, params) {
      if (method) {
        this[method](params);
      }
    }
  }
};
</script>

<style lang="scss" scoped>
form {
  margin-top: 10px;
  margin-left: 15px;
}

.custom-radio {
  margin: 15px 0px;
}

#button-row {
  .btn {
    width: 5.5rem;
  }
}

#button-row.right-bottom {
  position: absolute;
  right: 40px;
  bottom: 15px;
}
</style>