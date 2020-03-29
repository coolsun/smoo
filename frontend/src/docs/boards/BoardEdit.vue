<template>
  <form class="needs-validation" novalidate @submit.prevent="updateBoard">
    <mdbRow v-for="field in formFields" :key="field.label">
      <mdbCol class="form-group" :col="field.col">
        <label>{{ (field.required ? '* ' : '') + $t(`boards.${field.label}`) }}</label>

        <input class="form-control" v-if="field.type == 'text'" v-model="field.value" type="text" :required="field.required" :disabled="showMode">

        <select class="form-control" v-if="field.type == 'select'" v-model="field.value" :required="field.required" :disabled="showMode">
          <option v-for="option in field.options" :value="option">{{ option }}</option>
        </select>

        <input class="form-control" v-if="field.type == 'number'" type="number" v-model="field.value" :required="field.required" :disabled="showMode">
      </mdbCol>
    </mdbRow>

    <mdbRow id="button-row" end>
      <template v-for="btn in buttons">
        <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
          <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack } from 'mdbvue';

export default {
  name: "BoardEdit",
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      buttonMode: 'showMode',
      formFields: {
        name: { col: '6', label: 'name', value: '', type: 'text', required: true },
        firmName: { col: '6', label: 'firm_name', value: '', type: 'text' },
        count: { col: '6', label: 'count', value: '1', type: 'select', options: ['1', '4', '6', '8', '9', '12'], required: true },
        carouselSecond: { col: '6', label: 'carousel_second', value: 5, type: 'number' },
        comment: { col: '6', label: 'comment', value: '', type: 'text' }
      },
      buttons: [
        { icon: 'trash-alt', type: 'button', method: 'deleteBoard', show: 'showMode' },
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'save', type: 'submit', show: 'editMode' },
        { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode', show: 'editMode' }
      ]
    };
  },
  computed: {
    showMode() {
      return this.buttonMode == 'showMode';
    },
    editMode() {
      return this.buttonMode == 'editMode';
    }
  },
  created() {
    this.getBoardData();
  },
  watch: {
    'formFields.carouselSecond.value'(val) {
      if (val < 5) this.formFields.carouselSecond.value = 5;
    }
  },
  methods: {
    getBoardData() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/boards/${this.editID}/edit`)
        .then(response => {
          this.formFields.name.value = response.data.board.name;
          this.formFields.firmName.value = response.data.board.firm_name;
          this.formFields.count.value = response.data.board.count;
          this.formFields.carouselSecond.value = response.data.board.carousel_second;
          this.formFields.comment.value = response.data.board.comment;
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    deleteBoard() {
      if (self.confirm('確定要刪除看板')) {
        this.$store.commit('app/isLoading', true);
        this.$axios.delete(`/apis/boards/${this.editID}`)
          .then(() => {
            self.location.reload();
          })
          .catch(error => {
            console.log(error.response.data.message);
            this.$store.commit('app/isLoading', false);
          });
      }
    },
    changeButtonMode(mode) {
      this.buttonMode = mode;
    },
    showButton(showCondition) {
      if (showCondition) {
        var show = [];

        showCondition.split(', ').forEach(element => {
          show.push(this[element]);
        });

        return !show.includes(false);
      }

      return true;
    },
    clickEvent(method, params) {
      if (method) {
        this[method](params);
      }
    },
    fieldClass(field) {
      return `col-md-${field.md} mb-3`;
    },
    updateBoard(event) {
      if (event.target.checkValidity()) {
        this.$store.commit('app/isLoading', true);

        var updateData = {
          name: this.formFields.name.value,
          firm_name: this.formFields.firmName.value,
          count: this.formFields.count.value,
          carousel_second: this.formFields.carouselSecond.value,
          comment: this.formFields.comment.value,
        };

        this.$axios.put(`/apis/boards/${this.editID}`, updateData)
          .then(() => {
            self.location.reload();
          })
          .catch(error => {
            console.log(error.response.data.message);
          })
          .finally(() => {
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
