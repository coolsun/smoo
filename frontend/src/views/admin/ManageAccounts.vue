<template>
    <section class="section-padding-2">
        <div class="container">
            <h2> Users </h2>
            <br>
            <div>
              <mdb-tbl responsive>
                <mdb-tbl-head class="donation-table" textWhite>
                  <tr>
                    <th>#</th>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Date Joined</th>
                    <th>Actions</th>
                  </tr>
                </mdb-tbl-head>
                <mdb-tbl-body>
                  <tr v-for="user in users" :key="user.id" scope="row">
                    <th scope="row">{{ user.id }}</th>
                    <td>{{ user.email }}</td>
                    <td>{{ user.first_name }}</td>
                    <td>{{ user.last_name }}</td>
                    <td>{{ user.created_at }}</td>
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
import { mdbTbl, mdbTblHead, mdbTblBody } from 'mdbvue';
export default {
  name: "MyAccount",
  components: {
    mdbTbl,
    mdbTblHead,
    mdbTblBody
  },
  data() {
    return {
      users: []
    };
  },
  created() {
    this.getUsers();
  },
  methods: {
    getUsers() {
        this.$axios.get('/api/donations', { headers: { 'Authorization': this.$store.state.authToken}})
        .then((res) => {
            // alert: success
            this.users = res.data;
            console.log("this.users:"+this.users);
        })
        .catch(error => {
            // alert: error
            console.log(error.message)
        }) 
    }
  }
};
</script>