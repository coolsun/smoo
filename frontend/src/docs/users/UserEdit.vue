<template>
  <form class="needs-validation" novalidate @submit.prevent="updateUser">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`users.${field.label}`) }}</label>
        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="!editMode" :required="field.required">

        <template v-if="field.type == 'radio'">
          <div class="custom-control custom-radio custom-control-inline" v-for="option in field.options">
            <input class="form-check-input" v-model="field.value" type="radio" :value="option.value" :disabled="!editMode">{{ $t(`users.${option.name}`) }}
          </div>
        </template>
      </mdbCol>
    </mdbRow>

    <mdbRow id="button-row">
      <template v-for="btn in buttons">
        <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
          <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack } from 'mdbvue';

export default {
  name: 'UserEdit',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      buttonMode: 'showMode',
      formFields: {
        lastName: { col: '6', label: 'last_name', value: '', type: 'text', required: true },
        firstName: { col: '6', label: 'first_name', value: '', type: 'text', required: true },
        sex: { col: '6', label: 'sex', value: '', type: 'radio', options: [{ name: 'male', value: 'M' }, { name: 'female', value: 'F' }] },
        phone: { col: '6', label: 'phone', value: '', type: 'text' },
        mobilePhone: { col: '6', label: 'mobile_phone', value: '', type: 'text' },
        email: { col: '6', label: 'email', value: '', type: 'text', required: true },
        address: { col: '6', label: 'address', value: '', type: 'text' },
        invoiceAddress: { col: '6', label: 'invoice_address', value: '', type: 'text' }
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteUser', show: 'showMode' },
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'save', type: 'submit', show: 'editMode' },
        { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode', show: 'editMode' }
      ]
    };
  },
  computed: {
    showMode() {
      return this.buttonMode == 'showMode';
    },
    editMode() {
      return this.buttonMode == 'editMode';
    }
  },
  created() {
    this.getBaseInfo();
  },
  methods: {
    getBaseInfo() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/users/${this.editID}/edit`)
        .then(response => {
          this.formFields.lastName.value = response.data.user.last_name;
          this.formFields.firstName.value = response.data.user.first_name;
          this.formFields.phone.value = response.data.user.phone;
          this.formFields.email.value = response.data.user.email;
        })
        .catch(error => {
          console.log(error.response.data);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateUser(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          user: {
            last_name: this.formFields.lastName.value,
            first_name: this.formFields.firstName.value,
            phone: this.formFields.phone.value,
            email: this.formFields.email.value
          }
        };

        this.$axios.put(`/apis/users/${this.editID}`, updateData)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error);
            this.$store.commit('app/isLoading', false);
          });
      } else {
        event.target.classList.add('was-validated');
      }
    },
    deleteUser() {
      if (self.confirm(this.$t('users.delete_confirm'))) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/users/${this.editID}`)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error);
            this.$store.commit('app/isLoading', false);
          });
      };
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

#button-row {
  position: absolute;
  right: 40px;
  bottom: 15px;

  .btn {
    width: 5.5rem;
  }
}
</style>