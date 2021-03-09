<template>
    <mdb-container>
        <!-- Contact Area -->
        <section class="contact-area section-padding-2">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col centered wow fadeInUp" data-wow-delay="0.3s">
                        <div class="section-title">
                            <h2>{{ $t('contact.Get in touch') }}</h2>
                        </div>
                    </div>
                </div>
                <form action="#" v-on:submit.prevent class="row justify-content-center section-padding pt-0 wow fadeInUp" data-wow-delay="0.4s">
                    <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input v-model="senderName" type="text" :placeholder="$t('contact.Name')">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input v-model="senderEmail" type="text" :placeholder="$t('contact.Email Address')">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <input v-model="senderPhoneNumber" type="text" :placeholder="$t('contact.Phone Number')">
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                <select name="category">
                                    <option value="0">{{ $t('contact.Donation') }}</option>
                                    <option value="1">{{ $t('contact.Campaign') }}</option>
                                    <option value="2">{{ $t('contact.Payment') }}</option>
                                    <option value="3">{{ $t('contact.Partnership') }}</option>
                                    <option value="4">{{ $t('contact.Customer Support') }}</option>
                                    <option value="5">{{ $t('contact.Other') }}</option>
                                </select>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <textarea v-model="senderMessage" name="message" rows="5" :placeholder="$t('contact.Message')"></textarea>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <button type="submit" class="bttn-mid btn-fill-2" @click="contact">{{ $t('contact.Send Message') }}</button>
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
      senderName: "",
      senderPhoneNumber: "",
      senderEmail: "",
      senderMessage: ""
    };
  },
  methods: {
    contact() {
      console.log("name: " + this.senderName);
      console.log("phone: " + this.senderPhoneNumber);
      console.log("email: " + this.senderEmail);
      console.log("message: " + this.senderMessage);
      let newMessage = {
          name: this.senderName,
          phoneNumber: this.senderPhoneNumber,
          email: this.senderEmail,
          message: this.senderMessage
      }
      this.$axios.post('/api/contact_us', 
          {message: newMessage},
          {headers: { 'Authorization': this.$store.state.authToken }})
      .then(() => {
          // alert: success
          console.log("send message succeeded!")
          this.$notify.info({message: 'Successfully sent message!', position: 'top center', timeOut: 3000});
      })
      .catch(error => {
          // alert: error
          console.log(error.message)
      }) 
    }
  }
};
</script>