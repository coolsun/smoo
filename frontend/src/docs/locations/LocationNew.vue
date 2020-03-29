<template>
  <form class="needs-validation" novalidate @submit.prevent="createLocation">
    <mdbRow>
      <mdbCol class="form-group" col="12" md="6">
        <label>* {{ $t('locations.name') }}</label>
        <input v-model="locationName" type="text" class="form-control" required>
      </mdbCol>
    </mdbRow>

    <mdbRow id="button-row">
      <mdbBtn type="submit" size="sm" color="primary">
        <mdbIcon icon="plus" size="2x"/>
      </mdbBtn>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon } from 'mdbvue';

export default {
  name: 'LocationNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      locationName: null
    };
  },
  methods: {
    createLocation(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          location: {
            name: this.locationName
          }
        };

        this.$axios.post('/apis/locations', newData)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error.response.data.message);
            this.$store.commit('app/isLoading', false);
          });
      } else {
        event.target.classList.add('was-validated');
      };
    }
  }
};
</script>

<style lang="scss" scoped>
form {
  margin-top: 10px;
  margin-left: 15px;
}

#button-row {
  position: absolute;
  right: 40px;
  bottom: 15px;
}
</style>