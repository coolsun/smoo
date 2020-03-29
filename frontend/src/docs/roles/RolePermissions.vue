<template>
  <p v-if="errorMessage">{{ errorMessage }}</p>

  <form v-else>
    <div v-for="action in selectedActions" @submit.prevent="updateRole">
      <span>{{ action.name }}</span>
      <mdbBtn v-show="editMode" type="button" color="primary" size="sm" @click="deleteAction(action)">-</mdbBtn><br>

      <span v-for="permission in action.permissions">
        <input type="checkbox" :value="permission.sort" :checked="permission.execute" v-model="permission.execute" :disabled="!editMode"> {{ permission.name }} </input>
      </span>
    </div>

    <mdbRow id="button-row">
      <template v-for="btn in buttons">
        <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
          <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
    </mdbRow>

    <mdbModal v-show="addActionsModal" @close="changeAddActionsModal">
      <mdbModalBody>
        <div v-for="action in unselectedActions">
          <input type="checkbox" :value="action" v-model="addActionsData">{{ action.name }}</input>
        </div>

        <mdbBtn type="button" color="primary" size="sm" @click="addActions">新增</mdbBtn>
        <mdbBtn type="button" color="primary" size="sm" @click="changeAddActionsModal">取消</mdbBtn>
      </mdbModalBody>
    </mdbModal>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack, mdbModal, mdbModalBody } from 'mdbvue';

export default {
  name: 'RolePermissions',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack,
    mdbModal,
    mdbModalBody
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      buttonMode: 'showMode',
      errorMessage: '',
      originSelectedActions: [],
      selectedActions: [],
      unselectedActions: [],
      addActionsData: [],
      addActionsModal: false,
      buttons: [
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode' },
        { icon: 'plus', type: 'button', method: 'changeAddActionsModal', show: 'editMode, unselectedActionsExist' },
        { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode', show: 'editMode' },
        { icon: 'save', type: 'submit', show: 'editMode', method: 'updateRole' }
      ]
    };
  },
  computed: {
    showMode() {
      return this.buttonMode == 'showMode';
    },
    editMode() {
      return this.buttonMode == 'editMode';
    },
    unselectedActionsExist() {
      return this.unselectedActions.length > 0;
    }
  },
  created() {
    this.getPermissionsInfo();
  },
  methods: {
    getPermissionsInfo() {
      this.$store.commit('app/isLoading', true);
      this.originSelectedActions = [];
      this.selectedActions = [];
      this.unselectedActions = [];

      this.$axios.get(`/apis/roles/${this.editID}/edit`)
        .then(response => {
          this.originSelectedActions = response.data.role.selected_actions.map(action => action.ra_id);;
          this.selectedActions = response.data.role.selected_actions;
          this.unselectedActions = response.data.role.unselected_actions;

          if (!this.selectedActions.concat(this.unselectedActions).length) self.alert('No actions');
        })
        .catch(error => {
          this.errorMessage = error.response.data.message;
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    updateRole() {
      this.$store.commit('app/isLoading', true);

      var updateData = {
        selected_actions: this.selectedActions.concat(this.unselectedActions.filter(action => action._destroy == true))
      };

      this.$axios.put(`/apis/roles/${this.editID}`, updateData)
        .then(() => {
          location.reload();
        })
        .catch(error => {
          console.log(error.response.data);
          this.$store.commit('app/isLoading', false);
        });
    },
    addActions() {
      if (this.addActionsData.length) {
        this.addActionsData.forEach(action => {
          var deleteIndex = this.unselectedActions.findIndex(unselectedAction => unselectedAction == action);

          if (action._destroy == true) delete action._destroy;

          this.selectedActions.push(action);
          this.unselectedActions.splice(deleteIndex, 1);
        });

        this.changeAddActionsModal();
      } else {
        self.alert(this.$t('roles.must_select_one'));
      }

    },
    deleteAction(action) {
      var deleteIndex = this.selectedActions.findIndex(selectedAction => selectedAction == action);

      if (this.originSelectedActions.includes(action.ra_id)) action._destroy = true;

      this.unselectedActions.push(action);
      this.selectedActions.splice(deleteIndex, 1);
    },
    changeAddActionsModal() {
      this.addActionsData = [];
      this.addActionsModal = !this.addActionsModal;
    },
    changeButtonMode(mode) {
      this.buttonMode = mode;
    },
    showButton(condition) {
      if (!condition) return true;

      var show = [];

      condition.split(', ').forEach(element => {
        show.push(this[element]);
      });

      return !show.includes(false);
    },
    clickEvent(method, params) {
      if (!method) return;

      this[method](params);
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
  position: absolute;
  right: 40px;
  bottom: 15px;

  .btn {
    width: 5.5rem;
  }
}
</style>