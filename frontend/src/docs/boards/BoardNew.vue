<template>
  <form class="needs-validation" novalidate @submit.prevent="createBoard">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`boards.${field.label}`) }}</label>

        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :required="field.required">

        <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required">
          <option v-for="option in field.options" :value="option">{{ option }}</option>
        </select>

        <input  class="form-control" v-if="field.type == 'number'" type="number" v-model="field.value" :required="field.required">
      </mdbCol>
    </mdbRow>

    <mdbRow id="button-row" end>
      <mdbBtn type="submit" size="sm" color="primary">
        <mdbIcon icon="arrow-circle-right" size="2x"/>
      </mdbBtn>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon } from 'mdbvue';

export default {
  name: 'BoardNew',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon
  },
  data() {
    return {
      formFields: {
        name: { col: '6', label: 'name', value: '', type: 'text', required: true },
        firmName: { col: '6', label: 'firm_name', value: '', type: 'text' },
        count: { col: '6', label: 'count', value: '1', type: 'select', options: ['1', '4', '6', '8', '9', '12'], required: true },
        carouselSecond: { col: '6', label: 'carousel_second', value: 0, type: 'number' },
        comment: { col: '6', label: 'comment', value: '', type: 'text' }
      }
    };
  },
  methods: {
    createBoard(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var newData = {
          board: {
            name: this.formFields.name.value,
            firm_name: this.formFields.firmName.value,
            count: this.formFields.count.value,
            carousel_second: this.formFields.carouselSecond.value,
            comment: this.formFields.comment.value
          }
        };

        this.$axios.post('/apis/boards', newData)
          .then(response => {
            this.$store.commit('modeTable/setEditID', response.data.board.id);
            this.$store.commit('app/isLoading', false);
            this.$store.commit('modeTable/goToTab', 'next');
          })
          .catch(error => {
            console.log(error.response.data.message);
            this.$store.commit('app/isLoading', false);
          });
      } else {
        event.target.classList.add('was-validated');
      }
    }
  }
};
</script>

<style lang="scss" scoped>
form {
  margin-top: 10px;
  margin-left: 15px;
}

#button-row {
  .btn {
    width: 5.5rem;
  }
}

#button-row.right-bottom {
  position: absolute;
  right: 40px;
  bottom: 15px;
}
</style>