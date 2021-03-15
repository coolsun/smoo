<template>
    <!--Causes Area -->
    <section class="explore-area section-padding-2">
        <div class="container">
            <div class="explore-search row">
                <h6 style="margin-bottom: 0.2rem;">{{ $t('campaign.Category') }}</h6>
                <select v-model="$store.state.currentCategory" class="input-group" style="margin-bottom: 15px; width: 100%; border: 1px solid #E0E0E0; padding-left: 20px; border-radius: 4px; color: #666666; resize: none;">
                  <option disabled value="0">{{ $t('campaign.Choose a category') }}</option>
                  <option value="1">{{ this.$t('header.emergency') }}</option>
                  <option value="2">{{ this.$t('header.memorial') }}</option>
                  <option value="3">{{ this.$t('header.animal-rescue') }}</option>
                  <option value="4">{{ this.$t('header.medical') }}</option>
                  <option value="5">{{ this.$t('header.charity') }}</option>
                </select>
                <!--<div class="col-sm">
                    <input type="text" placeholder="Start date">
                </div>
                <div class="col-sm">
                    <input type="text" placeholder="End date">
                </div>
                <div class="col-">
                    <button type="submit" class="bttn-mid btn-fill-2">{{ $t('explore.search') }}</button>                   
                </div>-->
            </div>

            <div v-if="isLoaded" class="row portfolio portfolio-gallery column-3 gutter wow fadeInUp" data-wow-delay="0.5s">

                <div v-for="campaign in campaigns" :key="campaign.id">
                    <div v-if="campaign.category_id == $store.state.currentCategory" class="portfolio-item">
                        <div class="item-thumb">
                            <img v-if="campaign.photo_url" class="center-cropped" :src="campaign.photo_url" alt="">
                            <img v-else src="@/assets/images/portfolios/7.jpg" alt="">
                            <div class="item-tag">By Petey Cruiser</div>
                            <div class="progress light-blue-bg">
                                <div class="progress-bar" role="progressbar" :style="progressBarStyle(campaign)" :aria-valuenow="campaign.goal_reached" aria-valuemin="0" aria-valuemax="100"><span>{{ campaign.goal_reached }}%</span></div>
                            </div>
                        </div>
                        <div class="item-details">
                            <div class="item-meta">
                                <span>{{ $t('campaign_details.goal') }}: ${{ campaign.goal }}</span>
                                <span>{{ campaign.campaign_started + " " + $t('campaign_details.days_ago') }}</span>
                                <span>{{ campaign.goal_reached }}% {{ $t('campaign_details.funded') }}</span>
                            </div>
                            <div class="item-title">
                                <h3><a href="">{{ campaign.name }}</a></h3>
                            </div>
                            <p class="text-truncate" style="max-width: 100%">{{ campaign.description }}</p>
                            <router-link class="bttn-small btn-wht" :to="{ name: 'causes-details', params: { campaignID: campaign.id }}" tag="button">{{ $t('campaign.View') }}</router-link>
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
  name: "Explore",
  components: {
  },
  data() {
    return {
        campaigns: [],
        isLoaded: false,
        category: this.$store.state.currentCategory
    };
  },
  created() {
      this.campaign();
  },
  watch: {
      category: function() {
          this.getCategoryID();
          this.campaign();
      }
  },
  methods: {
      getCategoryID() {
        switch(this.category) {
          case this.$t('header.emergency'):
            this.$store.state.currentCategory = '1';
            break;
          case this.$t('header.memorial'):
            this.$store.state.currentCategory = '2';
            break;
          case this.$t('header.animal-rescue'):
            this.$store.state.currentCategory = '3';
            break;        
          case this.$t('header.medical'):
            this.$store.state.currentCategory = '4';
            break;
          case this.$t('header.charity'):
            this.$store.state.currentCategory = '5';
            break;
          default:
            this.$store.state.currentCategory = '1';
        }
    },
    campaign() {
        console.log("this.campaigns authToken:"+this.$store.state.authToken)
        // this.$axios.get('/api/campaigns', { headers: { 'Authorization': this.$store.state.authToken}})
        this.$axios.get('/api/campaigns/all_campaigns')
        .then((res) => {
            // alert: success
            this.campaigns = res.data;
            console.log("this.campaigns:"+this.campaigns);
            this.isLoaded = true;
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        })
    },
    progressBarStyle(campaign) {
        var width = parseInt(campaign.goal_reached) + 10.0;
        return "width:" + width + "%;";
    }
   
  }
};
</script>