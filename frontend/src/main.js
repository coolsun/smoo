// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.

import 'bootstrap-css-only/css/bootstrap.min.css'
import 'mdbvue/lib/css/mdb.min.css'
import '@fortawesome/fontawesome-free/css/all.min.css'
// not sure if we need mdbvue.css
//import 'mdbvue/lib/mdbvue.css'
import Vue from 'vue';
import App from './App.vue';
import store from './store';
import router from './router';
import Notify from 'mdbvue/lib/components/Notify'
//import Vue2TouchEvents from 'vue2-touch-events';
//import LoadScript from 'vue-plugin-load-script';
import i18n from './lang/language';
import axios from 'axios';

//Vue.use(Vue2TouchEvents);
//Vue.use(LoadScript);
Vue.prototype.$axios = axios;

Vue.config.productionTip = false;
Vue.use(Notify)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  i18n,
  store,
  router,
  render: h => h(App),
  template: '<app/>',
  components: { App }
});
