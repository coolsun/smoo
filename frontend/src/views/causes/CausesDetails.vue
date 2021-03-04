<template>
    <!--Causes Area -->
    <section class="causes-area section-padding-2">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-7 col-sm-7">
                    <div class="cause-details-content">
                        <img src="@/assets/images/causes-details.jpg" alt="">
                        <div class="cause-details-contents">
                            <h2>{{ campaign.name }}</h2>
                            <p>{{ campaign.description }}</p>
                            <div class="blog-comment-form wow fadeInUp" data-wow-delay="0.3s">
                                <h3>{{ $t('campaign_details.leave_comment') }}</h3>
                                <form action="#">
                                    <div class="row">
                                        <div v-if="!$store.state.isLoggedIn" class="col-md-6">
                                            <mdb-input type="text" placeholder="Name*" v-model="name" required />
                                        </div>
                                        <div v-if="!$store.state.isLoggedIn" class="col-md-6">
                                            <mdb-input type="email" placeholder="Email*" v-model="email" required />
                                        </div>
                                        <div class="col-md-12">
                                            <mdb-textarea rows="6" placeholder="Message" v-model="message"></mdb-textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="bttn-mid btn-fill" type="submit" @click="postComment">{{ $t('campaign_details.post_comment') }}</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <br>
                            <h2>{{ $t('campaign_details.comments') }}</h2>
                            <div v-for="comment in comments" :key="comment.id" class="blog-all-comments">
                                <div class="blog-comments wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="author-thumb">
                                        <img src="@/assets/images/commenter1.png" alt="" />
                                    </div>
                                    <div class="author-comments">
                                        <div class="author-details">                                
                                            <h4>Will Marvin</h4>
                                            <div class="comment-reply-btn">
                                                <a href=""><i class="fa fa-share"></i></a>
                                            </div>
                                        </div>
                                        <div class="author-designation">
                                            1 day ago
                                        </div>
                                        <p>{{ comment.content }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-5 col-sm-5">
                    <div class="cause-details-sidebar sticky-top">
                        <div class="cause-single-sidebar">
                            <div class="progress red-bg-2">
                                <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"><span>45%</span></div>
                            </div>
                            <div class="item-meta">
                                <span>$450 Pledged</span>
                                <span>5 Days ago</span>
                                <span>45% Funded</span>
                            </div>
                            <router-link class="bttn-mid btn-emt w-100" :to="{ name: 'donation-now'}" tag="button">{{ $t('header.donate_now') }}</router-link>
                            <button class="bttn-mid btn-share w-100">{{ $t('campaign_details.share') }}</button>
                            <div class="icons">
                                <div class="heart">
                                    <a href="#0"><i class="fa fa-heart"></i></a>
                                </div>
                                <div class="social-icons">
                                <div class="social">
                                    <a href="" class="cl-facebook"><i class="fa fa-facebook"></i></a>
                                    <a href="" class="cl-twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="" class="cl-youtube"><i class="fa fa-youtube"></i></a>
                                    <a href="" class="cl-pinterest"><i class="fa fa-pinterest"></i></a>
                                </div>
                                </div>
                            </div>
                        </div>
                        <div class="cause-single-sidebar centered">
                            <div class="thumb">
                                <img src="@/assets/images/author.png" alt="">
                            </div>
                            <h4>發起人</h4>
                            <p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant.</p>
                        </div>
                        <form action="#">
                            <input type="email" :placeholder="$t('campaign_details.Subscribe')" required>
                            <button type="submit"><i class="flaticon-paper-plane"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Causes Area -->
</template>

<script>
import { mdbInput, mdbTextarea } from 'mdbvue'
export default {
  name: "causes-details",
  components: {
      mdbInput,
      mdbTextarea
  },
  props: {
    campaignID: Number
  },
  data() {
    return {
        email: '',
        name: '',
        message: '',

        campaign: [],
        comments: [],
        campaignNum: this.$props.campaignID
    };
  },
  created() {
    this.getDetails();
  },
  methods: {
    getDetails() {
        /*var getParams = {
          params: {
            id: this.campaignNum
          }
        }*/
        this.$axios.get('/api/campaigns/show/'+this.campaignNum)
        .then((res) => {
            // alert: success
            this.campaign = res.data.campaign;
            console.log("this.campaign:"+this.campaign);
            this.comments = res.data.comments;
            console.log("this.comments:"+this.comments);
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    },
    postComment() {
        let campaign = {
            campaign_id: this.campaignNum,
            user_id: this.$store.state.currentUserID,
            content:this.message,
        }
        this.$axios.post('/api/campaigns/create_comment', 
            {comment: campaign},
            {headers: { 'Authorization': this.$store.state.authToken }})
        .then(() => {
            // alert: success
            console.log("post comment succeeded!")
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    }
  }
};
</script>