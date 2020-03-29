<template>
  <form class="needs-validation" novalidate @submit.prevent="createUser">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`users.${field.label}`) }}</label>
        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :required="field.required">

        <template v-if="field.type == 'radio'">
          <div class="custom-control custom-radio custom-control-inline" v-for="option in field.options">
            <input class="form-check-input" v-model="field.value" type="radio" :value="option.value">{{ $t(`users.${option.name}`) }}
          </div>
        </template>
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
  name: 'UserNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      formFields: {
        lastName: { col: '6', label: 'last_name', value: '', type: 'text', required: true },
        firstName: { col: '6', label: 'first_name', value: '', type: 'text', required: true },
        sex: { col: '6', label: 'sex', value: '', type: 'radio', options: [{ name: 'male', value: 'M' }, { name: 'female', value: 'F' }] },
        phone: { col: '6', label: 'phone', value: '', type: 'text' },
        mobilePhone: { col: '6', label: 'mobile_phone', value: '', type: 'text' },
        email: { col: '6', label: 'email', value: '', type: 'text', required: true },
        address: { col: '6', label: 'address', value: '', type: 'text' },
        invoiceAddress: { col: '6', label: 'invoice_address', value: '', type: 'text' }
      }
    };
  },
  methods: {
    createUser(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          user: {
            last_name: this.formFields.lastName.value,
            first_name: this.formFields.firstName.value,
            phone: this.formFields.phone.value,
            email: this.formFields.email.value
          }
        };

        this.$axios.post('/apis/users', newData)
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