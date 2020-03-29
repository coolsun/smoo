<template>
  <div class="d-flex justify-content-center m-3">
    <mdb-treeview d-inline-flex p-2 style="align:center;width: 60%" header="Devices">
      <mdb-treeview-item nested icon="home" title="L001">
        <mdb-treeview-item nested icon="chromecast" title="wise-manager1">
          <mdb-treeview-item nested icon="code-branch" title="node1">
            <mdb-treeview-item nested icon="random" title="inverter1">
              <mdb-treeview-item icon="solar-panel" title="module1"/>
              <mdb-treeview-item icon="solar-panel" title="module2"/>
              <mdb-treeview-item icon="solar-panel" title="module3"/>
              <mdb-treeview-item icon="solar-panel" title="module4"/>
            </mdb-treeview-item>
            <mdb-treeview-item icon="sun" title="sun-shine1"/>
            <mdb-treeview-item icon="temperature-high" title="thermometer1"/>
            <mdb-treeview-item icon="wind" title="anemometer1"/>
            <mdb-treeview-item icon="tachometer-alt" title="electric_meter1"/>
            <mdb-treeview-item icon="server" title="high_voltage_panel1"/>
          </mdb-treeview-item>
          <mdb-treeview-item far icon="hdd" title="black1"/>
        </mdb-treeview-item>
      </mdb-treeview-item>
    </mdb-treeview>
  </div>
</template>

<script>
import {
  mdbContainer,
  mdbRow,
  mdbIcon,
  mdbTreeview,
  mdbTreeviewItem
} from "mdbvue";
export default {
  name: "TreeviewPage",
  components: {
    mdbContainer,
    mdbRow,
    mdbIcon,
    mdbTreeview,
    mdbTreeviewItem
  },
  created() {
    this.getDevicesData();
  },
  data() {
    return {
      setting: {
        langPath: 'devices',
        title: 'device_list',
        getData: this.getDevicesData,
        fields: [
          { name: 'name' },
          { name: 'device_model' },
          { name: 'location_name' }
        ]
      },
      devices: null
    };
  },
  methods: {
    getDevicesData() {
      return new Promise((resolve, reject) => {
        this.$store.commit('app/isLoading', true);
        this.$axios.get('/apis/devices')
          .then(response => {
            this.devices = response.data.devices;
            console.log(this.devices);
          })
          .catch(error => {
            reject(error.response.data.message);
          })
          .finally(() => {
            this.$store.commit('app/isLoading', false);
          });
      });
    }
  }
};
</script>


<style>
</style>