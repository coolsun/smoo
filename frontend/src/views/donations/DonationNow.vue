
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
                            <input type="text" v-model="amount" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                        </div><br>
                        <form action="#" v-on:submit.prevent>
                            <h4>{{ $t('donation.First Name') }}</h4>
                            <input type="text" v-model="first_name" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                            <h4>{{ $t('donation.Last Name') }}</h4>
                            <input type="text" v-model="last_name" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                            <h4>{{ $t('donation.Address') }}</h4>
                            <input type="text" v-model="address" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                            <h4>{{ $t('donation.City') }}</h4>
                            <input type="text" v-model="city" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                            <h4>{{ $t('donation.Zipcode') }}</h4>
                            <input type="text" v-model="zipcode" class="form-control" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                            <h4>{{ $t('donation.Country') }}</h4>
                            <div class="form-select" aria-label="small" aria-describedby="inputGroup-sizing-sm">
                                <select v-model="country">
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                </select>
                            </div>
                            <h4>{{ $t('donation.Comment') }}</h4>
                            <textarea name="message" rows="3" :placeholder="$t('donation.Why I donate...')"></textarea>
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

export default {
  name: "DonationNow",
  components: {
  },
  data() {
    return {
        amount: null,
        first_name: null,
        last_name: null,
        address: null,
        zipcode: null,
        city: null,
        country: null,
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