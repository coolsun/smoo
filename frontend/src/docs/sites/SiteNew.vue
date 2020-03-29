<template>
  <form class="needs-validation" novalidate @submit.prevent="createSite">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`sites.${field.label}`) }}</label>
        <input class="form-control"v-if="field.type == 'text'" v-model="field.value" type="text" :required="field.required">
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
  name: 'SiteNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      formFields: {
        name: { col: '6', label: 'name', value: '', type: 'text', required: true }
      }
    };
  },
  methods: {
    createSite(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          site: {
            name: this.formFields.name.value
          }
        };

        this.$axios.post('/apis/sites', newData)
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
