<template>
<div>
    <!-- Preloader 
    <div class="preloader">
        <img src="@/assets/images/preloader.png" alt="">
        <h3>101 Moo</h3>
    </div> 
    
      Preloader -->
    <!--Header Top-->
    <mdb-modal :show="modal" @close="modal = false">
      <mdb-tab tabs justify class="darken-3">
        <mdb-tab-item>
          <mdb-icon icon="user" class="mr-1"/>{{ $t('sign_in.login') }}
        </mdb-tab-item>
      </mdb-tab>
      <mdb-modal-body class="mx-3">
        <mdb-input class="mb-5" :label="$t('sign_in.your_email')" icon="envelope" type="email" v-model="email"/>
        <mdb-input :label="$t('sign_in.your_password')" icon="lock" type="password" v-model="password"/>
        <div class="options" style="text-align: right;">
          <p><router-link to="#" @click="forgetPassword">{{ $t('sign_in.forget_password') }} ?</router-link></p>
        </div>
        <div class="mt-2 text-center">
          <mdb-btn class="btn-emt btn-block" @click="signIn">
            {{ $t('sign_in.login') }}<mdb-icon icon="sign-in-alt" class="ml-1"/>
          </mdb-btn>
        </div>
      </mdb-modal-body>
      <mdb-modal-footer center>
        <div class="options mt-1">
          <p>{{ $t('sign_in.not_a_member')}}</p>
        </div>
        <div class="options mt-1" @click="modal=false">
          <router-link class="ml-1" :to="{ name: 'sign-up'}">{{ $t('sign_in.sign_up')}}</router-link>
        </div>
        <mdb-btn outline="info" class="ml-auto" @click.native="modal = false">{{ $t('sign_in.close') }}</mdb-btn>
      </mdb-modal-footer>
    </mdb-modal>  
    <div class="header-top dark-green-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-4">
                    <div class="single-header-top">
                        <ul>                        
                            <!--li><mdb-btn class="btn-sm btn-emt" @click.native="goToExplore"><router-link to="explore">{{ $t('header.explore') }}</router-link></mdb-btn></li>
                            <li><mdb-btn class="btn-sm btn-emt" @click.native="goToStartProject">{{ $t('header.start_project') }}</mdb-btn></li-->
                            <li><mdb-btn class="btn-sm btn-emt" ><router-link to="/explore">{{ $t('header.explore') }}</router-link></mdb-btn></li>
                            <li><mdb-btn class="btn-sm btn-emt" @click="goToStartProject">{{ $t('header.start_project') }}</mdb-btn></li>
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
                          <mdb-btn v-if="!$store.state.isLoggedIn" class="btn-sm btn-emt" @click.native="modal = true">{{ $t('app.sign_in') }}</mdb-btn>
                          <li><router-link to="" @click.native="search"><i class="fa fa-search"></i></router-link></li>
                          <input v-model="searchInput" class="form-control" type="text" :placeholder="$t('app.Search')" :aria-label="$t('app.Search')" style="display: inline; width: 45%; margin-left: 4%;"/>
                          <li v-if="$store.state.isLoggedIn" style="vertical-align: middle; margin-left: 0;">
                            <mdb-dropdown v-if="$store.state.isLoggedIn" tag="li" class="nav-item nav-link">
                              <mdb-dropdown-toggle tag="a" navLink color="primary-bg" slot="toggle" waves-fixed>
                                  <img src="@/assets/images/commenter3.png" alt="" style="width: 2rem; margin: .2rem; border-radius: 50px;"/>
                              </mdb-dropdown-toggle>
                              <mdb-dropdown-menu color="primary-bg">
                                <mdb-dropdown-item router to="/my-account">{{ $t('header.my-account') }}</mdb-dropdown-item>
                                <mdb-dropdown-item router to="/my-donation">{{ $t('header.my-donation') }}</mdb-dropdown-item>
                                <mdb-dropdown-item router to="/my-campaign">{{ $t('header.my-campaign') }}</mdb-dropdown-item>
                                <mdb-dropdown-item @click.native="signOut">{{ $t('app.sign_out') }}</mdb-dropdown-item>
                              </mdb-dropdown-menu>
                            </mdb-dropdown> 
                          </li>
                        </ul>
                    </div>
                </div>
            </div> 
        </div>
    </div><!--/Header Top-->
  
    <!--Header Area-->
          <mdb-navbar class="header-area primary-bg lighten-4 white-text" expand="xl" togglerIcon="" animated animation="1">
            <!-- Navbar brand -->
            <mdb-navbar-brand><router-link to="/"><img src="@/assets/images/logo.png" class="d-inline-block align-top" alt="" width="30%"></router-link>
            </mdb-navbar-brand>
            <mdb-navbar-toggler color="primary">
              <mdb-navbar-nav right>
                <mdb-dropdown tag="li" class="nav-item nav-link">
                  <mdb-dropdown-toggle
                    tag="a"
                    navLink
                    color="primary-bg"
                    slot="toggle"
                    waves-fixed
                    >{{ $t('header.featured') }}</mdb-dropdown-toggle>
                  <mdb-dropdown-menu color="primary-bg">
                    <mdb-dropdown-item @click="goToEmergency">{{ $t('header.emergency') }}</mdb-dropdown-item>
                    <mdb-dropdown-item @click="goToMemorial">{{ $t('header.memorial') }}</mdb-dropdown-item>
                    <mdb-dropdown-item @click="goToAnimalRescue">{{ $t('header.animal-rescue') }}</mdb-dropdown-item>
                    <mdb-dropdown-item @click="goToMedical">{{ $t('header.medical') }}</mdb-dropdown-item>
                    <mdb-dropdown-item @click="goToCharity">{{ $t('header.charity') }}</mdb-dropdown-item>
                  </mdb-dropdown-menu>
                </mdb-dropdown>                      
                <mdb-nav-item router to="/" waves-fixed class="nav-item nav-link">{{ $t('header.101moo') }}</mdb-nav-item>
                <mdb-nav-item router to="/about" waves-fixed class="nav-item nav-link">{{ $t('header.about') }}</mdb-nav-item>
       
                <mdb-nav-item router to="contact" waves-fixed class="nav-item nav-link">{{ $t('header.contact') }}</mdb-nav-item>
              </mdb-navbar-nav>
            </mdb-navbar-toggler>

    </mdb-navbar>
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
        modal: false,
        email: null,
        password: null,
        searchInput: "",
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
      signIn() {
        let signInData = {
          user: {
            email: this.email,
            password: this.password
            //email: "aa",
            //password: "bb"
          }
        }
        console.log('email:'+this.email+', password:'+this.password)
        this.$axios.post('/api/login', signInData)
        .then((res) => {
          // alert: success
          console.log("setAuthToken:"+res.headers['authorization'])
          this.$store.commit('setAuthToken', res.headers['authorization']);
          this.$store.state.isLoggedIn = true;
          // res.data.data is not a typo
          this.$store.state.currentUserID = res.data.data.id;
          this.modal = false;
        })
        .catch(error => {
          // alert: error
          console.log(error.message)
        })
        .finally( () => {
          this.modal = false;
        })
        
      },
      signOut() {
        this.$store.state.isLoggedIn = false;
        this.$router.push({ name: 'home'});
        window.location.reload();
      },
      forgetPassword() {
          console.log('Forget password');
      },
      search() {
        console.log("search: " + this.searchInput);
        let newSearch = {
            search: this.searchInput
        };
        this.$axios.post('/api/search', newSearch)
        .then(() => {
            // alert: success
            console.log("Search succeeded!");
        })
        .catch(error => {
            // alert: error
            console.log(error.message);
        })
      }, 
      goToExplore() {
        this.$router.push({ name: 'explore'});
      },
      goToStartProject() {
        this.$router.push({ name: 'start-a-project'});
      },
      goToSignUp() {
        this.modal = false;
        this.$router.push({ name: 'sign-up'});
      },
      goToEmergency() {
        this.$store.state.currentCategory = '1';
        this.$router.push({name: 'explore'});
      },
      goToMemorial() {
        this.$store.state.currentCategory = '2';
        this.$router.push({name: 'explore'});
      },
      goToAnimalRescue() {
        this.$store.state.currentCategory = '3';
        this.$router.push({name: 'explore'});
      },
      goToMedical() {
        this.$store.state.currentCategory = '4';
        this.$router.push({name: 'explore'});
      },
      goToCharity() {
        this.$store.state.currentCategory = '5';
        this.$router.push({name: 'explore'});
      }
    }  
  };
</script>
