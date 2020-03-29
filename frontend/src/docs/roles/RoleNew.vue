<template>
  <form class="needs-validation" novalidate @submit.prevent="createRole">
    <mdbRow>
      <mdbCol class="form-group" col="12" md="6">
        <label>* {{ $t('roles.name') }}</label>
        <input v-model="roleName" type="text" class="form-control" required>
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
      roleName: null
    };
  },
  methods: {
    createRole(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          role: {
            name: this.roleName
          }
        };

        this.$axios.post('/apis/role', newData)
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