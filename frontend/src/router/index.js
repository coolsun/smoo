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
      name: 'home',
      component: Home
    },
    {
      path: '/home2',
      name: 'home2',
      component: Home2
    },
    {
      path: '/about',
      name: 'about',
      component: About
    },
    {
      path: '/sign-up',
      name: 'sign-up',
      component: SignUp
    },
    {
      path: '/contact',
      name: 'contact',
      component: Contact
    },
    {
      path: '/medical',
      name: 'medical',
      component: Medical
    },
    {
      path: '/emergency',
      name: 'emergency',
      component: Emergency
    },
    {
      path: '/animal-rescue',
      name: 'animal-rescue',
      component: AnimalRescue
    },
    {
      path: '/memorial',
      name: 'memorial',
      component: Memorial
    },
    {
      path: '/charity',
      name: 'charity',
      component: Charity
    },
    {
      path: '/blog',
      name: 'blog',
      component: Blog
    },
    {
      path: '/blog-details',
      name: 'blog-details',
      component: BlogDetails
    },
    {
      path: '/causes',
      name: 'causes',
      component: Causes
    },
    {
      path: '/causes2',
      name: 'causes2',
      component: Causes2
    },
    {
      path: '/causes-details/:campaignID',
      name: 'causes-details',
      component: CausesDetails,
      props: true
    },
    {
      path: '/explore',
      name: 'explore',
      component: Explore
    },
    {
      path: '/start-a-project',
      name: 'start-a-project',
      component: StartAProject
    },
    {
      path: '/donation-now',
      name: 'donation-now',
      component: DonationNow
    },
    {
      path: '/my-account',
      name: 'my-account',
      component: MyAccount
    },
    {
      path: '/my-donation',
      name: 'my-donation',
      component: MyDonation
    },
    {
      path: '/my-campaign',
      name: 'my-campaign',
      component: MyCampaign
    },
    {
      path: '/donation-history',
      name: 'donation-history',
      component: DonationHistory
    },
    {
      path: '/not-found',
      name: 'not-found',
      component: NotFound
    },
    {
      path: '*',
      redirect: '/not-found'
    }
  ],
  scrollBehavior () {
    return { x: 0, y: 0 }
  }
});
