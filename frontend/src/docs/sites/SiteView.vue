<template>
    <div class="d-flex justify-content-center m-3">
        <app-tree-menu d-inline-flex p-2 
            style="align:center;width: 60%" 
            @add-item="addItem" 
            @remove-item="removeItem"
            header="Devices">
            <h4>Lixma all locations</small></h4>
            <app-tree-menu-item
                :name="tree.label"
                :nodes="tree.nodes" 
                :icon="tree.icon"
                @add-item="addItem" 
                @remove-item="removeItem"
                ></app-tree-menu-item>
        </app-tree-menu>
    </div>
</template>

<script>

import {
  mdbContainer,
  mdbRow,
  mdbIcon,
  mdbTreeview,
  TreeMenu,
  TreeMenuItem
} from "mdbvue";
export default {
  name: "SiteView",
  components: {
    mdbContainer,
    mdbRow,
    mdbIcon,
    mdbTreeview,
    'app-tree-menu': TreeMenu,
    'app-tree-menu-item': TreeMenuItem,

    /* 'app-device-new': DeviceNew,*/
  },
  created() {
    this.$store.dispatch('app/checkSignIn', false);
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
      tree: {
        label: 'root',
        icon: 'home',
        nodes: [
          {
            label: 'item1',
            icon: 'temperature-high',
            nodes: [
              {
                label: 'item1.1',
                icon: 'code-branch'
              },
              {
                label: 'item1.2',
                icon: 'tachometer-alt',
                nodes: [
                  {
                    label: 'item1.2.1',
                    icon: 'solar-panel'
                  }
                ]
              }
            ]
          }, 
          {
            label: 'item2',
            icon: 'hdd' 
          }
        ]
      }
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
    },
    addItem(nodes) {
      nodes.push({
        label: "new stuff=" + nodes.length,
        icon: "home"
      });
      console.log("aaa");
    },
    removeItem(removeLabel) {
      console.log("bbb");
      console.log(this.tree.nodes);
      this.tree.nodes = this.tree.nodes.filter(node => node.label != removeLabel);
      console.log(this.tree.nodes);
    }
  }
};
</script>


<style>
</style>