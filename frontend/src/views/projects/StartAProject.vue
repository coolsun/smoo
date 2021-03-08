<template>
    <!--start-project Area -->
    <section class="start-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="start-project-content">
                        <h2>{{$t('campaign.Enter your Campaign Goal')}}</h2><br>
                        <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-lg">$</span>
                            </div>
                            <input v-model="projectGoal" type="number" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                        </div><br>
                        <form action="#" v-on:submit.prevent>
                            <textarea v-model="projectName" rows="1" :placeholder="$t('campaign.My campaign')"></textarea>
                            <textarea v-model="projectDescription" rows="5" :placeholder="$t('campaign.My campaign is for')"></textarea>
                            <mdb-select :options="campaignCategory.options" :value.sync="campaignCategory.value" :label="$t('campaign.Choose a category')"

                            />
                            <!--div class="upload-img">
                                <span>Upload campaign image</span>
                                <div class="file-field">
                                    <div class="btn btn-primary btn-sm">
                                        <input type="file">
                                    </div>
                                </div>
                            </div>
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
                            <button class="bttn-mid btn-fill" type="submit" >Create Campaign</button>
                            </div-->
                            <button class="bttn-mid btn-fill" type="submit" @click="startProject">{{ $t('campaign.Create Campaign') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/start-project Area -->
</template>

<script>
import { mdbSelect } from "mdbvue";
export default {
  name: "StartAProject",
  components: {
      mdbSelect,
  },
  data() {
    return {
        projectName: "",
        projectDescription: "",
        categoryID: "1",
        projectGoal: "",
        campaignCategory: {
          value: '1',
          options: [
            { text: this.$t('header.emergency'), value: 1, selected: true },
            { text: this.$t('header.memorial'), value: 2 },
            { text: this.$t('header.animal-rescue'), value: 3 },
            { text: this.$t('header.medical'), value: 4 },
            { text: this.$t('header.charity'), value: 5 }
          ]
        }
    };
  },
  methods: {

    startProject() {
        console.log("name: " + this.projectName);
        console.log("desc: " + this.projectDescription);
        console.log("goal: " + this.goal);
        let newCampaign = {
            user_id: this.$store.state.currentUserID,
            category_id: this.categoryID,
            name: this.projectName,
            description: this.projectDescription,
            goal: this.projectGoal
        }
        this.$axios.post('/api/campaigns', 
            {campaign: newCampaign},
            {headers: { 'Authorization': this.$store.state.authToken }})
        .then(() => {
            // alert: success
            console.log("post campaign succeeded!")
            this.$notify.info({message: 'Successfully posted campaign!', position: 'top center', timeOut: 3000});
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    }
  }
};
</script>