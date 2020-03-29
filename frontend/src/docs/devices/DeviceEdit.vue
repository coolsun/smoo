<template>
  <form class="needs-validation" novalidate @submit.prevent="updateDevice">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`devices.${field.label}`) }}</label>

        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="!editMode" :required="field.required">

        <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required" :disabled="!editMode">
          <option v-for="option in field.options" :value="option.id">{{ option.name }}</option>
        </select>
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
  name: 'DeviceEdit',
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
        name: { col: '6', label: 'name', value: '', type: 'text', required: true },
        deviceModelID: { col: '6', label: 'device_model', value: '', type: 'select', options: [], required: true },
        parentDeviceID: { col: '6', label: 'parent_device', value: '', type: 'select', options: [] },
        locationID: { col: '6', label: 'location', value: '', type: 'select', options: [] }
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteDevice', show: 'showMode' },
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
      this.$axios.get(`/apis/devices/${this.editID}/edit`)
        .then(response => {
          this.formFields.name.value = response.data.device.name;
          this.formFields.deviceModelID.value = response.data.device.device_model_id;
          this.formFields.deviceModelID.options = response.data.device_models;
          this.formFields.parentDeviceID.value = response.data.device.parent_device_id;
          this.formFields.parentDeviceID.options = response.data.devices;
          this.formFields.locationID.value = response.data.device.location_id;
          this.formFields.locationID.options = response.data.locations;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateDevice(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          id: this.editID,
          device: {
            name: this.formFields.name.value,
            device_model_id: this.formFields.deviceModelID.value,
            location_id: this.formFields.locationID.value
          },
          parent_device_id: this.formFields.parentDeviceID.value
        };

        this.$axios.put(`/apis/devices/${this.editID}`, updateData)
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
    },
    deleteDevice() {
      if (self.confirm(this.$t('devices.delete_confirm'))) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/devices/${this.editID}`)
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