<template>
  <form class="needs-validation" novalidate @submit.prevent="updateSite">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`sites.${field.label}`) }}</label>
        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :disabled="field.disabled || !editMode" :required="field.required">
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
  name: 'SiteEdit',
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
        code: { col: '6', label: 'code', value: '', type: 'text', disabled: true },
        name: { col: '6', label: 'name', value: '', type: 'text' },
        phone: { col: '6', label: 'phone', value: '', type: 'text' },
        fax: { col: '6', label: 'fax', value: '', type: 'text' },
        city: { col: '6', label: 'city', value: '', type: 'text' },
        district: { col: '6', label: 'district', value: '', type: 'text' },
        street: { col: '6', label: 'street', value: '', type: 'text' },
        invoiceNum: { col: '6', label: 'invoice_num', value: '', type: 'text' },
        locationId: { col: '6', label: 'location_id', value: '', type: 'text' },
        note: { col: '6', label: 'note', value: '', type: 'text' },
        cloudContract: { col: '6', label: 'cloud_contract', value: '', type: 'text' },
        saleContract: { col: '6', label: 'sale_contract', value: '', type: 'text' },
        maintanenceContract: { col: '6', label: 'maintanence_contract', value: '', type: 'text' },
        disable: { col: '6', label: 'disable', value: '', type: 'text' },
        updatedAt: { col: '6', label: 'updated_at', value: '', type: 'text' }
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteSite', show: 'showMode' },
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
      this.$axios.get(`/apis/sites/${this.editID}/edit`)
        .then(response => {
          this.formFields.name.value = response.data.site.name;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateSite(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          site: {
            name: this.formFields.name.value
          }
        };

        this.$axios.put(`/apis/sites/${this.editID}`, updateData)
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
    deleteSite() {
      if (self.confirm(this.$t('sites.delete_confirm'))) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/sites/${this.editID}`)
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