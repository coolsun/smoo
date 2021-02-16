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
                        <h3>{{ $t('footer.overview') }}</h3>
                        <ul>
                            <li><a href="/">{{ $t('footer.home') }}</a></li>
                            <li><a href="about">{{ $t('footer.about') }}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.featured') }}</h3>
                        <ul>
                            <li><a href="medical">{{ $t('footer.medical') }}</a></li>
                            <li><a href="memorial">{{ $t('footer.memorial') }}</a></li>
                            <li><a href="emergency">{{ $t('footer.emergency') }}</a></li>
                            <li><a href="animal-rescue">{{ $t('footer.animal-rescue') }}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>{{ $t('footer.featured') }}</h3>
                        <ul>
                            <li><a href="chairty">{{ $t('footer.chairty') }}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-6 col-sm-6">
                    <div class="footer-nav">
                        <h3>Help or Question</h3>
                        <ul>
                            <li><a href="contact">{{ $t('footer.contact') }}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</template>