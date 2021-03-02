<template>
    <!--Causes Area -->
    <section class="explore-area section-padding-2">
        <div class="container">
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
                    <button type="submit" class="bttn-mid btn-fill-2">{{ $t('explore.search') }}</button>                   
                </div>
            </div>

            <div class="row portfolio portfolio-gallery column-3 gutter wow fadeInUp" data-wow-delay="0.5s">

                <div v-for="campaign in campaigns" :key="campaign.id" class="portfolio-item">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/7.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress light-blue-bg">
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
                            <h3><a href="">{{ campaign.name }}</a></h3>
                        </div>
                        <p class="text-truncate" style="max-width: 100%">{{ campaign.description }}</p>
                        <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                    </div>
                </div>                
            </div>
        </div>
    </section>
    <!--/Causes Area -->
</template>

<script>

export default {
  name: "Explore",
  components: {
  },
  data() {
    return {
        campaigns: []
    };
  },
  created() {
      this.campaign();
  },
  methods: {
    campaign() {
        console.log("this.campaigns authToken:"+this.$store.state.authToken)
        // this.$axios.get('/api/campaigns', { headers: { 'Authorization': this.$store.state.authToken}})
        this.$axios.get('/api/campaigns/all_campaigns')
        .then((res) => {
            // alert: success
            this.campaigns = res.data;
            console.log("this.campaigns:"+this.campaigns);
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        })
        
    }
  }
};
</script>