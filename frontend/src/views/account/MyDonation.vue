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
                    <th>Supporter</th>
                    <th>Email</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Actions</th>

                  </tr>
                </mdb-tbl-head>
                <mdb-tbl-body>
                  <tr scope="row">
                    <th scope="row">1</th>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-trophy"
                          aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-thumbtack"
                            aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-danger waves-effect px-3"><i class="fas fa-rocket" aria-hidden="true"></i></button>
                    </td>

                  </tr>
                  <tr scope="row">
                    <th scope="row">2</th>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-trophy"
                            aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-1 waves-effect px-3"><i class="fas fa-thumbtack"
                            aria-hidden="true"></i></button>
                        <button type="button" class="btn btn-outline-danger waves-effect px-3"><i class="fas fa-rocket" aria-hidden="true"></i></button>
                    </td>

                  </tr>
                  <tr scope="row">
                    <th scope="row">3</th>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
                    <td>Cell</td>
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
  name: 'MyDonation',
  components: {
    mdbTbl,
    mdbTblHead,
    mdbTblBody
  }
}
</script>

         