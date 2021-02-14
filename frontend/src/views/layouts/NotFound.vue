<template>
  <div>
    <h3>{{ $t('error.not_found_page') }}</h3>
  </div>
</template>

<script>
export default {
  name: 'NotFound'
};
</script>

<style lang="scss" scoped>
div {
 text-align: center;
}

h3 {
  font-weight: normal;
  margin-top: 40vh;
}
</style>