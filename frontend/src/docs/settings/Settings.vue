<template>
  <mdbContainer>
    <ul class="nav nav-tabs">
      <li v-for="(data, index) in tabs" class="nav-item" :key="index">
        <a :class="tabGetClass(data, index)" href="#" role="tab" @click="changeTab(index)">
          {{ $t(`settings.${data.text}`) }}
        </a>
      </li>
    </ul>

    <component :is="tabs[currentTab].component"/>
  </mdbContainer>
</template>

<script>
import { mdbContainer } from 'mdbvue';
import SettingParams from './SettingParams';
import SunlightParameters from './SunlightParameters';
import GeoParameters from './GeoParameters';
import ErrorParams from './ErrorParams';

export default {
  name: 'settings',
  components: {
    mdbContainer,
    SettingParams,
    SunlightParameters,
    GeoParameters,
    ErrorParams
  },
  data() {
    return {
      currentTab: 0,
      tabs: [ 
        { text: 'params', component: 'SettingParams' },
        { text: 'sunlight_parameters', component: 'SunlightParameters' },
        { text: 'geo_parameters', component: 'GeoParameters' },
        { text: 'error_params', component: 'ErrorParams' }
      ]
    };
  },
  created() {
    this.$store.dispatch('app/checkSignIn');
  },
  methods: {
    tabGetClass(data, index) {
      var classText = 'nav-link ripple-parent';

      if (index == this.currentTab) classText += ' active';
      if (data.disabled == true) classText += ' disabled';

      return classText;
    },
    changeTab(index) {
      this.currentTab = index;
    }
  }
};
</script>