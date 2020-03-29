<template>
  <mdbContainer id="div-center">
    <h2>{{ $t('layouts.hello') }}</h2>
  </mdbContainer>
</template>

<script>
import { mdbContainer } from 'mdbvue';

export default {
  name: 'Home',
  components: {
    mdbContainer
  },
  created() {
    this.$store.dispatch('app/checkSignIn', false);
  }
};
</script>

<style lang="scss" scoped>
#div-center {
  margin-top: 35vh;
  text-align: center;
}
</style>