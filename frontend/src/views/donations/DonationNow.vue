
<template>
    <section class="donate-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="donate-project-content">
                        <h2>{{ $t('donation.Enter your Donation') }}</h2><br>
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-lg">$</span>
                            </div>
                            <mdb-input type="number" v-model="amount" min="0" aria-label="Large" aria-describedby="inputGroup-sizing-sm"/>
                        </div><br>
                        <form action="#" v-on:submit.prevent>
                            <mdb-input type="text" :label="$t('donation.First Name')" v-model="first_name" />
                          
                            <mdb-input type="text" :label="$t('donation.Last Name')" v-model="last_name" />
                            <mdb-input type="text" :label="$t('donation.Address')" v-model="address" />
                            <mdb-input type="text" :label="$t('donation.City')" v-model="city" />
                            <mdb-input type="text" :label="$t('donation.Zipcode')" v-model="zipcode" />
                            <div class="form-select" >
                                <select v-model="country">
                                    <option value="0">{{ $t('donation.Country') }}</option>
                                    <option value="1">Taiwan</option>
                                    <option value="2">Japan</option>
                                    <option value="3">United States</option>
                                    <option value="4">South Korea</option>
                                    <option value="5">Vietnam</option>
                                </select>
                            </div>
                            <h4>{{ $t('donation.Comment') }}</h4>
                            <textarea name="message" rows="3" :placeholder="$t('donation.Why I donate')"></textarea>
                            <br><br>
                            <button class="bttn-mid btn-fill" type="submit" @click="donate_now">{{ $t('donation.Submit Donation') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import { mdbInput } from 'mdbvue';

export default {
  name: "DonationNow",
  components: {
      mdbInput
  },
  data() {
    return {
        amount: null,
        first_name: null,
        last_name: null,
        address: null,
        zipcode: null,
        city: null,
        country: 0,
        comment: null
    };
  },
  created() {
  },
  methods: {
    donate_now() {
        let donation = {
            amount: this.amount,
            /* TBD: for payment
            first_name: this.first_name,
            last_name: this.last_name,
            address: this.address,
            city: this.city,
            zipcode: this.zipcode,
            country: this.country,
            comment: this.comment
            */
        }
        this.$axios.post('/api/donations', 
            { donation: donation },
            { headers: { 'Authorization': this.$store.state.authToken } 
        })
        .then(() => {
            // alert: success
            console.log("Donate successfully.");
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    }
  }
};
</script>