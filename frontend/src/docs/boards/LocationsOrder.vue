<template>
  <div class="container">
    <draggable v-model="locationsOrder" @start="drag=true" @end="drag=false">
      <mdbCard id="location-card" v-for="location in locationsOrder" :key="location.name">
        <mdbCardBody>
          {{location.name}}
        </mdbCardBody>
      </mdbCard>
    </draggable>

    <mdbRow id="button-row" end>
      <mdb-btn type="button" size="sm" color="primary" @click="saveLocationsOrder">
        <mdbIcon icon="save" size="2x"/>
      </mdb-btn>
    </mdbRow>
  </div>
</template>

<script>
import { mdbRow, mdbCard, mdbCardBody, mdbBtn, mdbIcon, IconStack } from 'mdbvue';
import draggable from 'vuedraggable';

export default {
  name: 'SelectLocations',
  components: {
    mdbRow,
    mdbCard,
    mdbCardBody,
    mdbBtn,
    mdbIcon,
    IconStack,
    draggable
  },
  data() {
    return {
      locationsOrder: []
    };
  },
  computed: {
    editID() {
      return this.$store.state.modeTable.editID;
    }
  },
  created() {
    this.getLocationsOrder();
  },
  watch: {
    locationsOrder(val) {
      val.forEach((location, index) => {
        location.index = index;
      });
    }
  },
  methods: {
    getLocationsOrder() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/boards/${this.editID}/edit_locations_order`)
        .then(response => {
          this.locationsOrder = response.data.board.locations.sort((a, b) => {
            return a.index - b.index;
          });
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    saveLocationsOrder() {
      this.$store.commit('app/isLoading', true);

      var updateData = {
        board: {
          locations: this.locationsOrder
        }
      };

      this.$axios.put(`/apis/boards/${this.editID}/update_locations_order`, updateData)
        .then(() => {
          self.location.reload();
        })
        .catch(error => {
          console.log(error.response.data.message);
          this.$store.commit('app/isLoading', false);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
#location-card {
  margin-top: 15px;
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