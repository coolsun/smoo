import Vue from 'vue';
import Router from 'vue-router';

import Home from '../docs/layouts/Home';
import NotFound from '../docs/layouts/NotFound';
import Board from '../docs/boards/Board';
import MultipleBoard from '../docs/boards/MultipleBoard';
import Site from '../docs/sites/Site';
import SiteView from '../docs/sites/SiteView';
import User from '../docs/users/User';
import Role from '../docs/roles/Role';
import Location from '../docs/locations/Location';
import Device from '../docs/devices/Device';
import DeviceModel from '../docs/device_models/DeviceModel';
import DeviceType from '../docs/device_types/DeviceType';
import Settings from '../docs/settings/Settings';

import LandingPage from '../docs/pages/LandingPage';

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/landing_page',
      name: 'LandingPage',
      component: LandingPage
    },
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/boards',
      name: 'Board',
      component: Board
    },
    {
      path: '/boards/:id',
      name: 'MultipleBoard',
      component: MultipleBoard
    },
    {
      path: '/sites',
      name: 'Site',
      component: Site
    },
    {
      path: '/sites/view',
      name: 'SiteView',
      component: SiteView
    },
    {
      path: '/roles',
      name: 'Role',
      component: Role
    },
    {
      path: '/users',
      name: 'User',
      component: User
    },
    {
      path: '/locations',
      name: 'Location',
      component: Location
    },
    {
      path: '/devices',
      name: 'Device',
      component: Device
    },
    {
      path: '/device_models',
      name: 'Device Model',
      component: DeviceModel
    },
    {
      path: '/device_types',
      name: 'Device Type',
      component: DeviceType
    },
    {
      path: '/settings',
      name: 'Settings',
      component: Settings
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
