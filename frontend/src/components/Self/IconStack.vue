<template>
  <span class="fa-stack fa-2x">
    <mdbIcon v-for="(info, index) in iconsInfo" :icon="info.icon" :style="iconStyle(index)" :color="info.color" :stack="getStackSize(index)" :key="index"/>
  </span>
</template>

<script>
import mdbIcon from '../Content/Fa';

export default {
  name: 'IconStack',
  components: {
    mdbIcon
  },
  props: {
    iconsInfo: {
      type: Array,
      default: []
    }
  },
  methods: {
    getStackSize(index) {
      return this.iconsInfo[index].stackSize ? 'stack-' + this.iconsInfo[index].stackSize : 'stack-1x';
    },
    iconStyle(index) {
      return index == 1 ? 'font-size: 2rem;' : '';
    }
  }
};
</script>

<style lang="scss" scoped>
.fa-stack {
  height: 1em;
  line-height: 1em;
  width: 1.5em;
}

.fa-stack-2x {
  font-size: 1.5em;
  line-height: inherit;
}
</style>