<template>
  <div id="app">
    <custom-header />
    <custom-breadcrumb />
    <main>
      <transition name="fade" mode="out-in">
        <router-view/>
      </transition>
    </main>

    <custom-footer />
    <custom-copyright />
  </div>
</template>

<script>

import CustomHeader from '@/views/layouts/Header';
import CustomBreadcrumb from '@/views/layouts/Breadcrumb';
import CustomFooter from '@/views/layouts/Footer';
import CustomCopyright from '@/views/layouts/Copyright';

export default {
  name: "app",
  components: {
    CustomHeader,
    CustomBreadcrumb,
    CustomFooter,
    CustomCopyright
  },
  data() {
    return {
    };
  },
};
</script>

<style lang="css">
@import './assets/css/font-awesome.min.css';
@import './assets/css/magnific-popup.css';
@import './assets/css/animate.css';
@import './assets/css/owl.carousel.min.css';
@import './assets/css/main.css';
</style>