import Vue from 'vue';
import VueI18n from 'vue-i18n';
//import cn from './cn.json';
import en from './files/en.json';
import tc from './files/tc.json';
//import es from './es.json';

Vue.use(VueI18n);

const messages = {
  EN: en,
  TC: tc
};

const i18n = new VueI18n({
  locale: 'TC',
  fallbackLocale:  'TC',
  messages
});

export default i18n;