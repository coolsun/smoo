<template>
  <form class="needs-validation" novalidate @submit.prevent="createDeviceModel">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`device_models.${field.label}`) }}</label>
        <input class="form-control" v-model="field.value" type="text" :required="field.required">
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
  name: 'DeviceModelNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      formFields: {
        name: { col: '6', label: 'name', value: '', required: true },
        normalizeJson: { col: '6', label: 'normalize_json', value: '', required: true },
        normalizeFunction: { col: '6', label: 'normalize_function', value: '', required: true },
      }
    };
  },
  methods: {
    createDeviceModel(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          device_model: {
            name: this.formFields.name.value,
            normalize_json: this.formFields.normalizeJson.value,
            normalize_function: this.formFields.normalizeFunction.value
          }
        };

        this.$axios.post('/apis/device_models', newData)
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