<template>
    <!--DonationHistory Section-->
    <section class="donation-history-section section-padding-2">
        <div class="container">
            <h2>{{ $t('header.my-donation') }}</h2>
            <br>
            <div>
              <mdb-tbl responsive>
                <mdb-tbl-head class="donation-table" textWhite>
                  <tr>
                    <th>#</th>
                    <th>User ID</th>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Goal</th>
                    <th>Start Date</th>
                    <th>Actions</th>
                  </tr>
                </mdb-tbl-head>
                <mdb-tbl-body>
                  <tr v-for="campaign in campaigns" :key="campaign.id" scope="row">
                    <th scope="row">{{ campaign.id }}</th>
                    <td>{{ campaign.user_id }}</td>
                    <td>{{ campaign.category_id }}</td>
                    <td>{{ campaign.name }}</td>
                    <td>{{ campaign.description }}</td>
                    <td>${{ campaign.goal }}</td>
                    <td>${{ campaign.created_at }}</td>
                    <td>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-trophy"
                          aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-thumbtack"
                            aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-danger waves-effect px-3"><i class="fas fa-rocket" aria-hidden="true"></i></button>
                    </td>
                  </tr>
                </mdb-tbl-body>
              </mdb-tbl>
            </div>
        </div>
    </section>
</template>
<script>
export default {
  name: "ManageCampaigns",
  components: {
  },
  data() {
    return { 
      campaigns: []
    };
  },
  created() {
    this.campaign();
  },
  methods: {
      campaign() {
        this.$axios.get('/api/campaigns/all_campaigns')
        .then((res) => {
            // alert: success
            this.campaigns = res.data;
            console.log("this.campaigns:"+this.campaigns);
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    }
  }
};
</script>