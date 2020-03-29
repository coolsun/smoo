import Vue from 'vue';
import Vuex from 'vuex';
import app from './modules/app.js';
import modeTable from './modules/modeTable.js';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    app,
    modeTable
  }
});
