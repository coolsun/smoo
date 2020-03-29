<template>
  <mdbContainer id="div-center">
    <h2>{{ $t('layouts.not_found_page') }}</h2>
  </mdbContainer>
</template>

<script>
import { mdbContainer } from 'mdbvue';

export default {
  name: 'NotFound',
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