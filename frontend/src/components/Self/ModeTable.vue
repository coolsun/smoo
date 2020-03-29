<template>
  <mdbContainer v-if="checkMode('normal')">
    <mdbRow id="header">
      <mdbCol col="9" md="8">
        <h3>{{ langTransform(title, true) }}</h3>
      </mdbCol>

      <mdbCol col="3" md="1">
        <mdbBtn @click="openPage('new')" size="sm" color="primary"><mdb-icon icon="plus" size="lg"/></mdbBtn>
      </mdbCol>

      <mdbCol col="12" md="3">
        <input class="form-control form-control-sm" :placeholder="langTransform('search')" v-model="searchString" @input="searchData"/>
      </mdbCol>
    </mdbRow>

    <mdbRow id="row-filters">
      <mdbCol col="6" md="3" v-if="modes.length > 1">
        <span>{{ langTransform('mode') }}</span>
        <select class="form-control form-control-sm" v-model="selectedMode">
          <option v-for="mode in modes" :key="mode.text" :value="mode.text">{{ langTransform(mode.text, true) }}</option>
        </select>
      </mdbCol>

      <mdbCol col="6" md="3" v-for="filter in filters" :key="filter.label">
        <span>{{ langTransform(filter.field, true) }}</span>
        <select class="form-control form-control-sm" v-model="filter.value" @change="filterData">
          <option v-for="option in filter.options" :key="option" :value="option">{{ langTransform(option, true) }}</option>
        </select>
      </mdbCol>
    </mdbRow>

    <mdbRow>
      <mdbCol id="col-card" col="12" md="4" v-for="(data, index) in tableData" :key="data.id" v-show="searchMatch[index] && filterMatch[index]">
        <mdbCard class="btn" @click.native="openPage('edit', data.id)">
          <span class="dot" v-if="light" :style="lightColor(data.status)"></span>
          <mdbCardBody>
            <mdbCardText v-for="field in showFields" :key="field">
              <span>{{ langTransform(field, true) }}: </span>

              <router-link v-if="hasLink(field)" :to="data[field] || '#'">點我</router-link>
              <span v-else>{{ showFieldValue(data, field) }}</span>
            </mdbCardText>
          </mdbCardBody>
        </mdbCard>
      </mdbCol>
    </mdbRow>

    <mdbModal v-show="currentPage" @close="closePage" size="lg" side position="right" fullHeight direction="right">
      <mdbModalBody id="right-modal-body">
        <a class="close" @click="closePage">&times;</a>
        <ul class="nav nav-tabs">
          <li v-for="(data, index) in tabs" v-if="data.page == currentPage" class="nav-item" :key="index">
            <a :class="tabGetClass(index)" href="#" role="tab" @click="changeTab(index)">
              {{ langTransform(data.text, true) }}
            </a>
          </li>
        </ul>

        <slot v-if="currentPage" :name="tabs[currentTab.index].component" :editID="editID">{{ langTransform('not_found_tab') }}</slot>
      </mdbModalBody>
    </mdbModal>
  </mdbContainer>

  <mdbContainer v-else-if="checkMode('chart')">
    <mdbRow id="header">
      <mdbCol col="12">
        <h3>{{ langTransform(title, true) }}</h3>
      </mdbCol>
    </mdbRow>

    <mdbRow id="row-filters">
      <mdbCol col="6" md="3" v-if="modes.length > 1">
        <span>{{ langTransform('mode') }}</span>
        <select class="form-control form-control-sm" v-model="selectedMode">
          <option v-for="mode in modes" :key="mode.text" :value="mode.text">{{ langTransform(mode.text, true) }}</option>
        </select>
      </mdbCol>
    </mdbRow>

    <mdbRow>
      <mdbCol col="12" md="4" v-for="data in tableData" :key="data.id">
        <label>{{ data.name }}</label>
        <mdbLineChart :data="data" :options="lineChartOptions" :width="325" :height="300"/>
      </mdbCol>
    </mdbRow>
  </mdbContainer>
</template>

<script>
import mdbContainer from '../Layout/Container';
import mdbRow from '../Layout/Row';
import mdbCol from '../Layout/Col';
import mdbBtn from '../Components/Button';
import mdbCard from '../Components/Card';
import mdbCardBody from '../Components/CardBody';
import mdbCardText from '../Components/CardText';
import mdbIcon from '../Content/Fa';
import mdbModal from '../Modals/Modal';
import mdbModalBody from '../Modals/ModalBody';
import { mdbLineChart } from '../Advanced/ChartLine';

export default {
  name: 'ModeTable',
  components: {
    mdbContainer,
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbCard,
    mdbCardBody,
    mdbCardText,
    mdbIcon,
    mdbModal,
    mdbModalBody,
    mdbLineChart
  },
  props: {
    langPath: {
      type: String,
      required: true
    },
    title: {
      type: String,
      default: 'Table Name'
    },
    light: {
      type: Boolean,
      default: false
    },
    modes: {
      type: Array,
      default: () => []
    },
    getData: {
      type: Function
    },
    filters: {
      type: Array,
      default: () => []
    },
    fields: {
      type: Array,
      default: () => []
    },
    tabs: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      searchString: '',
      selectedMode: null,
      tableData: [],
      searchMatch: [],
      filterMatch: [],
      lineChartOptions: {
        responsive: false,
        maintainAspectRatio: false,
        scales: {
          xAxes: [{
            gridLines: {
              display: true,
              color: "rgba(0, 0, 0, 0.1)"
            }
          }],
          yAxes: [{
            gridLines: {
              display: true,
              color: "rgba(0, 0, 0, 0.1)"
            }
          }]
        }
      }
    };
  },
  computed: {
    checkFinish() {
      return this.$store.state.app.checkSignInFinish;
    },
    currentPage() {
      return this.$store.state.modeTable.currentPage;
    },
    currentTab() {
      return this.$store.state.modeTable.currentTab;
    },
    editID() {
      return this.$store.state.modeTable.editID;
    },
    showFields() {
      var showFieldsLabel = this.fields.map(field => {
        return field.mix ? field.mix : field.name;
      });

      return showFieldsLabel.filter((element, index, arr) => arr.indexOf(element) === index);
    }
  },
  created() {
    this.$store.commit('modeTable/initData');
  },
  updated() {
    this.$nextTick()
      .then(() => {
        this.$store.dispatch('app/setModalHeight');
      });
  },
  watch: {
    checkFinish(status) {
      if (status) {
        if (this.modes.length > 1) {
          this.selectedMode = this.modes.find(x => x.default) ? this.modes[this.modes.findIndex(x => x.default)].text : this.modes[0].text;
        } else {
          this.selectedMode = this.modes.length ? this.modes[0].text : 'normal';
        }
      }
    },
    selectedMode(modeText) {
      this.tableData = [];

      if (!this.modes.length && this.getData) {
        this.getData()
          .then(responseData => {
            this.setData(responseData);
          });
      } else if (this.modes.length && this.modes[this.modes.findIndex(x => x.text == modeText)].getData) {
        this.modes[this.modes.findIndex(x => x.text == modeText)].getData()
          .then(responseData => {
            this.setData(responseData);
          });
      } else {
        console.log('Not Find Function');
      }
    },
    'currentTab.toTab'(action) {
      var toTabIndex = null;

      if (action == 'next') {
        toTabIndex = this.tabs.findIndex((x, index) => x.page == this.currentPage && index > this.currentTab.index);
      } else if (action == 'back') {
        toTabIndex = this.tabs.map((x, index) => index < this.currentTab.index && x.page == this.currentPage).lastIndexOf(true);
      }

      if (toTabIndex !== null) this.changeTab(toTabIndex);
    }
  },
  methods: {
    langTransform(key, usePageLangPath = false) {
      return usePageLangPath ? this.$t(`${this.langPath}.${key}`) : this.$t(`mode_table.${key}`);
    },
    setData(responseData) {
      switch (this.selectedMode) {
        case 'normal':
          this.tableData = responseData;
          this.searchMatch = Array(responseData.length).fill(true);
          this.filterMatch = Array(responseData.length).fill(true);
          this.searchData();
          this.filterData();
          break;
        case 'chart':
          this.tableData = responseData.map(x => ({
            name: x.name,
            labels: x.graph.labels,
            datasets: x.graph.datasets.map(x => Object.assign({}, x, {
              backgroundColor: "rgba(255, 99, 132, 0.1)",
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 0.7
            }))
          }));
          break;
      }
    },
    checkMode(modeText) {
      return this.selectedMode == modeText;
    },
    openPage(page, id = null) {
      if (this.tabs.filter(x => x.page == page).length) {
        this.$store.commit('modeTable/setEditID', id);
        this.changeTab(this.tabs.findIndex(x => x.page == page));
        this.$store.commit('modeTable/setCurrentPage', page);
      } else {
        console.log(this.$t(`mode_table.${page}_page_not_found_in_tabs`));
      }
    },
    closePage() {
      this.$store.commit('modeTable/setCurrentPage', null);
      this.$store.commit('modeTable/setEditID', null);
    },
    searchData() {
      this.tableData.forEach((data, index) => {
        var match = false;

        Object.keys(data).forEach(key => {
          // 欄位沒有顯示，值是空的，或是已經Match到就不再多做Search
          if (!this.fields.map(x => x.name).includes(key) || data[key] === null || match == true) return;

          var dataString = String(data[key]).toLowerCase();

          if (dataString.match(this.searchString.toLowerCase())) match = true;
        });

        this.searchMatch[index] = match;
      });
    },
    filterData() {
      this.tableData.forEach((data, index) => {
        var match = [];

        this.filters.forEach(filter => {
          if (filter.value == 'all') {
            match.push(true);
          } else {
            match.push(data[filter.field] == filter.value);
          }
        });

        this.filterMatch[index] = !match.includes(false);
      });
    },
    lightColor(status) {
      var lightsData = {
        normal: '#00d036',
        warning: '#f5f74c',
        danger: '#ff2300'
      };

      return lightsData[status] ? `background-color: ${lightsData[status]}` : '';
    },
    hasLink(field) {
      return this.fields.find(x => x.name == field) ? this.fields.find(x => x.name == field).link : false;
    },
    showFieldValue(data, field) {
      var fieldValue;
      var mixFields = this.fields.filter(x => x.mix == field);

      if (mixFields.length) {
        fieldValue = mixFields.map(x => data[x.name]).join(' ');
      } else {
        fieldValue = data[field];
      }

      return fieldValue;
    },
    tabGetClass(index) {
      var classText = 'nav-link ripple-parent';

      if (index == this.currentTab.index) classText += ' active';
      if (this.tabs[index].disabled || this.currentPage == 'new') classText += ' disabled';

      return classText;
    },
    changeTab(index) {
      this.$store.commit('modeTable/changeTab', index);
    }
  }
};
</script>

<style lang="scss" scoped>
#header {
  margin-bottom: 10px;
  div {
    margin: auto;
  }
}

#row-filters {
  margin-bottom: 10px;

  > div {
    display: flex;
  }

  span {
    margin: auto 10%;
  }

  select {
    width: 50%;
  }
}

#col-card {
  margin-top: 10px;
}

.card {
  margin-bottom: 15px;

  .card-body {
    text-align: initial;
    text-transform: none;
  }
}

.dot {
  position: absolute;
  right: 20px;
  height: 25px;
  width: 25px;
  border-radius: 50%;
}
</style>