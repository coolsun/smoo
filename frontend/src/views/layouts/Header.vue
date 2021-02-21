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
    <header class="header-area primary-bg">
        <nav class="navbar sticky-top navbar-expand-lg main-menu">
            <div class="container">

                <a class="navbar-brand" href="/"><img src="@/assets/images/logo.png" class="d-inline-block align-top" alt="" width="30%"></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="menu-toggle"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/">{{ $t('header.home') }}</a></li>
                        <li class="nav-item"><a class="nav-link" href="about">{{ $t('header.about') }}</a></li>
						<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ $t('header.featured') }}</a>
                            <div class="dropdown-menu collapse">
                                <a class="dropdown-item" href="emergency">{{ $t('header.emergency') }}</a>
                                <a class="dropdown-item" href="memorial">{{ $t('header.memorial') }}</a>
                                <a class="dropdown-item" href="animal-rescue">{{ $t('header.animal-rescue') }}</a>
                                <a class="dropdown-item" href="medical">{{ $t('header.medical') }}</a>
                                <a class="dropdown-item" href="charity">{{ $t('header.charity') }}</a>
                            </div>
                        </li>
                        <!--
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="about">{{ $t('header.about') }}</a>
                                <a class="dropdown-item" href="causes">{{ $t('header.causes') + ' 1' }}</a>
                                <a class="dropdown-item" href="causes2">{{ $t('header.causes') + ' 2' }}</a>
                                <a class="dropdown-item" href="causes-details">{{ $t('header.cause_details') }}</a>
                                <a class="dropdown-item" href="start-a-project">{{ $t('header.start_project') }}</a>
                                <a class="dropdown-item" href="blog">{{ $t('header.all_blogs') }}</a>
                                <a class="dropdown-item" href="blog-details">{{ $t('header.blog_details') }}</a>
                                <a class="dropdown-item" href="contact">{{ $t('header.contact_us') }}</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="blog" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="blog">{{ $t('header.all_blogs') }}</a>
                                <a class="dropdown-item" href="blog-details">{{ $t('header.blog_details') }}</a>
                            </div>
                        </li>
                        -->
                        <li class="nav-item"><a class="nav-link" href="contact">{{ $t('header.contact') }}</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header><!--/Header Area-->
</div>
</template>

<script>
import { mdbModal, mdbTab, mdbTabItem, mdbModalBody, mdbInput, mdbModalFooter, mdbBtn, mdbIcon } from 'mdbvue'
  export default {
    components: {
      mdbModal,
      mdbTab,
      mdbTabItem,
      mdbModalBody,
      mdbInput,
      mdbModalFooter,
      mdbBtn,
      mdbIcon
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
