import Vue from 'vue';
import VueI18n from 'vue-i18n';
//import cn from './cn.json';
import English from './files/en.json';
import TraditionalChinese from './files/tc.json';
//import es from './es.json';

Vue.use(VueI18n);

const messages = {
  'en': English,
  'zh-tw': TraditionalChinese
};

const i18n = new VueI18n({
  locale: 'zh-tw',
  fallbackLocale:  'zh-tw',
  messages
});

export default i18n;