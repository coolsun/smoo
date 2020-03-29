<template>
  <form id="edit-form" class="needs-validation" novalidate @submit.prevent="updatesettingparams">
    <mdbRow id="button-row"  >
      <template v-for="button in buttons[buttonMode]">
        <mdb-btn :type="button.type" size="sm" color="primary" @click="clickEvent(button.method, button.params)">
          <IconStack v-if="button.mixIcon" :iconsInfo="button.mixIcon"/>
        <mdbIcon v-else :icon="button.icon" size="2x"/>
      </mdb-btn>
        <mdbBtn v-show="editModel" type="submit" size="sm" color="primary">
          <mdbIcon icon="save" size="2x"/>
        </mdbBtn>
      </template>
    </mdbRow>
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`settings.${field.label}`) }}</label>
        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="disabledField" :required="field.required">
      </mdbCol>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack } from 'mdbvue';
export default {
  name: 'SettingParams',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack
  },
  data() {
    return {
      buttonMode: 'showMode',
      formFields: {
        node_had_commands : { col: '3', label: 'node_had_commands', value: '', type: 'text', required: true },
        node_had_devices: { col: '3', label: 'node_had_devices', value: '', type: 'text', options: [], required: true },
        device_had_locations : { col: '3', label: 'device_had_locations', value: '', type: 'text', options: [],required: true },
        error_check_cycle: { col: '3', label: 'error_check_cycle', value: '', type: 'text', options: [],required: true},
        power_emission_factor: { col: '3', label: 'power_emission_factor', value: '', type: 'text', options: [],required: true},
        effective_sunlight: { col: '3', label: 'effective_sunlight', value: '', type: 'text', options: [],required: true}
      },
      buttons: {
        showMode: [
          { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode' }
        ],
        editMode: [
          { icon: 'save', type: 'submit', params: 'showMode' },
          { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode' }
        ]
      },
      errMsg: ''
    };
  },
  computed: {
    disabledField() {
      return this.buttonMode != 'editMode';
    }
  },
  created() {
    this.getSettingParamsInfo();
  },
  methods: {
    getSettingParamsInfo() {
      // this.$store.commit('app/isLoading', true);
      //this.$axios.get(`/apis/roles/${this.editID}/edit`)
      //   .then(response => {
      //     this.formFields.name.value = response.data.role.name;
      //   })
      //   .catch(error => {
      //     this.errMsg = error.response.data.message;
      //   })
      //   .finally(() => {
      //     this.$store.commit('app/isLoading', false);
      //   });
    },
    changeButtonMode(mode) {
      this.buttonMode = mode;
    },
    clickEvent(method, params) {
      if (!method) return;
      
      this[method](params);
    }
  }
};
</script>