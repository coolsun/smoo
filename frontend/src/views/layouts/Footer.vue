<template>
    <footer class="footer-area footer-padding light-overlay" :style="{'background-image': 'url(' + require('@/assets/images/footer-bg.jpg') + ') no-repeat'}">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="footer-widget">
                        <img src="@/assets/images/logo-2.png" alt="">
                        <p>{{ $t('footer.summary') }}</p>
                        <div class="footer-social">
                            <a href="" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="" class="youtube"><i class="fa fa-youtube"></i></a>
                            <a href="" class="pinterest"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.home') }}</h3>
                        <ul>
                            <li><router-link to="/">{{ $t('footer.101moo') }}</router-link></li>
                            <li><router-link to="about">{{ $t('footer.about') }}</router-link></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.featured') }}</h3>
                        <ul>
                            <li><router-link to="medical">{{ $t('footer.medical') }}</router-link></li>
                            <li><router-link to="memorial">{{ $t('footer.memorial') }}</router-link></li>
                            <li><router-link to="emergency">{{ $t('footer.emergency') }}</router-link></li>
                            <li><router-link to="animal-rescue">{{ $t('footer.animal-rescue') }}</router-link></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.more_featured') }}</h3>
                        <ul>
                            <li><router-link to="charity">{{ $t('footer.charity') }}</router-link></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.help_or_question') }}</h3>
                        <ul>
                            <li><router-link to="contact">{{ $t('footer.contact') }}</router-link></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</template>