<template>
    <!--Causes Area -->
    <section class="explore-area section-padding-2">
        <div class="container">
            <h2>{{ $t('header.my-donation') }}</h2>
            <div class="explore-search row">
                <div class="col-sm">
                    <input type="text" placeholder="Category">
                </div>
                <div class="col-sm">
                    <input type="text" placeholder="Start date">
                </div>
                <div class="col-sm">
                    <input type="text" placeholder="End date">
                </div>
                <div class="col-">
                        <button type="submit" class="bttn-mid btn-fill-2">Search</button>                   
                </div>
            </div>

            <div class="row portfolio portfolio-gallery column-3 gutter wow fadeInUp" data-wow-delay="0.5s">

                <div class="portfolio-item cat1 cat3">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/7.jpg" alt="">
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
        
                        </div>
                        <p>Start raising money now!</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'start-a-project'}" tag="button">Start New Campaign</router-link>
                    </div>
                </div>

                <div class="portfolio-item cat2 cat4 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/8.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress light-blue-bg">
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
                            <h3><a href="">Anything embarrassing hidden</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="btn btn-edit px-3" :to="{ name: 'my-donation'}" tag="button"><i class="fas fa-edit" aria-hidden="true"></i></router-link>
                        <button type="button" class="btn btn-danger px-3"><i class="fas fa-times-circle" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-donors px-3"><i class="fas fa-user-friends" aria-hidden="true"></i></button>                   
                      </div>
                  </div>
                  <div class="portfolio-item cat3 cat4 ">
                      <div class="item-thumb">
                          <img src="@/assets/images/portfolios/12.jpg" alt="">
                          <div class="item-tag">By Petey Cruiser</div>
                          <div class="progress light-blue-bg">
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
                              <h3><a href="">Lorem Ipsum is that</a></h3>
                          </div>
                          <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                          <router-link class="btn btn-edit px-3" :to="{ name: 'my-donation'}" tag="button"><i class="fas fa-edit" aria-hidden="true"></i></router-link>
                          <button type="button" class="btn btn-danger px-3"><i class="fas fa-times-circle" aria-hidden="true"></i></button>
                          <button type="button" class="btn btn-donors px-3"><i class="fas fa-user-friends" aria-hidden="true"></i></button>    
                      </div>
                  </div>
                  <div class="portfolio-item cat2 cat4 ">
                      <div class="item-thumb">
                          <img src="@/assets/images/portfolios/8.jpg" alt="">
                          <div class="item-tag">By Petey Cruiser</div>
                          <div class="progress light-blue-bg">
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
                              <h3><a href="">Anything embarrassing hidden</a></h3>
                          </div>
                          <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                          <router-link class="btn btn-edit px-3" :to="{ name: 'my-donation'}" tag="button"><i class="fas fa-edit" aria-hidden="true"></i></router-link>
                          <button type="button" class="btn btn-danger px-3"><i class="fas fa-times-circle" aria-hidden="true"></i></button>
                          <button type="button" class="btn btn-donors px-3"><i class="fas fa-user-friends" aria-hidden="true"></i></button>    
                      </div>
                  </div>
                  <div class="portfolio-item cat2 cat4 ">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/8.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress light-blue-bg">
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
                            <h3><a href="">Anything embarrassing hidden</a></h3>
                        </div>
                        <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an.</p>
                        <router-link class="btn btn-edit px-3" :to="{ name: 'my-donation'}" tag="button"><i class="fas fa-edit" aria-hidden="true"></i></router-link>
                        <button type="button" class="btn btn-danger px-3"><i class="fas fa-times-circle" aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-donors px-3"><i class="fas fa-user-friends" aria-hidden="true"></i></button>    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Causes Area -->
</template>
<script>
export default {
  name: "DonationHistory",
  components: {
  },
  data() {
    return {
    };
  },
};
</script>