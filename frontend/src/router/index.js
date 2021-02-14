import Vue from 'vue';
import Router from 'vue-router';

import Home from '@/views/layouts/Home';
import NotFound from '@/views/layouts/NotFound';

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/404',
      name: 'NotFound',
      component: NotFound
    },
    {
      path: '*',
      redirect: '/404'
    }
  ]
});
