<template>
  <mdbContainer>
    <h2>多組看板</h2>

    <mdbRow>
      <mdbCol :col="`${colWidth} mb-3`" v-for="(data, index) in locationsData" :key="index" v-if="showData[index]">
        <mdbCard>
          <mdbCardBody>
            <mdbRow>
              <mdbCol col="5">
                <span>最後更新時間: {{data.updated_at}}</span>
                <hr>
              </mdbCol>

              <mdbCol col="6">
                <h3>{{data.name}}</h3>
              </mdbCol>
            </mdbRow>

            <mdbRow>
              <mdbCol>
                <span>今日發電量: {{ data.daily_power ? data.daily_power : 'null' }}</span>
              </mdbCol>
            </mdbRow>
            <hr>

            <mdbRow id="chart-row">
              <mdbCol col="4">
                <label>PR</label>
                <mdbDoughnutChart :data="chartData[index].prChart" :options="chartOption" :width="300 / rowCount" :height="300 / rowCount"/>
              </mdbCol>

              <mdbCol col="4">
                <label>累計發電量</label>
                <mdbDoughnutChart :data="chartData[index].powerChart" :options="chartOption" :width="300 / rowCount" :height="300 / rowCount"/>
              </mdbCol>

              <mdbCol col="4">
                <label>天氣預報</label>
                <p>{{ data.temperature ? `${data.temperature}°C` : 'No Data' }}</p>
                <p>{{ data.wx ? data.wx : 'No Data' }}</p>
              </mdbCol>
            </mdbRow>
          </mdbCardBody>
        </mdbCard>
      </mdbCol>
    </mdbRow>
  </mdbContainer>
</template>

<script>
import { mdbContainer, mdbRow, mdbCol, mdbCard, mdbCardBody, mdbDoughnutChart } from 'mdbvue';

export default {
  name: 'MultipleBoard',
  components: {
    mdbContainer,
    mdbRow,
    mdbCol,
    mdbCard,
    mdbCardBody,
    mdbDoughnutChart
  },
  data() {
    return {
      count: null,
      carouselSecond: null,
      locationsData: [],
      showData: [],
      chartData: [],
      chartOption: {
        responsive: false,
        maintainAspectRatio: false
      }
    };
  },
  computed: {
    colWidth() {
      var col;

      switch (this.count) {
        case 1:
          col = 12;
          break;
        case 4:
          col = 6;
          break;
        case 6:
          col = 6;
          break;
        case 8:
          col = 6;
          break;
        case 9:
          col = 4;
          break;
        case 12:
          col = 4;
          break;
      }

      return col;
    },
    rowCount() {
      return 12 / this.colWidth;
    },
  },
  created() {
    this.getBoardsData();
  },
  watch: {
    showData(val) {
      var preIndex = val.lastIndexOf(true);
      var endIndex = preIndex + this.count;

      setTimeout(() => {
        if (preIndex + 1 < this.locationsData.length) {
          this.showData = this.locationsData.map((_, index) => (index > preIndex && index <= endIndex));
        }

        if (val[val.length - 1]) this.getBoardsData(false);
      }, this.carouselSecond * 1000);
    }
  },
  methods: {
    getBoardsData(openLoading = true) {
      if (openLoading) this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/boards/${this.$route.params.id}`)
        .then(response => {
          console.log(response.data.board);
          this.count = response.data.board.count;
          this.carouselSecond = response.data.board.carousel_second;
          this.locationsData = response.data.board.locations.sort((a, b) => {
            return a.index - b.index;
          });
          this.showData = this.locationsData.map((_, index) => index < this.count);

          this.setChartData();
        })
        .catch(error => {
          console.log(error.response.data.message);
        })
        .finally(() => {
          if (openLoading) this.$store.commit('app/isLoading', false);
        });
    },
    setChartData() {
      this.chartData = this.locationsData.map(x => {
        return {
          prChart: {
            labels: ['N/A', 'PR%'],
            datasets: [
              {
                data: [100 - x.pr_percentage, x.pr_percentage],
                backgroundColor: ['#AED6E1', '#46BFBD']
              }
            ]
          },
          powerChart: {
            labels: ['Untitled', '累計發電量'],
            datasets: [
              {
                data: [100 - x.total_power, x.total_power],
                backgroundColor: ['#7FCB6E', '#3CA24E']
              }
            ]
          }
        };
      });
    }
  }
};
</script>

<style lang="scss" scoped>
#chart-row {
  text-align: center;
}
</style>