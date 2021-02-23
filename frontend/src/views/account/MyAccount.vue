
<template>
    <!--Donation Now Section-->
    <section class="donate-project section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
                    <div class="donate-project-content">
                        <h2>{{ $t('sign_in.sign_up') }}</h2><br>
                        <form action="#">
                            <h3>*Email</h3>
                            <textarea name="email" rows="1" placeholder="abc@gmail.com"></textarea><br>
                            <h3>*Username</h3>
                            <textarea name="username" rows="1" placeholder=""></textarea><br>
                            <h3>*Name</h3>
                            <textarea name="name" rows="1" placeholder="John Smith"></textarea><br>
                            <h3>*Country</h3>
                            <div class="form-select">
                                <select name="project-select">
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                    <option value="">Select your country</option>
                                </select>
                            </div>
                            <h3>Zipcode</h3>
                            <textarea name="zipcode" rows="1"></textarea><br>
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
                            <button class="bttn-mid btn-fill" type="submit">{{ $t('sign_in.sign_up') }}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Donation Now Section-->
</template>

<script>

export default {
  name: "MyAccount",
  components: {
  },
  data() {
    return {
    };
  },
};
</script>