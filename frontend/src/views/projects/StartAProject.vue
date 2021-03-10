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
                            <select v-model="category" class="input-group">
                              <option disabled value="">{{ $t('campaign.Choose a category') }}</option>
                              <option>{{ this.$t('header.emergency') }}</option>
                              <option>{{ this.$t('header.memorial') }}</option>
                              <option>{{ this.$t('header.animal-rescue') }}</option>
                              <option>{{ this.$t('header.medical') }}</option>
                              <option>{{ this.$t('header.charity') }}</option>
                            </select>                            
                            <div class="input-group input-group-sm">
                                <input class="form-control" type="file" @change="onFileChanged" style="height: revert;" />
                            </div>
                            <img id="preview_image" src="" class="form-control-image" alt="Image preview...">
                            <br />
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
export default {
  name: "StartAProject",
  components: {
  },
  data() {
    return {
        projectName: "",
        projectDescription: "",
        category: "",
        categoryID: "",
        projectGoal: "",
        selectedFile: null,
        selectedFileName: null,
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
  computed: {
      currentCategory () {
          return this.$store.state.currentCategory;
      }
  },
  methods: {
    getCategoryID() {
      switch(this.category) {
        case this.$t('header.emergency'):
          this.categoryID = '1';
          break;
        case this.$t('header.memorial'):
          this.categoryID = '2';
          break;
        case this.$t('header.animal-rescue'):
          this.categoryID = '3';
          break;        
        case this.$t('header.medical'):
          this.categoryID = '4';
          break;
        case this.$t('header.charity'):
          this.categoryID = '5';
          break;
        default:
          this.categoryID = '1';
      }
    },
    startProject() {
        this.getCategoryID();
        console.log("name: " + this.projectName);
        console.log("desc: " + this.projectDescription);
        console.log("goal: " + this.projectGoal);
        console.log("category " + this.categoryID);
        let newCampaign = {
            user_id: this.$store.state.currentUserID,
            category_id: this.categoryID,
            name: this.projectName,
            description: this.projectDescription,
            goal: this.projectGoal,
            file: this.selectedFile.src,
            file_name: this.selectedFileName
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
    },
    onFileChanged(event) {
        const preview = document.getElementById('preview_image');
        this.selectedFile = preview;
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.addEventListener("load", function () {
            // convert image file to base64 string
            preview.src = reader.result;
        }, false);

        if (file) {
            reader.readAsDataURL(file);
            this.selectedFileName = file.name;
        }
    }
  }
};
</script>