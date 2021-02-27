<template>
    <mdb-container>
        <!-- Contact Area -->
        <section class="contact-area section-padding-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                        <div class="section-title">
                            <h2>Get in touch</h2>
                        </div>
                    </div>
                </div>
                <form action="#" class="row justify-content-center section-padding pt-0 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input type="text" placeholder="Name">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input type="text" placeholder="Email Address">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input type="text" placeholder="Phone Number">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <select name="Category">
                                    <option value="donation">Donation</option>
                                    <option value="campaign">Campaign</option>
                                    <option value="partnership">Partnership</option>
                                    <option value="customer-support">Customer Support</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <textarea name="message" rows="5" placeholder="Message"></textarea>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <button type="submit" class="bttn-mid btn-fill-2">Send Message</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-lg-4 col-xl-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="single-contact-address">
                            <i class="flaticon-placeholder"></i>
                            <p>580 Murphys Rd, White River <br>Junction, VT, 05001</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="single-contact-address">
                            <i class="flaticon-phone-call"></i>
                            <p>+8801728714927 <br>+8801728714927</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="single-contact-address">
                            <i class="flaticon-envelope"></i>
                            <p>ramdommail@demomail.com <br>ramdommail@demomail.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- /Contact Area -->

        <div id="map"></div>   
    </mdb-container>
</template>

<script>

import mdbContainer from 'mdbvue';

export default {
  name: "Contact",
  components: {
    mdbContainer
  },
  data() {
    return {
    };
  },
};
</script>