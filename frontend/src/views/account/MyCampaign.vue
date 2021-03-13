<template>
    <!--Causes Area -->
    <section class="explore-area section-padding-2">
        <div class="container">
            <h2>{{ $t('header.my-donation') }}</h2>
            <div class="explore-search row">
                <div class="col-sm">
                    <input type="text" placeholder="Category">
                </div>
            </div>

            <div class="row portfolio portfolio-gallery column-3 gutter wow fadeInUp" data-wow-delay="0.5s">

                <div class="portfolio-item">
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

                <div v-for="my_campaign in my_campaigns" :key="my_campaign.id">
                  <div class="portfolio-item">
                    <div class="item-thumb">
                        <img src="@/assets/images/portfolios/7.jpg" alt="">
                        <div class="item-tag">By Petey Cruiser</div>
                        <div class="progress light-blue-bg">
                        <div class="progress-bar" role="progressbar" :style="progressBarStyle(my_campaign)" :aria-valuenow="my_campaign.goal_reached" aria-valuemin="0" aria-valuemax="100"><span>{{ my_campaign.goal_reached }}%</span></div>
                        </div>
                    </div>
                    <div class="item-details">
                        <div class="item-meta">
                            <span>{{ $t('campaign_details.goal') }}: ${{ my_campaign.goal }}</span>
                            <span>{{ my_campaign.campaign_started + " " + $t('campaign_details.days_ago') }}</span>
                            <span>{{ my_campaign.goal_reached }}% {{ $t('campaign_details.funded') }}</span>
                        </div>
                        <div class="item-title">
                            <h3><a href="">{{ my_campaign.name }}</a></h3>
                        </div>
                        <p class="text-truncate" style="max-width: 100%">{{ my_campaign.description }}</p>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-edit"
                          aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-user-friends"
                            aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-danger waves-effect px-3"><i class="fas fa-trash-alt" aria-hidden="true"></i></button>
                    </div>
                  </div>
                </div>    
            </div>
        </div>
    </section>
    <!--/Causes Area -->
</template>
<script>
export default {
  name: "MyCampaign",
  components: {
  },
  data() {
    return { 
      my_campaigns: []
    };
  },
  created() {
    this.my_campaign();
  },
  methods: {
      my_campaign() {
        this.$axios.get('/api/campaigns/my_campaigns', { headers: { 'Authorization': this.$store.state.authToken}})
        .then((res) => {
            // alert: success
            this.my_campaigns = res.data;
            console.log("this.my_campaigns:"+this.my_campaigns);
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    },
    progressBarStyle(this_campaign) {
        if (this_campaign) {
          var width = parseInt(this_campaign.goal_reached) + 10.0;
          return "width:" + width + "%;";
        }
    }
  }
};
</script>