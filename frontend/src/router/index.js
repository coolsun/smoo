import Vue from 'vue';
import Router from 'vue-router';

import Home from '@/views/layouts/Home';

import NotFound from '@/views/layouts/NotFound';
import About from '@/views/pages/About';
import Contact from '@/views/pages/Contact';
import Home2 from '@/views/pages/Home2';
import SignUp from '@/views/pages/SignUp';
import AnimalRescue from '@/views/featured/AnimalRescue';
import Emergency from '@/views/featured/Emergency';
import Charity from '@/views/featured/Charity';
import Memorial from '@/views/featured/Memorial';
import Medical from '@/views/featured/Medical';
import Blog from '@/views/blog/Blog';
import BlogDetails from '@/views/blog/BlogDetails';
import Causes from '@/views/causes/Causes';
import Causes2 from '@/views/causes/Causes2';
import CausesDetails from '@/views/causes/CausesDetails';
import Explore from '@/views/explore/Explore';
import StartAProject from '@/views/projects/StartAProject';
import DonationNow from '@/views/donations/DonationNow';
import MyAccount from '@/views/account/MyAccount';
import MyDonation from '@/views/account/MyDonation';
import MyCampaign from '@/views/account/MyCampaign';
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
      path: '/sign-up',
      name: 'SignUp',
      component: SignUp
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/medical',
      name: 'Medical',
      component: Medical
    },
    {
      path: '/emergency',
      name: 'Emergency',
      component: Emergency
    },
    {
      path: '/animal-rescue',
      name: 'AnimalRescue',
      component: AnimalRescue
    },
    {
      path: '/memorial',
      name: 'memorial',
      component: Memorial
    },
    {
      path: '/charity',
      name: 'Charity',
      component: Charity
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
      path: '/my-account',
      name: 'MyAccount',
      component: MyAccount
    },
    {
      path: '/my-donation',
      name: 'MyDonation',
      component: MyDonation
    },
    {
      path: '/my-campaign',
      name: 'MyCampaign',
      component: MyCampaign
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
