<template>
  <form>
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ $t(`locations.${field.label}`) }}</label>
        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="true">

        <!-- <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required" :disabled="field.disabled || !editMode">
          <option v-for="option in field.options" :value="option.id">{{ option.name }}</option>
        </select> -->
      </mdbCol>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol } from 'mdbvue';

export default {
  name: 'LocationOverview',
  components: {
    mdbRow,
    mdbCol
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      formFields: {
        name: { col: '6', label: 'name', value: '', type: 'text' },
        nowPr: { col: '6', label: 'now_pr', value: '', type: 'text' },
        goalPr: { col: '6', label: 'goal_pr', value: '', type: 'text' },
        dailyKilowatt: { col: '6', label: 'daily_kilowatt', value: '', type: 'text' },
        sunshine: { col: '6', label: 'sunshine', value: '', type: 'text' },
        temperature: { col: '6', label: 'temperature', value: '', type: 'text' },
        windSpeed: { col: '6', label: 'wind_speed', value: '', type: 'text' },
        power: { col: '6', label: 'power', value: '', type: 'text' },
        dailyPower: { col: '6', label: 'daily_power', value: '', type: 'text' },
        dailyElectricitySale: { col: '6', label: 'daily_electricity_sale', value: '', type: 'text' },
        totalPower: { col: '6', label: 'total_power', value: '', type: 'text' },
        saleElectricityPrice: { col: '6', label: 'sale_electricity_price', value: '', type: 'text' },
        co2Reduction: { col: '6', label: 'co2_reduction', value: '', type: 'text' },
        totalDevice: { col: '6', label: 'total_device', value: '', type: 'text' }
      }
    };
  },
  created() {
    this.getBaseInfo();
  },
  methods: {
    getBaseInfo() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/locations/${this.editID}/edit`) 
        .then(response => {
          this.formFields.name.value = response.data.location.name;
          this.formFields.nowPr.value = response.data.location.now_pr;
          this.formFields.goalPr.value = response.data.location.goal_pr;
          this.formFields.dailyKilowatt.value = response.data.location.daily_kilowatt;
          this.formFields.dailyPower.value = response.data.location.daily_power;
          this.formFields.totalPower.value = response.data.location.total_power;
          this.formFields.totalDevice.value = response.data.location.total_device;
          this.formFields.sunshine.value = response.data.location.sunshine;
          this.formFields.temperature.value = response.data.location.temperature;
          this.formFields.windSpeed.value = response.data.location.wind_speed;
          this.formFields.dailyElectricitySale.value = response.data.location.daily_electricity_sale;
          this.formFields.saleElectricityPrice.value = response.data.location.sale_electricity_price;
          this.formFields.co2Reduction.value = response.data.location.co2_reduction;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    }
  }
};
</script>>