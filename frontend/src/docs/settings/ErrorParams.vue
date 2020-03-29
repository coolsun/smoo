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
  name: 'ErrorParams',
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
        inverter_late : { col: '3', label: 'inverter_late', value: '', type: 'text', required: true },
        inverter_late_ignore: { col: '3', label: 'inverter_late_ignore', value: '', type: 'text', options: [], required: true },
        inverter_pr_compare : { col: '3', label: 'inverter_pr_compare', value: '', type: 'text', options: [],required: true },
        inverter_pr_compare_ignore: { col: '3', label: 'inverter_pr_compare_ignore', value: '', type: 'text', options: [],required: true},
        mppt_power_high: { col: '3', label: 'mppt_power_high', value: '', type: 'text', options: [],required: true},
        mppt_power_high_ignore: { col: '3', label: 'mppt_power_high_ignore', value: '', type: 'text', options: [],required: true},
        breaker_temputure: { col: '3', label: 'breaker_temputure', value: '', type: 'text', options: [],required: true},
        leakage_i: { col: '3', label: 'leakage_i', value: '', type: 'text', options: [],required: true},
        leakage_time: { col: '3', label: 'leakage_time', value: '', type: 'text', options: [],required: true}
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