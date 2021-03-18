
<template>
    <section class="donate-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="donate-project-content">
                        <h2 class="text-center">{{ $t('donation.Enter your Donation') }}</h2><br>
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-lg">$</span>
                            </div>
                            <input v-model="amount" type="number" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm"/>
                        </div><br>
                        <form action="#" v-on:submit.prevent>
                            <label class="input-label">{{ $t('donation.First Name') }}</label>
                            <input class="mb-4 form-control" type="text" v-model="first_name" />
                            <label class="input-label">{{ $t('donation.Last Name') }}</label>
                            <input class="mb-4 form-control" type="text" v-model="last_name" />
                            <label class="input-label">{{ $t('donation.Address') }}</label>
                            <input class="mb-4 form-control" type="text" v-model="address" />
                            <label class="input-label">{{ $t('donation.City') }}</label>
                            <input class="mb-4 form-control" type="text" v-model="city" />
                            <label class="input-label">{{ $t('donation.Zipcode') }}</label>
                            <input class="mb-4 form-control" type="text" v-model="zipcode" />
                            <label class="input-label">{{ $t('donation.Country') }}</label>
                            <select v-model="country" class="input-group mb-4" style="margin-bottom: 15px; width: 100%; border: 1px solid #E0E0E0; padding-left: 20px; border-radius: 4px; color: #666666; resize: none;">
                                <option disabled value="0">{{ $t('donation.Country') }}</option>
                                <option value="1">Taiwan</option>
                                <option value="2">Japan</option>
                                <option value="3">United States</option>
                                <option value="4">South Korea</option>
                                <option value="5">Vietnam</option>
                            </select>
                            <label class="input-label">{{ $t('donation.Comment') }}</label>
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