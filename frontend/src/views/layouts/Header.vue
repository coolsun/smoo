<template>
<div>
    <!-- Preloader 
    <div class="preloader">
        <img src="@/assets/images/preloader.png" alt="">
        <h3>101 Moo</h3>
    </div> 
    
      Preloader -->
    <!--Header Top-->
    <div class="header-top dark-green-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <div class="single-header-top">
                        <ul>                        
                            <li><mdb-btn class="btn-sm btn-emt" ><a href="explore">{{ $t('header.explore') }}</a></mdb-btn></li>
                            <li><mdb-btn class="btn-sm btn-emt" ><a href="start-a-project">{{ $t('header.start_project') }}</a></mdb-btn></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-7 col-sm-5">
                    <div class="single-header-top" >
                        <p>{{ $t('header.help') }}</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-2 col-sm-3">
                    <div class="single-header-top last">
                        <ul>
                            <mdb-btn class="btn-sm btn-emt" @click.native="modal = true">{{ $t('app.sign_in') }}</mdb-btn>
                              <mdb-modal :show="modal" @close="modal = false">
                                <mdb-tab tabs justify class="light-blue darken-3">
                                  <mdb-tab-item>
                                    <mdb-icon icon="user" class="mr-1"/>{{ $t('sign_in.login') }}
                                  </mdb-tab-item>
                                </mdb-tab>
                                <mdb-modal-body class="mx-3">
                                  <mdb-input class="mb-5" :label="$t('sign_in.your_email')" icon="envelope" type="email" v-model="email"/>
                                  <mdb-input :label="$t('sign_in.your_password')" icon="lock" type="password" v-model="password"/>
                                  <div class="mt-2 text-center">
                                    <mdb-btn color="info" @click="signIn">
                                      {{ $t('sign_in.login') }}<mdb-icon icon="sign-in-alt" class="ml-1"/>
                                    </mdb-btn>
                                    <mdb-btn color="info" @click="modal = false">
                                      <router-link class="" :to="{ name: 'SignUp'}" tag="button">{{ $t('sign_in.sign_up')}}</router-link>
                                    </mdb-btn>
                                  </div>
                                </mdb-modal-body>
                                <mdb-modal-footer center>
                                  <div class="options mt-1">
                                    <p><a href="#" @click="forgetPassword">{{ $t('sign_in.forget_password') }} ?</a></p>
                                  </div>
                                  <mdb-btn outline="info" class="ml-auto" @click.native="modal = false">{{ $t('sign_in.close') }}</mdb-btn>
                                </mdb-modal-footer>
                              </mdb-modal>   
                            <li><a href=""><i class="fa fa-search"></i></a></li>

                        </ul>
                    </div>
                </div>
            </div> 
        </div>
    </div><!--/Header Top-->
  
    <!--Header Area-->
      <mdb-container>
          <mdb-navbar class="header-area primary-bg mt-2 lighten-4" expand="xl" togglerIcon="" animated animation="1">
            <!-- Navbar brand -->
            <mdb-navbar-brand><a href="/"><img src="@/assets/images/logo.png" class="d-inline-block align-top" alt="" width="30%"></a>
            </mdb-navbar-brand>
            <mdb-navbar-toggler>
              <mdb-navbar-nav right>
                <mdb-nav-item href="/" waves-fixed>{{ $t('header.home') }}</mdb-nav-item>
                <mdb-nav-item href="about" waves-fixed>{{ $t('header.about') }}</mdb-nav-item>
                <mdb-dropdown tag="li" class="nav-item">
                  <mdb-dropdown-toggle
                    tag="a"
                    navLink
                    color="primary-bg"
                    slot="toggle"
                    waves-fixed
                    >{{ $t('header.featured') }}</mdb-dropdown-toggle>
                  <mdb-dropdown-menu color="primary-bg">
                    <mdb-dropdown-item href="emergency">{{ $t('header.emergency') }}</mdb-dropdown-item>
                    <mdb-dropdown-item href="memorial">{{ $t('header.memorial') }}</mdb-dropdown-item>
                    <mdb-dropdown-item href="animal-rescue">{{ $t('header.animal-rescue') }}</mdb-dropdown-item>
                    <mdb-dropdown-item href="medical">{{ $t('header.medical') }}</mdb-dropdown-item>
                    <mdb-dropdown-item href="charity">{{ $t('header.charity') }}</mdb-dropdown-item>
                  </mdb-dropdown-menu>
                </mdb-dropdown>
                <mdb-nav-item href="contact" waves-fixed>{{ $t('header.contact') }}</mdb-nav-item>
              </mdb-navbar-nav>
            </mdb-navbar-toggler>

          </mdb-navbar>
      </mdb-container>
</div>
</template>

<script>
import { 
  mdbModal, 
  mdbTab, 
  mdbTabItem, 
  mdbModalBody, 
  mdbInput, 
  mdbModalFooter, 
  mdbBtn, 
  mdbIcon, 
  mdbContainer,
  mdbNavbar,
  mdbNavbarBrand,
  mdbNavbarNav,
  mdbNavbarToggler,
  mdbNavItem,
  mdbDropdown,
  mdbDropdownItem,
  mdbDropdownMenu,
  mdbDropdownToggle
  } from 'mdbvue'
  export default {
    components: {
      mdbModal,
      mdbTab,
      mdbTabItem,
      mdbModalBody,
      mdbInput,
      mdbModalFooter,
      mdbBtn,
      mdbIcon,
      mdbContainer,
      mdbNavbar,
      mdbNavbarBrand,
      mdbNavbarNav,
      mdbNavbarToggler,
      mdbNavItem,
      mdbDropdown,
      mdbDropdownItem,
      mdbDropdownMenu,
      mdbDropdownToggle
  },
    data() {
      return {
        modal: false
      };
    },
    methods: {
      openSignInModal() {
        this.showSignIn = true;
        console.log("showSignIn=true");
      },
      changeLang() {
        this.$i18n.locale = this.$i18n.locale == 'zh-tw' ? 'en' : 'zh-tw';
        console.log("changeLang()");
      },
    }  
  };
</script>
