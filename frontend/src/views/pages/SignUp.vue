
<template>
    <!--Donation Now Section-->
    <section class="donate-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="donate-project-content">
                        <h2>{{ $t('sign_in.sign_up') }}</h2><br>
                        <form action="#" v-on:submit.prevent>
                            <mdb-input :label="'* '+$t('sign_in.first_name')" class="mb-5" type="text" v-model="firstName"/>
                            <mdb-input :label="'* '+$t('sign_in.last_name')" class="mb-5" type="text" v-model="lastName"/>
                            <mdb-input :label="'* '+$t('sign_in.your_email')" class="mb-5" type="email" v-model="email" validate/>
                            <mdb-input :label="'* '+$t('sign_in.your_password')" class="mb-5" type="password" v-model="password"/>
                            <!--h5>*Country</h5>
                            <div class="form-select">
                                <select name="project-select">
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                </select>
                            </div-->
                            <!--mdb-input label="Zipcode"/-->
                            <br>
                            <br>
                            <h6>{{$t('sign_in.Please verify the following:')}}</h6>
                            <div class="form-tick">
                                <label class="custom-control fill-checkbox">
                                    <input type="checkbox" class="fill-control-input">
                                    <span class="fill-control-indicator"></span>
                                    <span class="fill-control-description">{{'* '+$t('sign_in.I am at least 18 years old')}}</span>
                                </label>  
                                <label class="custom-control fill-checkbox">
                                        <input type="checkbox" class="fill-control-input">
                                        <span class="fill-control-indicator"></span>
                                        <span class="fill-control-description">{{'* '+$t('sign_in.I can verify a bank account and government-issued ID')}}</span>
                                </label>
                                <label class="custom-control fill-checkbox">
                                        <input type="checkbox" class="fill-control-input">
                                        <span class="fill-control-indicator"></span>
                                        <span class="fill-control-description">{{'* '+$t('sign_in.I have a debit and/or credit card')}}</span>
                                </label>  
                            </div>
                            <button class="bttn-mid btn-fill" type="submit" @click="signUp">{{ $t('sign_in.submit') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Donation Now Section-->
</template>

<script>
import { mdbInput } from 'mdbvue';

export default {
  name: "SignUp",
  components: {
      mdbInput
  },
  data() {
    return {
        email: "",
        password: "",
        firstName: "",
        lastName: ""
    };
  },
  methods: {
    signUp() {
        console.log("first: " + this.firstName);
        let signUpData = {
            user: {
                email: this.email,
                password: this.password,
                first_name: this.firstName,
                last_name: this.lastName
                //email: "aa",
                //password: "bb"
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