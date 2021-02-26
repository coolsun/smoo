<template>
    <!--DonationHistory Section-->
    <section class="donation-history-section">
        <div class="donation-table">
            <h2>{{ $t('header.my-donation') }}</h2>
            <div class="table-container">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Establishment Date</th>
                            <th>Start Date</th>
                            <th>Deadline</th>
                            <th>Campaign</th>
                            <th>Fundraised Amount</th>
                            <th>Sponsors</th>
                            <th>Notes</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2019/06/14</td>
                            <td>2019/06/15</td>
                            <td>2019/07/01</td>
                            <td>Campaign 1</td>
                            <td>$855</td>
                            <td>Sponsor 1</td>
                            <td>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequuntur, asperiores repellat adipisci quisquam rerum eius explicabo esse alias incidunt nemo iste quia aperiam, sunt illo quod voluptate ea pariatur in.</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-edit"><i class="fa fa-edit"></i></button>
                                <button type="button" class="btn btn-primary btn-cancel"><i class="fa fa-times-circle"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>2019/07/01</td>
                            <td>2019/07/02</td>
                            <td>2019/09/30</td>
                            <td>Campaign 2</td>
                            <td>$856</td>
                            <td>Sponsor 2</td>
                            <td>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Enim recusandae vel quia eum quidem! Amet, quas qui. Laborum, dolorem praesentium quae modi, voluptatem quos voluptate ad, quod exercitationem ipsum numquam?</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-edit"><i class="fa fa-edit"></i></button>
                                <button type="button" class="btn btn-primary btn-cancel"><i class="fa fa-times-circle"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>2019/09/30</td>
                            <td>2019/10/01</td>
                            <td>2019/11/30</td>
                            <td>Campaign 3</td>
                            <td>$827</td>
                            <td>Sponsor 3</td>
                            <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque asperiores totam ea, nobis alias repellendus repudiandae quis optio deleniti, nihil quod commodi nisi dolore sint doloremque, earum unde facere dolorum?</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-edit"><i class="fa fa-edit"></i></button>
                                <button type="button" class="btn btn-primary btn-cancel"><i class="fa fa-times-circle"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!--/DonationHistory Section-->
</template>

<script>

export default {
  name: "DonationHistory",
  components: {
  },
  data() {
    return {
    };
  },
};
</script>