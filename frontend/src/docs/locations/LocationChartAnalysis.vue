<template>
  <mdbRow>
    <mdbCol col="12" md="4">
      <label>{{ chartData.name }}</label>
      <mdbLineChart :data="chartData" :options="lineChartOptions" :width="325" :height="300"/>
      <mdbBarChart :data="chartData" :options="lineChartOptions" :width="325" :height="300"/>
    </mdbCol>
  </mdbRow>
</template>

<script>
import { mdbRow, mdbCol, mdbLineChart, mdbBarChart } from 'mdbvue';

export default {
  name: 'LocationChartAnalysis',
  components: {
    mdbRow,
    mdbCol,
    mdbLineChart,
    mdbBarChart
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      chartData: {
        name: '',
        labels: [],
        datasets: []
      },
      lineChartOptions: {
        responsive: false,
        maintainAspectRatio: false,
        scales: {
          xAxes: [{
            gridLines: {
              display: true,
              color: "rgba(0, 0, 0, 0.1)"
            }
          }],
          yAxes: [{
            gridLines: {
              display: true,
              color: "rgba(0, 0, 0, 0.1)"
            },
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    };
  },
  created() {
    this.getLocationsChart();
  },
  methods: {
    getLocationsChart() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/locations/${this.editID}/graph`)
        .then(response => {
          this.chartData = {
            name: response.data.location.name,
            labels: response.data.location.graph.labels,
            datasets: response.data.location.graph.datasets.map((x, index) => {
              var colorCount = index * 30;
              var r = (255 + colorCount) > 255 ? (255 + colorCount) % 255 : (255 + colorCount);
              var g = (170 + colorCount) > 255 ? (170 + colorCount) % 255 : (170 + colorCount);
              var b = (85 + colorCount) > 255 ? (85 + colorCount) % 255 : (85 + colorCount);

              return Object.assign({}, x, {
                backgroundColor: `rgba(${r}, ${g}, ${b}, 0.2)`,
                borderColor: `rgba(${r}, ${g}, ${b}, 1)`,
                borderWidth: 0.7
              });
            })
          };
        })
        .catch(error => {
          console.log(error.response);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    }
  }
};
</script>
