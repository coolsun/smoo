<template>
  <form class="needs-validation" novalidate @submit.prevent="updateProperties">
    <mdbRow v-show="editMode || dataArray.length >= 1">
      <mdbCol col="12" md="2">
        <label>{{ $t('device_models.name') }}</label>
      </mdbCol>

      <mdbCol col="2">
        <label>{{ $t('device_models.type') }}</label>
      </mdbCol>

      <mdbCol col="2">
        <label>{{ $t('device_models.unit') }}</label>
      </mdbCol>

      <mdbCol col="1">
        <label>{{ $t('device_models.gain') }}</label>
      </mdbCol>

      <mdbCol col="2">
        <label>{{ $t('device_models.address') }}</label>
      </mdbCol>

      <mdbCol col="1">
        <label>{{ $t('device_models.quantity') }}</label>
      </mdbCol>

      <mdbCol col="1">
        <label>{{ $t('device_models.count') }}</label>
      </mdbCol>
    </mdbRow>

    <mdbRow v-for="(property, index) in dataArray" :key="index" v-if="property._destroy != '1'">
      <mdbCol class="form-group" col="2">
        <input class="form-control" type="text" v-model="property.name" required :disabled="!editMode">
      </mdbCol>

      <mdbCol class="form-group" col="2">
        <select class="form-control" v-model="property.kind" required :disabled="!editMode">
          <option value="" selected hidden>{{ $t('device_models.choose_one') }}</option>
          <option v-for="type in typeOptions" :value="type">{{ type }}</option>
        </select>
      </mdbCol>

      <mdbCol class="form-group" col="2">
        <select class="form-control" v-model="property.unit" required :disabled="!editMode">
          <option value="" selected hidden>{{ $t('device_models.choose_one') }}</option>
          <option v-for="unit in unitOptions" :value="unit">{{ unit }}</option>
        </select>
      </mdbCol>

      <mdbCol class="form-group" col="1">
        <input class="form-control" type="text" v-model="property.gain" required :disabled="!editMode">
      </mdbCol>

      <mdbCol class="form-group" col="2">
        <input class="form-control" type="text" v-model="property.address" required :disabled="!editMode">
      </mdbCol>

      <mdbCol class="form-group" col="1">
        <input class="form-control" type="text" v-model="property.quantity" required :disabled="!editMode">
      </mdbCol>

      <mdbCol class="form-group" col="1">
        <input class="form-control" type="text" v-model="property.count" required :disabled="!editMode">
      </mdbCol>

      <mdbCol v-show="editMode" class="form-group" col="2">
        <mdbBtn type="button" size="sm" color="primary" icon="minus" @click="removeProperty(index)"/>
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
import { mdbRow, mdbCol, mdbBtn, mdbIcon, mdbInput, IconStack } from 'mdbvue';

export default {
  name: 'DeviceModelProperties',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    mdbInput,
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
      dataArray: [],
      removeArray: [],
      typeOptions: [],
      unitOptions: [],
      buttons: [
        { icon: 'trash-alt', type: 'button', show: 'showMode' },
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'plus', type: 'button', method: 'addProperty', show: 'editMode' },
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
    this.getPropertiesInfo();
  },
  updated() {
    this.$store.dispatch('app/setModalHeight');
  },
  methods: {
    getPropertiesInfo() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/device_models/${this.editID}/get_properties`)
        .then(response => {
          this.dataArray = response.data.device_model_properties;
          this.typeOptions = response.data.properties_kinds;
          this.unitOptions = response.data.properties_units;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    addProperty() {
      this.dataArray.push({name: '', kind: ''});
    },
    removeProperty(index) {
      var removeData = this.dataArray[index];
      removeData._destroy = '1';

      if (removeData.id) this.removeArray.push(removeData);
      this.dataArray.splice(index, 1);
    },
    updateProperties(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          device_model: {
            device_model_properties_attributes: this.dataArray.concat(this.removeArray)
          }
        };

        this.$axios.put(`/apis/device_models/${this.editID}/update_properties`, updateData)
          .then(() => {
            location.reload();
          })
          .catch(error => {
            console.log(error.response.data.message);
          })
          .finally(() => {
            this.$store.commit('app/isLoading', false);
          });
      } else {
        event.target.classList.add('was-validated');
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

  .form-group {
    height: 50px;
    display: flex;

    label {
      margin: auto 10px;
      white-space: nowrap;
    }

    input, select {
      margin: auto;
    }
  }

  .btn {
    width: 4.5rem;
  }
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