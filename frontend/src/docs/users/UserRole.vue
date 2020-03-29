<template>
  <form class="needs-validation" novalidate @submit.prevent="createUser">
    <mdbRow>
      <mdbCol class="form-group" col="4">
        <label>{{ $t('users.role') }}</label>
        <select name="" id="" class="form-control">
          <option value="">admin</option>
          <option value="">site_admin</option>
          <option value="">manager</option>
        </select>
      </mdbCol>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol } from 'mdbvue';

export default {
  name: 'UserNew',
  components: {
    mdbRow,
    mdbCol
  }
};
</script>

<style lang="scss" scoped>
form {
  margin-top: 10px;
  margin-left: 15px;
}
</style>