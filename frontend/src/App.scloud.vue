<template>
  <div id="app">
    <mdbNavbar id="main-navbar" dark position="top" color="stylish" :toggler="false">
      <!-- Sidebar 按鈕 -->
      <mdbNavbarBrand :class="sidebarBtnClass" :style="sidebarBtnStyle" waves-fixed>
        <a @click="changeStatus('showMenu')"><i tag="li" class="fa fa-bars"/></a>
      </mdbNavbarBrand>

      <!-- Sidebar 內容 -->
      <mdbCard id="sidebar" v-show="showMenu">
        <mdbCardBody id="sidebar-body" class="white-text animated fadeInLeft" color="elegant">
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-chart-line fa-fw']" :toggleText="['', $t('app.board')]" closeTarget="sidebar">
            <li><router-link to="/boards">{{$t('app.board_list')}}</router-link></li>
          </mdbCollapse>
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-home fa-fw']" :toggleText="['', $t('app.site')]" closeTarget="sidebar">
            <li><router-link to="/sites">{{$t('app.site_list')}}</router-link></li>
            <li><router-link to="/sites/view">{{$t('app.site_view')}}</router-link></li>
          </mdbCollapse>
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-users fa-fw']" :toggleText="['', $t('app.user')]" closeTarget="sidebar">
            <li><router-link to="/users">{{$t('app.user_list')}}</router-link></li>
            <li><router-link to="/roles">{{$t('app.role_list')}}</router-link></li>
          </mdbCollapse>
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-map-marker-alt fa-fw']" :toggleText="['', $t('app.location')]" closeTarget="sidebar">
            <li><router-link to="/locations">{{$t('app.location_list')}}</router-link></li>
            <li><router-link to="/devices">{{$t('app.device_list')}}</router-link></li>
          </mdbCollapse>
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-laptop fa-fw']" :toggleText="['', $t('app.device_model')]" closeTarget="sidebar">
            <li><router-link to="/device_models">{{$t('app.device_model_list')}}</router-link></li>
            <li><router-link to="/device_types">{{$t('app.device_type_list')}}</router-link></li>
          </mdbCollapse>
          <mdbCollapse :togglers="2" :toggleTag="['i', 'a']" :toggleClass="['fa fa-cog fa-fw']" :toggleText="['', $t('app.settings')]" closeTarget="sidebar">
            <li><router-link to="/settings">{{$t('app.settings')}}</router-link></li>
          </mdbCollapse>
        </mdbCardBody>
      </mdbCard>

      <mdbNavbarNav right>
        <mdbDropdown tag="li" class="nav-item" id="dropdown-admin">
          <mdbDropdownToggle tag="a" navLink slot="toggle" waves-fixed>
            <i class="fa fa-user"/>
            <strong>{{ currentUser }}</strong>
          </mdbDropdownToggle>

          <!-- 登入時 Menu -->
          <mdbDropdownMenu v-if="currentUser" right>
            <mdbDropdownItem to="/">{{$t('app.home')}}</mdbDropdownItem>
            <mdbDropdownItem>{{$t('app.account')}}</mdbDropdownItem>
            <mdbDropdownItem>{{$t('app.password')}}</mdbDropdownItem>
            <mdbDropdownItem @click="signOut">{{$t('app.sign_out')}}</mdbDropdownItem>
          </mdbDropdownMenu>

          <!-- 未登入 Menu -->
          <mdbDropdownMenu v-else right>
            <mdbDropdownItem to="/">{{$t('app.home')}}</mdbDropdownItem>
            <mdbDropdownItem @click="changeStatus('signInModal')">{{$t('app.sign_in')}}</mdbDropdownItem>
            <mdbDropdownItem @click="changeStatus('signUpModal')">{{$t('app.sign_up')}}</mdbDropdownItem>
          </mdbDropdownMenu>
        </mdbDropdown>
      </mdbNavbarNav>
    </mdbNavbar>

    <!-- 登入頁面 -->
    <mdbModal v-show="signInModal" @close="changeStatus('signInModal')">
      <mdbModalHeader class="text-center">
        <mdbModalTitle tag="h4" bold class="w-100">{{$t('app.sign_in')}}</mdbModalTitle>
      </mdbModalHeader>
      <form @submit.prevent="signIn">
        <mdbModalBody class="mx-3 grey-text">
          <mdbInput label="Your email" icon="envelope" type="email" class="mb-5" v-model="signInParams.user.email"/>
          <mdbInput label="Your password" icon="lock" type="password" v-model="signInParams.user.password"/>
          <a href="#">忘記密碼?</a>
        </mdbModalBody>
        <mdbModalFooter center>
          <mdbBtn type="submit">{{$t('app.sign_in')}}</mdbBtn>
          <mdbBtn type="button" color="primary" @click="changeStatus('signInModal')">{{$t('app.cancel')}}</mdbBtn>
        </mdbModalFooter>
      </form>
    </mdbModal>

    <!-- 註冊頁面 -->
    <mdbModal v-show="signUpModal" @close="changeStatus('signUpModal')">
      <mdbModalHeader class="text-center">
        <mdbModalTitle tag="h4" bold class="w-100">{{$t('app.sign_up')}}</mdbModalTitle>
      </mdbModalHeader>
      <mdbModalBody class="mx-3 grey-text">
        <mdbInput label="Your name" icon="user" class="mb-5"/>
        <mdbInput label="Your email" icon="envelope" type="email" class="mb-5"/>
        <mdbInput label="Your password" icon="lock" type="password"/>
      </mdbModalBody>
      <mdbModalFooter center>
        <mdbBtn color="deep-orange">{{$t('app.sign_up')}}</mdbBtn>
      </mdbModalFooter>
    </mdbModal>


    <main>
      <mdbAlert v-if="alert" :color="alert.status" @closeAlert="closeAlert" dismiss>
        {{ alert.message }}
      </mdbAlert>

      <transition name="fade" mode="out-in">
        <router-view/>
      </transition>
    </main>

    <mdbFooter color="stylish-color">
      <p class="footer-copyright mb-0 py-3 text-center">
        &copy; {{new Date().getFullYear()}} Copyright:
        <a href="#">{{$t('app.company')}}</a>
        <a @click="changeLang('EN')">{{$t('app.english')}}</a>
        <a @click="changeLang('TC')">{{$t('app.t_chinese')}}</a>
      </p>
    </mdbFooter>

    <!-- 讀取圖示 -->
    <div class="loading" v-if="loading">
      <img src="/static/loading.gif">
    </div>
  </div>
</template>

<script>
import {
  mdbNavbar,
  mdbNavbarBrand,
  mdbNavbarNav,
  mdbCard,
  mdbCardBody,
  mdbCollapse,
  mdbDropdown,
  mdbDropdownToggle,
  mdbDropdownMenu,
  mdbDropdownItem,
  mdbModal,
  mdbModalHeader,
  mdbModalTitle,
  mdbModalBody,
  mdbModalFooter,
  mdbInput,
  mdbAlert,
  mdbBtn,
  mdbFooter
} from "mdbvue";

export default {
  name: "app",
  components: {
    mdbNavbar,
    mdbNavbarBrand,
    mdbNavbarNav,
    mdbCard,
    mdbCardBody,
    mdbCollapse,
    mdbDropdown,
    mdbDropdownToggle,
    mdbDropdownMenu,
    mdbDropdownItem,
    mdbModal,
    mdbModalHeader,
    mdbModalTitle,
    mdbModalBody,
    mdbModalFooter,
    mdbInput,
    mdbAlert,
    mdbBtn,
    mdbFooter
  },
  data() {
    return {
      showMenu: false,
      signInModal: false,
      signUpModal: false,
      signInParams: {
        user: {
          email: null,
          password: null
        }
      }
    };
  },
  computed: {
    currentUser() {
      return this.$store.state.app.currentUser;
    },
    alert() {
      return this.$store.state.app.alert;
    },
    loading() {
      return this.$store.state.app.loading;
    },
    sidebarBtnStyle() {
      if (this.showMenu) return {marginLeft: '200px'};
    },
    sidebarBtnClass() {
      if (this.showMenu) return 'animated fadeInLeft';
    }
  },
  mounted() {
    this.sidebarHideEvent();
  },
  methods: {
    changeLang(lang) {
      this.$i18n.locale = lang;
    },
    sidebarHideEvent() {
      var c = this;
      var main = document.querySelector('main');

      main.addEventListener('click', function() {
        c.showMenu = false;
      });
    },
    changeStatus(data) {
      this[data] = !this[data];
    },
    signIn() {
      var c = this;
      this.$store.commit('app/isLoading', true);

      this.$axios.post('/apis/users/sign_in', this.signInParams)
        .then(function() {
          location.reload();
        })
        .catch(function(error) {
          c.$store.commit('app/alertMessage', {
            status: 'danger',
            message: error.response.data.message
          });

          c.$store.commit('app/isLoading', false);
        })
        .finally(function() {
          c.changeStatus('signInModal');
        });
    },
    signOut() {
      var c = this;
      this.$store.commit('app/isLoading', true);

      this.$axios.delete('/apis/users/sign_out')
        .then(function() {
          location.href = '/';

          c.$store.commit('app/isLoading', false);
        });
    },
    closeAlert() {
      this.$store.commit('app/closeAlert');
    }
  }
};
</script>

<style lang="scss" scoped>
#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  justify-content: space-between;
}

.fade-leave-active, .fade-enter-active {
  transition-duration: 0.5s;
  transition-property: opacity;
  opacity: 0;
}

#sidebar {
  height: 0px;
  position: absolute;
  top: 0px;
  left: 0px;
}

#sidebar-body {
  overflow: auto;
  width: 200px;
  height: 100vh;
  position: absolute;

  > div {
    padding-top: 10px;

    li {
      margin-left: 5px;
      color: #2e2e2e;
      font-size: 15px;

      > a {
        color: white;
      }
    }
  }
}

#dropdown-admin {
  a {
    text-align: center;
  }

  .dropdown-toggle::after {
    display: none;
  }
}

.alert {
  text-align: center;
}

main {
  margin-Top: 56px;
}

.loading {
  position: fixed;
  top: 0px;
  left: 0px;
  background: #000;
  width: 100%;
  height: 100%;
  z-index: 9999;
  opacity: 0.3;

  img {
    margin: calc((100vh - 300px) / 2) calc((100vw - 200px) / 2);
  }
}
</style>