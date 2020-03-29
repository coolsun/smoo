import axios from 'axios';

export default {
  namespaced: true,
  state: {
    currentUser: null,
    alert: null,
    loading: false,
    checkSignInFinish: false
  },
  mutations: {
    setCurrentUser(state, name) {
      state.currentUser = name;
    },
    isLoading(state, value) {
      state.loading = value;
    },
    alertMessage(state, data) {
      state.alert = data;
    },
    closeAlert(state) {
      state.alert = null;
    },
    checkSignInStatus(state, value) {
      state.checkSignInFinish = value;
    }
  },
  actions: {
    checkSignIn({ state, commit }, needSignIn = true) {
      commit('isLoading', true);
      commit('checkSignInStatus', false);

      axios.get('/apis/users/get_current_user')
        .then(function(response) {
          commit('setCurrentUser', response.data.user.name);
        })
        .catch(function(error) {
          console.log(error); 
        })
        .finally(function(){
          commit('checkSignInStatus', true);
          if (state.currentUser === null && needSignIn) location.href = '/';
          commit('isLoading', false);
        });
    },
    setModalHeight() {
      var modalBody = document.querySelector('#right-modal-body');

      if (!modalBody) return;

      var modalContent = modalBody.parentNode;
      var buttonRow = document.querySelector('#button-row');
      var windowHeight = window.innerHeight;

      if (buttonRow) buttonRow.classList.remove('right-bottom');
      modalContent.style.setProperty('height', "");

      if (buttonRow && modalBody.clientHeight - windowHeight <= 1) buttonRow.classList.add('right-bottom');

      if (modalBody.clientHeight - windowHeight > 1) {
        modalContent.style.setProperty('height', (modalBody.clientHeight) + 'px');
      }
    }
  }
};
