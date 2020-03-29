<template>
  <form class="needs-validation" novalidate @submit.prevent="updateLocation">
    <span class="dot" :style="lightColor"></span>
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`locations.${field.label}`) }}</label>

        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="field.disabled || !editMode" :required="field.required">

        <input class="form-control" v-if="field.type == 'date'" v-model="field.value" type="date" :disabled="field.disabled || !editMode" :required="field.required">

        <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required" :disabled="field.disabled || !editMode">
          <option v-for="option in field.options" :value="option.id">{{ option.name }}</option>
        </select>

      </mdbCol>
    </mdbRow>
    
    <mdbRow>
      <mdbCol class="form-group" col="6">
        <label>{{ $t(`locations.map`) }}</label>
        <mdbGoogleMap
          :key="lngAndLat"
          name="reg"
          :zoom="14"
          :markerCoordinates="[{
            latitude: formFields.longitude.value, //24.1588663,
            longitude: formFields.latitude.value  //120.6468876
          }]">
        </mdbGoogleMap>
      </mdbCol>
    </mdbRow>

    <mdbRow>
      <mdbCol class="form-group" col="6">
        <label>{{ $t(`locations.photo`) }}</label>
        <input  type="file" accept="image/jpeg,image/jpg,image/png" @change="updatePhoto" :disabled="!editMode" >
        <canvas width="250" height="250"></canvas>
      </mdbCol>
    </mdbRow>


    <mdbRow id="button-row" end>
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
import { mdbRow, mdbCol, mdbBtn, mdbIcon, mdbGoogleMap, IconStack } from 'mdbvue';

export default {
  name: 'LocationEdit',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    mdbGoogleMap,
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
      status: '',
      image: null,
      // geocoder: null,
      formFields: {
        code: { col: '6', label: 'code', value: '', type: 'text', disabled: true },
        name: { col: '6', label: 'name', value: '', type: 'text', required: true },
        contactName: { col: '6', label: 'contact_name', value: '', type: 'text' },
        phone: { col: '6', label: 'phone', value: '', type: 'text' },
        city: { col: '6', label: 'address_city', value: '', type: 'text' },
        area: { col: '6', label: 'address_area', value: '', type: 'text' },
        road: { col: '6', label: 'address_road', value: '', type: 'text' },
        goalPr: { col: '6', label: 'goal_pr', value: '', type: 'text' },
        meterDate: { col: '6', label: 'meter_date', value: '', type: 'date' },
        defaultRate: { col: '6', label: 'default_rate', value: '', type: 'text' },
        lineLossRate: { col: '6', label: 'line_loss_rate', value: '', type: 'text' },
        announcementAverageSunshine: { col: '6', label: 'announcement_average_sunshine', value: '', type: 'text' },
        recentInspectDate:{col: '6', label: 'recent_inspect_date', value: '', type: 'date'},
        nextInspectDate:{col: '6', label: 'next_inspect_date', value: '', type: 'date'},
        module: { col: '6', label: 'module', value: '', type: 'select' },
        model: { col: '6', label: 'model', value: '', type: 'select' },
        totalVoltage: { col: '6', label: 'total_voltage', value: '', type: 'text', disabled: true },
        totalCurrent: { col: '6', label: 'total_current', value: '', type: 'text', disabled: true },
        note: { col: '6', label: 'note', value: '', type: 'text' },
        longitude: { col: '6', label: 'longitude', value: '', type: 'text' },
        latitude: { col: '6', label: 'latitude', value: '', type: 'text' }
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteLocation', show: 'showMode' },
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
    },
    lightColor() {
      var lightsData = {
        normal: '#00d036',
        warning: '#f5f74c',
        danger: '#ff2300'
      };

      return lightsData[this.status] ? `background-color: ${lightsData[this.status]}` : '';
    },
    lngAndLat() {
      return `${this.formFields.longitude.value}, ${this.formFields.latitude.value}`;
    }
  },
  watch: {
    image() {
      this.getPhoto();
    }
  },
  created() {
    this.getBaseInfo();
  },
  // mounted() {
  //   this.initGeocoder();
  //   this.geocode();
  // },
  methods: {
    getBaseInfo() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/locations/${this.editID}/edit`)
        .then(response => {
          this.status = response.data.location.status;
          this.formFields.code.value = response.data.location.code;
          this.formFields.name.value = response.data.location.name;
          this.formFields.contactName.value = response.data.location.contact_name;
          this.formFields.city.value = response.data.location.city;
          this.formFields.area.value = response.data.location.area;
          this.formFields.road.value = response.data.location.road;
          this.formFields.longitude.value = response.data.location.longitude;
          this.formFields.latitude.value = response.data.location.latitude;
          this.formFields.goalPr.value = response.data.location.goalPr;
          this.formFields.meterDate.value = response.data.location.meter_date;
          this.formFields.defaultRate.value = response.data.location.default_rate;
          this.formFields.lineLossRate.value = response.data.location.line_loss_rate;
          this.formFields.announcementAverageSunshine.value = response.data.location.announcement_average_sunshine;
          this.formFields.recentInspectDate.value = response.data.location.recent_inspect_date;
          this.formFields.nextInspectDate.value = response.data.location.next_inspect_date;
          this.formFields.module.value = response.data.location.module;
          this.formFields.model.value = response.data.location.model;
          this.formFields.totalVoltage.value = response.data.location.total_voltage;
          this.formFields.totalCurrent.value = response.data.location.total_current;
          this.formFields.note.value = response.data.location.note;
          this.image = 'http://scloud.trillioninnovations.com/' + response.data.location.photo;
          console.log(this.image);
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    // initGeocoder() {
    //   this.geocoder = new google.maps.Geocoder();
    // },
    // geocode() {
    //   this.geocoder.geocode(
    //     {
    //       address: "台中市西屯區大隆路167號",
    //       componentRestrictions: {
    //         country: "TW"
    //       }
    //     }, (results, status) => {
    //       if (status === "OK") {
    //         this.formFields.latitude.value = results[0].geometry.location.lat();
    //         this.formFields.longitude.value = results[0].geometry.location.lng();
    //       } else {
    //         console.log(status);
    //       }
    //     }
    //   );
    // },
    updateLocation(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          location: {
            name: this.formFields.name.value,
            city: this.formFields.city.value,
            area: this.formFields.area.value,
            road: this.formFields.road.value,
            longitude: this.formFields.longitude.value,
            latitude: this.formFields.latitude.value,
            // daily_power: this.formFields.daily_power.value,
            // total_power: this.formFields.total_power.value,
            // total_device: this.formFields.total_device.value,
            // daily_kilowatt: this.formFields.daily_kilowatt.value,
            // pr: this.formFields.pr.value,
            // updated_at: this.formFields.updated_at.value,
            // sunshine: this.formFields.sunshine.value,
            // temperature: this.formFields.temperature.value,
            // wind_speed: this.formFields.wind_speed.value,
            // daily_cumulative_sunshine: this.formFields.daily_cumulative_sunshine.value,
            // instant_power: this.formFields.instant_power.value,
            // daily_electricity_sale: this.formFields.daily_electricity_sale.value,
            // sale_electricity_price: this.formFields.sale_electricity_price.value,
            // co2_reduction: this.formFields.co2_reduction.value,
            // contact_name: this.formFields.contact_name.value,
            // meter_date: this.formFields.meter_date.value,
            // default_rate: this.formFields.default_rate.value,
            // module_brand: this.formFields.module_brand.value,
            // module: this.formFields.module.value,
            // model: this.formFields.model.value,
            // total_voltage: this.formFields.total_voltage.value,
            // total_current: this.formFields.total_current.value,
            note: this.formFields.note.value
          }
        };

        this.$axios.put(`/apis/locations/${this.editID}`, updateData)
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
    updatePhoto(event) {
      this.$store.commit('app/isLoading', true);

      var file = event.target.files.item(0);
      var uploadData = new FormData();

      uploadData.append('location[photo]', file);

      this.$axios.put(`apis/locations/${this.editID}?fields=photo`, uploadData)
        .then(response => {
          this.image = 'http://scloud.trillioninnovations.com/' + response.data.location.photo;
          console.log(this.image);
        })
        .catch(error => {
          console.log(error.response.data);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    getPhoto() {
      var myCanvas = document.querySelector('canvas');
      var ctx = myCanvas.getContext('2d');
      var canvasHeight = ctx.canvas.height;
      var canvasWidth = ctx.canvas.width;

      let img = new Image();

      img.addEventListener('load', event => {
        ctx.drawImage(img, 0, 0, canvasHeight, canvasWidth);
      });

      img.src = this.image;
    },
    deleteLocation() {
      if (self.confirm('確定要刪除此Location?')) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/locations/${this.editID}`)
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

canvas {
  border: 1px solid black;
}

.dot {
  position: absolute;
  right: 50px;
  height: 25px;
  width: 25px;
  border-radius: 50%;
}

#button-row {
  .btn {
    width: 5.5rem;
  }
}
</style>