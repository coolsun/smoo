<template>
  <div>
    <section class="hero-section">
        <div class="hero-area-1 owl-carousel" id="hero-slideshow" ref="hero-slideshow">
            <div class="single-hero dark-overlay" :style="{'background-image': 'url(' + require('@/assets/images/hero-1.jpg') + ') no-repeat'}">
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8">
                    <div class="hero-sub">
                        <div class="table-cell">
                        <div class="hero-left">
                            <h1>It is good to be blessed. It is better to be a blessing</h1>
                            <p>Much evil soon high in hope do view. Out may few northward believing <br> attempted. Yet timed being songs marry one defer men our.</p>
                            <a href="" class="bttn-mid btn-fill mr-20">Read More</a>
                            <a href="" class="bttn-mid btn-fill">About us</a>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
            <div class="single-hero dark-overlay" :style="{'background-image': 'url(' + require('@/assets/images/hero-2.jpg') + ') no-repeat'}">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                        <div class="hero-sub">
                            <div class="table-cell">
                            <div class="hero-left">
                                <h1>Start helping them for a day</h1>
                                <p>Much evil soon high in hope do view. Out may few northward believing <br> attempted. Yet timed being songs marry one defer men our.</p>
                                <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">Donate now</router-link>
                                <a href="" class="bttn-mid btn-fill">About us</a>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single-hero dark-overlay" :style="{'background-image': 'url(' + require('@/assets/images/hero-3.jpg') + ') no-repeat'}">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                        <div class="hero-sub">
                            <div class="table-cell">
                            <div class="hero-left">
                                <h1>Make them more happy</h1>
                                <p>Much evil soon high in hope do view. Out may few northward believing <br> attempted. Yet timed being songs marry one defer men our.</p>
                                <a href="" class="bttn-mid btn-fill mr-20">Read More</a>
                                <a href="" class="bttn-mid btn-fill">Learn more</a>
                            </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/Hero Area-->

    <!--Causes Area -->
    <section class="causes-area section-padding-2 white-bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                    <div class="section-title">
                        <h2>Recent Causes</h2>
                    </div>
                </div>
            </div>
            <div class="text-center mb-40 wow fadeInUp" data-wow-delay="0.4s">
                <ul class="portfolio-filter">
                    <li class="active"><a href="#" data-filter="*"> All</a></li>
                    <li><a href="#" data-filter=".cat1">Medical</a></li>
                    <li><a href="#" data-filter=".cat2">Water</a></li>
                    <li><a href="#" data-filter=".cat3">Study</a></li>
                    <li><a href="#" data-filter=".cat4">Design & tech</a></li>
                    <li><a href="#" data-filter=".cat2">Film</a></li>
                </ul>
            </div>

            <div class="row portfolio portfolio-gallery column-3 gutter wow fadeInUp" data-wow-delay="0.5s">

                <div class="portfolio-item cat1 cat3">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/1.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat2 cat4 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/2.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>75% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Anything embarrassing hidden</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat1 cat5 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/3.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Latin literature from 45</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat3 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/4.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Many desktop publishing</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat1 cat2">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/5.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Anticipate for generation</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat3 cat4 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/6.jpg" alt="">
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Lorem Ipsum is that</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/Causes Area -->

    <!-- Services Area -->
    <section class="services-area section-padding-2 light-overlay"  :style="{'background-image': 'url(' + require('@/assets/images/hero-4.jpg') + ') no-repeat'}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                    <div class="section-title">
                        <h2>Our Services</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="single-service">
                        <i class="flaticon-settings"></i>
                        <h3>Easy Setup</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="single-service">
                        <i class="flaticon-like"></i>
                        <h3>Credibility</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="single-service">
                        <i class="fa fa-dollar"></i>
                        <h3>Easy Donate</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="single-service">
                        <i class="fa fa-search"></i>
                        <h3>Check Balance</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="single-service">
                        <i class="fa fa-cloud-download"></i>
                        <h3>Receipt Download</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
                    <div class="single-service">
                        <i class="fa fa-fighter-jet"></i>
                        <h3>Quick Search</h3>
                        <p>Do an high room so in paid. Up on cousin ye dinner should in. Stood tried walls manor truth shy</p>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /Services Area -->

    <!--Features Area -->
    <section class="features-area section-padding-2 gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="single-features">
                        <h3>Please donate us</h3>
                        <p>New the her nor case that lady paid read. Invitation friendship travelling eat everything the out two.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="single-features active">
                        <h3>Become a Volunteer</h3>
                        <p>New the her nor case that lady paid read. Invitation friendship travelling eat everything the out two.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="single-features">
                        <h3>Quick Delivery</h3>
                        <p>New the her nor case that lady paid read. Invitation friendship travelling eat everything the out two.</p>
                    </div>
                </div>
            </div>   
        </div>
    </section><!--/Features Area -->

    <!--Causes Area -->
    <section class="causes-area section-padding-2">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                    <div class="section-title">
                        <h2>Featured Causes</h2>
                    </div>
                </div>
            </div>

            <div class="row portfolio portfolio-gallery column-3 gutter">

                <div class="portfolio-item cat1 cat3 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/7.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>

                <div class="portfolio-item cat2 cat4 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/8.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>

                <div class="portfolio-item cat1 cat5 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/9.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>

                <div class="portfolio-item cat3 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/10.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>

                <div class="portfolio-item cat1 cat2 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/11.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>

                <div class="portfolio-item cat3 cat4 wow fadeInUp" data-wow-delay="0.9s">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/12.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress red-bg-2">
                            <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><span>75%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>$450 Pledged</span>
                            <span>5 Days ago</span>
                            <span>45% Funded</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">Denote Simple Fat Denied</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        
                        <a href="" class="bttn-small btn-wht">Donate now</a>
                    </div>
                </div>
            </div>
        </div>
    </section><!--/Causes Area -->

    <!--About Section-->
    <section class="about-area bg-white">
        <div class="about-content mid-bg-gray wow fadeInUp" data-wow-delay="0.4s">
            <div class="about-content-inner-2">
                <div class="section-title">
                    <h2>About Our World Wide Community</h2>
                </div>
                <p>Raising say express had chiefly detract demands she. Quiet led own cause three him. Front no party young abode state up. Saved he do fruit woody of to. Met defective are allowance two perceived listening consulted contained. It chicken oh colonel pressed. <br> <br> He improve started no we manners however effects. Prospect humoured mistress to by proposal marianne attended. Simplicity the far admiration preference everything.</p>
                <ul>
                    <li><i class="fa fa-angle-double-right"></i>Fusce nonummy neque</li>
                    <li><i class="fa fa-angle-double-right"></i>Aipiscing purus praesent</li>
                    <li><i class="fa fa-angle-double-right"></i>Proin id sem rutrum pra</li>
                    <li><i class="fa fa-angle-double-right"></i>Exercitationem eget dolor</li>
                </ul>                
            </div>
        </div>
        <!--
        <div class="about-left dark-overlay wow fadeInUp" data-wow-delay="0.4s" style="background: url('@/assets/images/about-bg.jpg') no-repeat center / cover;">
        -->
        <div class="about-left dark-overlay wow fadeInUp" data-wow-delay="0.4s" :style="{'background-image': 'url(' + require('@/assets/images/about-bg.jpg') + ') no-repeat center / cover'}">
        
        
            <div class="left-img-wrap">
                <a href="https://www.youtube.com/watch?v=GT6-H4BRyqQ" class="video-popup"><img src="@/assets/images/play-button.png" alt=""></a>
            </div>
        </div>
    </section><!--/About Section-->


    <!-- Review Area -->
    <section class="review-area section-padding-2 white-bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                    <div class="section-title">
                        <h2>Happy Donors Say</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="reviews owl-carousel">
                        <div class="single-review">
                            <div class="reviewer-thumb">
                                <img src="@/assets/images/reviwer.png" alt="">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <h3>Mario Speedwagon</h3>
                            <p>Entire any had depend and figure winter. Change stairs and men likely wisdom new happen piqued six. Now taken him timed world get. Enjoyed married an feeling delight pursuit as offered.</p>
                        </div>
                        <div class="single-review">
                            <div class="reviewer-thumb">
                                <img src="@/assets/images/reviwer-2.png" alt="">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <h3>Yolanda Woods</h3>
                            <p>Entire any had depend and figure winter. Change stairs and men likely wisdom new happen piqued six. Now taken him timed world get. Enjoyed married an feeling delight pursuit as offered.</p>
                        </div>
                        <div class="single-review">
                            <div class="reviewer-thumb">
                                <img src="@/assets/images/reviwer-3.png" alt="">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <h3>Yolanda Woods</h3>
                            <p>Entire any had depend and figure winter. Change stairs and men likely wisdom new happen piqued six. Now taken him timed world get. Enjoyed married an feeling delight pursuit as offered.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /Review Area -->

    <!-- Counter Area -->
    <section class="counter-area section-padding-3 gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="single-counter">
                        <i class="flaticon-book"></i>
                        <h3 class="count"> 589</h3>
                        <h5>Happy Doners</h5>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="single-counter">
                        <i class="flaticon-glasses"></i>
                        <h3 class="count">245</h3>
                        <h5>Success Mission</h5>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="single-counter">
                        <i class="flaticon-settings"></i>
                        <h3 class="count">365</h3>
                        <h5>Volunteer Reached</h5>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="single-counter">
                        <i class="flaticon-paper-plane"></i>
                        <h3 class="count">125</h3>
                        <h5>Globalization Work</h5>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /Counter Area -->  

    <!-- Blog Area -->
    <section class="blog-area section-padding-2">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                    <div class="section-title">
                        <h2>Latest Update</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="single-blog">
                        <div class="blog-thumb">
                            <img src="@/assets/images/blog/1.jpg" alt="">
                            <div class="date">01 Jun 2019</div>
                        </div>
                        <div class="thumb-blog-content">
                            <h3><a href="">Remember Outweigh Do He Desirous No Cheerful</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="single-blog">
                        <div class="blog-thumb">
                            <img src="@/assets/images/blog/2.jpg" alt="">
                            <div class="date">01 Jun 2019</div>
                        </div>
                        <div class="thumb-blog-content">
                            <h3><a href="">Remember Outweigh Do He Desirous No Cheerful</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="single-blog">
                        <div class="blog-thumb">
                            <img src="@/assets/images/blog/3.jpg" alt="">
                            <div class="date">01 Jun 2019</div>
                        </div>
                        <div class="thumb-blog-content">
                            <h3><a href="">Remember Outweigh Do He Desirous No Cheerful</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- /Blog Area -->
  </div>
</template>



<script src="@/assets/js/jquery-3.2.1.min.js"></script>
<script src="@/assets/js/jquery-migrate.js"></script>

<script src="@/assets/js/owl.carousel.min.js"></script>

<script src="@/assets/js/magnific-popup.min.js"></script>
<script src="@/assets/js/imagesloaded.pkgd.min.js"></script>
<script src="@/assets/js/isotope.pkgd.min.js"></script>
<script src="@/assets/js/bootstrap.min.js"></script>

<script src="@/assets/js/waypoints.min.js"></script>
<script src="@/assets/js/jquery.counterup.min.js"></script>
<script src="@/assets/js/wow.min.js"></script>
<script src="@/assets/js/scrollUp.min.js"></script>

<script src="@/assets/js/script.js"></script>
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

} from 'mdbvue';

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
    };
  },
  created() {
    this.$notify.info({message: 'Welcome to 101Moo!', position: 'top center', timeOut: 5000});
  },
  mounted() {
    this.$refs.hero-slideshow.owlCarousel({
    //Autoplay
    autoplay : 5000,
    stopOnHover : false
    });
  }
};

</script>
