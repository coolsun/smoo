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
                            <input type="text" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                        </div><br>
                        <form action="#">
                            <textarea name="project-name" rows="1" :placeholder="$t('campaign.My campaign')"></textarea>
                            <div class="form-select">
                                <select name="project-select">
                                    <option value="">{{ $t('campaign.Choose a category') }}</option>
                                    <option value="">Select your project</option>
                                    <option value="">Select your project</option>
                                    <option value="">Select your project</option>
                                    <option value="">Select your project</option>
                                </select>
                            </div>
                            <textarea name="message" rows="5" :placeholder="$t('campaign.My campaign is for')"></textarea>

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
        projectDescription: ""
    };
  },
  methods: {
    startProject() {
        console.log("Project name: " + this.projectName);
        console.log("Project description: " + this.projectDescription);
    }
  }
};
</script>