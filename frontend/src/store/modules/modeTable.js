export default {
  namespaced: true,
  state: {
    currentPage: null,
    currentTab: {
      index: null,
      toTab: null
    },
    editID: null
  },
  mutations: {
    initData(state) {
      state.currentPage = null;
      state.currentTab.index = null;
      state.currentTab.toTab = null;
      state.editID = null;
    },
    setCurrentPage(state, page) {
      state.currentPage = page;
    },
    changeTab(state, index) {
      state.currentTab.index = index;
      state.currentTab.toTab = null;
    },
    setEditID(state, id) {
      state.editID = id;
    },
    goToTab(state, action) {
      state.currentTab.toTab = action;
    }
  }
};