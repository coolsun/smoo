<template>
  <mdbContainer>
<div class="table-editable">
  <span class="table-add float-right mb-3 mr-2">
      <template v-for="btn in buttons">
          <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
            <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
  </span>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col" v-for="data in titleData" :key="data">{{ data }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(rowData, index) in contentData" :key="index">
        <th scope="row"></th>
        <td :contenteditable="editMode" v-for="colData in rowData" :key="colData">{{ colData }}</td>
      </tr>
    </tbody>    
  </table>
</div>
  </mdbContainer>
</template>
<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack,mdbContainer } from 'mdbvue';

export default {
  name: 'SunlightParameters',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack,
    mdbContainer
  },
  data() {
    return {
      buttonMode: 'showMode',
      dataArray: [],
      removeArray: [],
      typeOptions: [],
      fieldCount: 24,
      titleData: [],
      contentData: [],
      buttons: [
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'plus', type: 'button', method: 'insertRow', show: 'editMode' },
        { icon: 'minus', type: 'button', method: 'deleteRow', show: 'editMode' },
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
    this.getTableData();
    this.getPropertiesInfo();
  },
  updated() {
    this.$store.dispatch('app/setModalHeight');
  },
  methods: {
    getTableData() {
      for (var i = 0; i < this.fieldCount; i++) {
        this.titleData.push(i * 15);
      }
    },
    insertRow() {
      this.contentData.push(Array(this.fieldCount).fill(0));
    },
    deleteRow(index) {
      this.contentData.splice(index, 1);
    },
    getSunlightInfo() {
      this.$store.commit('app/isLoading', true);
      // this.$axios.get(`/apis/Sunlight`)
      //   .then(response => {
      //     this.dataArray = response.data.device_model_properties;
      //     this.typeOptions = response.data.properties_kinds;
      //   })
      //   .catch(error => {
      //     console.log(error.response.data.message);
      //   })
      //   .finally(() => {
      //     this.$store.commit('app/isLoading', false);
      //   });
    },
    updateProperties(event) {
      // if (event.target.checkValidity()) {
      //   this.$store.commit('app/isLoading', true);

      //   var updateData = {
      //     device_model: {
      //       device_model_properties_attributes: this.dataArray.concat(this.removeArray)
      //     }
      //   };

      //   this.$axios.put(`/apis/settings`, updateData)
      //     .then(() => {
      //       location.reload();
      //     })
      //     .catch(error => {
      //       console.log(error.response.data.message);
      //     })
      //     .finally(function() {
      //       this.$store.commit('app/isLoading', false);
      //     });
      // } else {
      //   event.target.classList.add('was-validated');
      // };
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