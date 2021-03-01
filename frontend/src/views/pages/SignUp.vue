
<template>
    <!--Donation Now Section-->
    <section class="donate-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="donate-project-content">
                        <h2>{{ $t('sign_in.sign_up') }}</h2><br>
                        <form action="#">
                            <mdb-input :label="$t('sign_in.your_email')" class="mb-5" type="email" v-model="email"/>
                            <mdb-input :label="$t('sign_in.your_password')" type="password" v-model="password"/><br>
                            <h5>*Country</h5>
                            <div class="form-select">
                                <select name="project-select">
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                </select>
                            </div>
                            <mdb-input label="Zipcode"/><br>
                            <br><br>
                            <h6>Please verify the following:</h6>
                            <div class="form-tick">
                                <label class="custom-control fill-checkbox">
                                    <input type="checkbox" class="fill-control-input">
                                    <span class="fill-control-indicator"></span>
                                    <span class="fill-control-description">I am at least 18 years old.</span>
                                </label>  
                                <label class="custom-control fill-checkbox">
                                        <input type="checkbox" class="fill-control-input">
                                        <span class="fill-control-indicator"></span>
                                        <span class="fill-control-description">I can verify a bank account and government-issued ID.</span>
                                </label>
                                <label class="custom-control fill-checkbox">
                                        <input type="checkbox" class="fill-control-input">
                                        <span class="fill-control-indicator"></span>
                                        <span class="fill-control-description">I have a debit and/or credit card.</span>
                                </label>  
                            </div>
                            <button class="bttn-mid btn-fill" type="submit" @click="signUp">{{ $t('sign_in.sign_up') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Donation Now Section-->
</template>

<script>
import { mdbInput } from 'mdbvue'

export default {
  name: "DonationNow",
  components: {
      mdbInput
  },
  data() {
    return {
    };
  },
  methods: {
    signUp() {
        let signUpData = {
            user: {
                //email: this.email,
                //password: this.password
                email: "aa",
                password: "bb"
            }
        }
        this.$axios.post('/api/signup', signUpData)
        .then(() => {
        // alert: success
        console.log(this.email + " signed up successfully!")
        })
        .catch(error => {
        // alert: error
        console.log(error.message)
        })
        
    }
  }
};
</script>