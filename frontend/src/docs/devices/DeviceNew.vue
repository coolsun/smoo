<template>
  <form class="needs-validation" novalidate @submit.prevent="createDevice">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`devices.${field.label}`) }}</label>

        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :required="field.required">

        <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required">
          <option v-for="option in field.options" :value="option.id">{{ option.name }}</option>
        </select>
      </mdbCol>
    </mdbRow>

    <input id="excel-file" type="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" hidden @change="uploadFile">

    <mdbRow id="button-row">
      <mdbBtn type="button" size="sm" color="primary" @click="uploadExcel">
        <mdbIcon icon="upload" size="2x"/>
      </mdbBtn>
      <mdbBtn type="submit" size="sm" color="primary">
        <mdbIcon icon="plus" size="2x"/>
      </mdbBtn>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon } from 'mdbvue';

export default {
  name: 'DeviceNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      formFields: {
        name: { col: '6', label: 'name', value: '', type: 'text', required: true },
        deviceModelID: { col: '6', label: 'device_model', value: '', type: 'select', options: [], required: true },
        parentDeviceID: { col: '6', label: 'parent_device', value: '', type: 'select', options: [] },
        locationID: { col: '6', label: 'location', value: '', type: 'select', options: [] }
      }
    };
  },
  created() {
    this.getFormData();
  },
  methods: {
    getFormData() {
      this.$axios.get('/apis/devices/new')
        .then(response => {
          this.formFields.deviceModelID.options = response.data.device_models;
          this.formFields.parentDeviceID.options = response.data.devices;
          this.formFields.locationID.options = response.data.locations;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    createDevice(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          device: {
            name: this.formFields.name.value,
            device_model_id: this.formFields.deviceModelID.value,
            location_id: this.formFields.locationID.value
          },
          parent_device_id: this.formFields.parentDeviceID.value
        };

        this.$axios.post('/apis/devices', newData)
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
    uploadExcel() {
      document.getElementById('excel-file').click();
    },
    uploadFile(event) {
      var uploadData = new FormData();

      uploadData.append('upload_xlsx', event.target.files[0]);

      this.$axios.post('/apis/devices/upload_new_device', uploadData)
        .then(response => {
          console.log(response.data.message);
        })
        .catch(error => {
          console.log(error.response.data.message);
        });
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