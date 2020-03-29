<template>
  <form class="needs-validation" novalidate @submit.prevent="updateDetails">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`device_types.${field.label}`) }}</label>
        <input class="form-control" v-model="field.value" type="text" :disabled="!editMode" :required="field.required">
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
  name: 'DeviceTypeEdit',
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
        name: { col: '6', label: 'name', value: '', required: true },
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteDetails', show: 'showMode' },
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
    this.getDetailsInfo();
  },
  methods: {
    getDetailsInfo() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/device_types/${this.editID}/edit`)
        .then(response => {
          this.formFields.name.value = response.data.device_type.name;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateDetails(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          device_model: {
            name: this.formFields.name.value
          }
        };

        this.$axios.put(`/apis/device_types/${this.editID}`, updateData)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error);
            this.$store.commit('app/isLoading', false);
          });
      } else {
        event.target.classList.add('was-validated');
      };
    },
    deleteDetails() {
      if (self.confirm(this.$t('device_types.delete_confirm'))) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/device_types/${this.editID}`)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error.response.data.message);
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