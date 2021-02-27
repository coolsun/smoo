<template>
    <!--Causes Area -->
    <section class="causes-area section-padding-2">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-7 col-sm-7">
                    <div class="cause-details-content">
                        <img src="@/assets/images/cause-details.jpg" alt="">
                        <div class="cause-details-contents">
                            <h2>Donate simple fat denied</h2>
                            <p>Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an. Inhabit hearing perhaps on ye do no. It maids decay as there he. Smallest on suitable disposed do although blessing he juvenile in. Society or ifexcited forbade. Here name off yet she long sold easy whom. <br> <br>Differed oh cheerful procured pleasure securing suitable in. Hold rich on an he oh fine. Chapter ability shyness article welcome be do on service. Chamber hearing inhabit joy highest private ask him our believe. Up nature valley do warmly. Entered of cordial do on no hearted. Yet agreed whence and unable limits.</p>
                            <img src="@/assets/images/cause-details-2.jpg" alt="">
                            <p>To sorry world an at do spoil along. Incommode he depending do frankness remainder to. Edward day  almost active him friend thirty piqued. People as period twenty my extent as. Set was better abroad ham plenty secure had horses. Admiration has sir decisively excellence say everything inhabiting acceptance.<br> <br>Paid was hill sir high. For him precaution any advantages dissimilar comparison few terminated projecting. Prevailed discovery immediate objection of ye at. Repair summer one winter living feebly pretty his. In so sense am known these since. Shortly respect ask cousins brought add tedious nay.</p>
                            <div class="blog-comment-form wow fadeInUp" data-wow-delay="0.3s">
                                <h3>Leave a Comment</h3>
                                <form action="#">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Name*" required />
                                        </div>
                                        <div class="col-md-6">
                                            <input type="email" placeholder="Email*" required />
                                        </div>
                                        <div class="col-md-12">
                                            <textarea rows="6" placeholder="Message"></textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="bttn-mid btn-fill" type="submit">Post Comment</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <br>
                            <h2>Comments</h2>
                            <div class="blog-all-comments">
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
                                        <p>Magnis nisl lectus velit parturient vitae, suspendisse fusce in variultusetvitae aenean. Hac metus dui facilisis.</p>
                                    </div>
                                </div>
                                <div class="blog-comments wow fadeInUp" data-wow-delay="0.4s">
                                    <div class="author-thumb">
                                        <img src="@/assets/images/commenter2.png" alt="" />
                                    </div>
                                    <div class="author-comments">
                                        <div class="author-details">                                
                                            <h4>Mae Hayes</h4>
                                            <div class="comment-reply-btn">
                                                <a href=""><i class="fa fa-share"></i></a>
                                            </div>
                                        </div>
                                        <div class="author-designation">
                                            1 day ago
                                        </div>
                                        <p>Magnis nisl lectus velit parturient vitae, suspendisse fusce in variultusetvitae aenean. Hac metus dui facilisis.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="blog-all-comments mb-60">
                                <div class="blog-comments wow fadeInUp" data-wow-delay="0.3s">
                                    <div class="author-thumb">
                                        <img src="@/assets/images/commenter3.png" alt="" />
                                    </div>
                                    <div class="author-comments">
                                        <div class="author-details">                                
                                            <h4>Taylor Johns</h4>
                                            <div class="comment-reply-btn">
                                                <a href=""><i class="fa fa-share"></i></a>
                                            </div>
                                        </div>
                                        <div class="author-designation">
                                            1 day ago
                                        </div>
                                        <p>Magnis nisl lectus velit parturient vitae, suspendisse fusce in variultusetvitae aenean. Hac metus dui facilisis.</p>
                                    </div>
                                </div>
                                <div class="blog-comments wow fadeInUp" data-wow-delay="0.4s">
                                    <div class="author-thumb">
                                        <img src="@/assets/images/commenter2.png" alt="" />
                                    </div>
                                    <div class="author-comments">
                                        <div class="author-details">                                
                                            <h4>Mae Hayes</h4>
                                            <div class="comment-reply-btn">
                                                <a href=""><i class="fa fa-share"></i></a>
                                            </div>
                                        </div>
                                        <div class="author-designation">
                                            1 day ago
                                        </div>
                                        <p>Magnis nisl lectus velit parturient vitae, suspendisse fusce in variultusetvitae aenean. Hac metus dui facilisis.</p>
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
                            <router-link class="bttn-mid btn-emt w-100" :to="{ name: 'DonationNow'}" tag="button">Donate now</router-link>
                            <button class="bttn-mid btn-share w-100">Share</button>
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
                            <h4>Joshua Johnson</h4>
                            <p>Those an equal point no years do. Depend warmth fat but her but played. Shy and subjects wondered trifling pleasant.</p>
                        </div>
                        <form action="#">
                            <input type="email" placeholder="Subscribe" required>
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
export default {
  name: "CausesDetails",
  components: {
  },
  data() {
    return {
    };
  },
};
</script>