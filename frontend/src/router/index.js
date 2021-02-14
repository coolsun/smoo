import Vue from 'vue';
import Router from 'vue-router';

import Home from '@/views/layouts/Home';

import NotFound from '@/views/layouts/NotFound';
import About from '@/views/pages/About';
import Contact from '@/views/pages/Contact';
import Home2 from '@/views/pages/Home2';
import Featured from '@/views/featured/Featured';
import Featured2 from '@/views/featured/Featured2';
import Blog from '@/views/blog/Blog';
import BlogDetails from '@/views/blog/BlogDetails';
import Causes from '@/views/causes/Causes';
import Causes2 from '@/views/causes/Causes2';
import CausesDetails from '@/views/causes/CausesDetails';
import Explore from '@/views/explore/Explore';
import StartAProject from '@/views/projects/StartAProject';
import DonationNow from '@/views/donations/DonationNow';
import DonationHistory from '@/views/donations/DonationHistory';

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
      path: '/home2',
      name: 'Home2',
      component: Home2
    },
    {
      path: '/about',
      name: 'About',
      component: About
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/featured',
      name: 'Featured',
      component: Featured
    },
    {
      path: '/featured-2',
      name: 'Featured2',
      component: Featured2
    },
    {
      path: '/blog',
      name: 'Blog',
      component: Blog
    },
    {
      path: '/blog-details',
      name: 'BlogDetails',
      component: BlogDetails
    },
    {
      path: '/causes',
      name: 'Causes',
      component: Causes
    },
    {
      path: '/causes2',
      name: 'Causes2',
      component: Causes2
    },
    {
      path: '/causes-details',
      name: 'CausesDetails',
      component: CausesDetails
    },
    {
      path: '/explore',
      name: 'Explore',
      component: Explore
    },
    {
      path: '/start-a-project',
      name: 'StartAProject',
      component: StartAProject
    },
    {
      path: '/donation-now',
      name: 'DonationNow',
      component: DonationNow
    },
    {
      path: '/donation-history',
      name: 'DonationHistory',
      component: DonationHistory
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
