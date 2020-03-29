<template>
  <form class="needs-validation" novalidate @submit.prevent="updateLocationMppts">
    <mdbRow>
      <mdbCol class="form-group" col="6" v-if="isMpptExist">
        <label>{{ $t(`locations.${showMode ? 'choose_show_mppt' : 'choose_edit_mppt'}`) }}</label>
        <select v-model="selectedMppt" class="form-control">
          <option v-show="showMode" value="all">All</option>
          <option v-for="data in mpptData" :key="data.id" :value="data.id">{{data.name}}</option>
        </select>
      </mdbCol>

      <mdbCol class="form-group" col="6" v-else>
        <label>目前尚未擁有MPPT資料，若要新增請點擊編輯</label>
      </mdbCol>
    </mdbRow>

    <mdbRow id="canvas-row">
      <mdbCol col="7">
        <canvas v-show="image" width="500" height="500"/>
        <p v-show="!image && editMode">{{ $t('locations.please_upload_image') }}</p>
      </mdbCol>

      <mdbCol class="form-group" col="5" v-if="isMpptExist && currentMpptCoordinates.length">
        <label>{{ $t('locations.coordinate') }}:</label>
        <p v-for="(coordinate, index) in currentMpptCoordinates" v-if="!isFinish || index != currentMpptCoordinates.length - 1">
          x: {{ coordinate.x }} y: {{ coordinate.y }}
        </p>
      </mdbCol>
    </mdbRow>

    <input id="file" type="file" accept="image/jpeg,image/jpg,image/png" @change="updateBackGround" hidden>

    <mdbRow id="add-coordinates-row" v-if="editMode && isMpptExist && image">
      <mdbCol class="form-group" col="2">
        <input type="text" class="form-control" v-model="xCoordinate" placeholder="X座標">
      </mdbCol>
      <mdbCol class="form-group" col="2">
        <input type="text" class="form-control" v-model="yCoordinate" placeholder="Y座標">
      </mdbCol>
      <mdbCol class="form-group" col="2">
        <mdbBtn @click="addCoordinate" type="button" size="sm" color="primary" v-show="editMode">新增座標</mdbBtn>
      </mdbCol>
      <mdbCol class="form-group" col="2">
        <mdbBtn @click="finishGraph" type="button" size="sm" color="primary" v-show="editMode">完成座標圖</mdbBtn>
      </mdbCol>
    </mdbRow>

    <mdbRow id="button-row" end>
      <template v-for="btn in buttons">
        <mdb-btn v-show="showButton(btn.show)" :type="btn.type" size="sm" color="primary" @click="clickEvent(btn.method, btn.params)">
          <IconStack v-if="btn.mixIcon" :iconsInfo="btn.mixIcon"/>
          <mdbIcon v-else :icon="btn.icon" size="2x"/>
        </mdb-btn>
      </template>
    </mdbRow>
  </form>
</template>

<script>
import { mdbRow, mdbCol, mdbBtn, mdbIcon, IconStack } from 'mdbvue';

export default {
  name: 'LocationMppt',
  components: {
    mdbRow,
    mdbCol,
    mdbBtn,
    mdbIcon,
    IconStack
  },
  props: {
    editID: {
      type: Number
    }
  },
  data() {
    return {
      buttonMode: 'showMode',
      uploadMode: false,
      mpptData: [],
      image: null,
      selectedMppt: null,
      xCoordinate: null,
      yCoordinate: null,
      buttons: [
        { icon: 'edit', type: 'button', method: 'changeButtonMode', params: 'editMode', show: 'showMode, notSelectedAll' },
        { icon: 'brush', type: 'button', method: 'clearCoordinates', show: 'editMode' },
        { icon: 'upload', type: 'button', method: 'uploadEvent', params: 'this.selectedMppt', show: 'editMode' },
        { icon: 'save', type: 'submit', show: 'editMode' },
        { mixIcon: [{ icon: 'edit' }, {icon: 'ban', color: 'danger'}], type: 'button', method: 'changeButtonMode', params: 'showMode', show: 'editMode' }
      ]
    };
  },
  computed: {
    showMode() {
      return this.buttonMode == 'showMode';
    },
    editMode() {
      return this.buttonMode == 'editMode';
    },
    notSelectedAll() {
      return this.selectedMppt != 'all';
    },
    isMpptExist() {
      return this.mpptData.length;
    },
    currentMpptCoordinates() {
      var currentMppt = this.mpptData.length ? this.mpptData.find(x => x.id == this.selectedMppt) : null;

      return currentMppt ? currentMppt.mppt_coordinates : [];
    },
    isFinish() {
      var finish = false;

      if (this.currentMpptCoordinates && this.currentMpptCoordinates.length > 2) {
        var firstX = this.currentMpptCoordinates[0].x;
        var firstY = this.currentMpptCoordinates[0].y;
        var finallyX = this.currentMpptCoordinates[this.currentMpptCoordinates.length - 1].x;
        var finallyY = this.currentMpptCoordinates[this.currentMpptCoordinates.length - 1].y;

        if (firstX == finallyX && firstY == finallyY) finish = true;
      }

      return finish;
    }
  },
  watch: {
    selectedMppt() {
      this.getCoordinateGraph();
    },
    image() {
      this.getCoordinateGraph();
    },
    currentMpptCoordinates(newVal) {
      this.drawCoordinate(newVal, true);
    }
  },
  created() {
    this.getMpptData();
  },
  mounted() {
    this.addCanvasEvent();
  },
  updated() {
    this.$store.dispatch('app/setModalHeight');
  },
  methods: {
    getMpptData() {
      this.$store.commit('app/isLoading', true);
      this.$axios.get(`/apis/locations/${this.editID}/mppts`)
        .then(response => {
          this.mpptData = response.data.location.devices;
          this.image = 'http://scloud.trillioninnovations.com/' + response.data.location.mppt_image_url;
          this.selectedMppt = this.mpptData[0].id;
        })
        .catch(error => {
          console.log(error.response);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    addCanvasEvent() {
      var canvas = document.querySelector('canvas');

      canvas.addEventListener('contextmenu', event => {
        event.preventDefault();
      });

      canvas.addEventListener('mousedown', event => {
        if (this.isFinish || this.showMode) return;

        var xAxis = event.offsetX;
        var yAxis = event.offsetY;

        if (!this.currentMpptCoordinates.find(mpptCoordinate => mpptCoordinate.x == xAxis && mpptCoordinate.y == yAxis)) {
          this.currentMpptCoordinates.push({x: xAxis, y: yAxis});
        }
      });
    },
    finishGraph() {
      if (this.isFinish) return;

      if (this.currentMpptCoordinates.length > 2) {
        this.currentMpptCoordinates.push({ x: this.currentMpptCoordinates[0].x, y: this.currentMpptCoordinates[0].y });
      } else {
        self.alert('至少有三個點，才可以Finish');
      }
    },
    drawCoordinate(mpptCoordinates, onlyLast = false, mpptName = '') {
      var myCanvas = document.querySelector('canvas');
      var ctx = myCanvas.getContext('2d');
      var totalx = 0;
      var totaly = 0;

      mpptCoordinates.forEach((coordinate, index) => {
        if (onlyLast && index != (mpptCoordinates.length - 1)) return;

        totalx += coordinate.x;
        totaly += coordinate.y;

        if (index >= 0) {
          ctx.beginPath();
          ctx.arc(coordinate.x, coordinate.y, 3, 0, Math.PI*2);
          ctx.fillStyle = 'red';
          ctx.fill();
        }

        if (index > 0) {
          ctx.strokeStyle = "red";
          ctx.lineWidth = "2";
          ctx.moveTo(mpptCoordinates[index - 1].x, mpptCoordinates[index - 1].y);
          ctx.lineTo(coordinate.x, coordinate.y);
          ctx.stroke();
        }
      });
      
      var avgx = totalx/mpptCoordinates.length;
      var avgy = totaly/mpptCoordinates.length;
      
      ctx.font = 'bold 24px sans-serif';
      ctx.fillText(mpptName, avgx, avgy);
    },
    getCoordinateGraph() {
      var myCanvas = document.querySelector('canvas');
      var ctx = myCanvas.getContext('2d');
      var grid = 20;
      var canvasHeight = ctx.canvas.height;
      var canvasWidth = ctx.canvas.width;
      var xLineNumber = Math.floor(canvasWidth / grid);
      var yLineNumber = Math.floor(canvasHeight / grid);

      // 清空畫布
      ctx.clearRect(0, 0, canvasHeight, canvasWidth);

      let img = new Image();

      img.addEventListener('load', event => {
        ctx.drawImage(img, 0, 0, canvasHeight, canvasWidth);
        ctx.strokeStyle="gray";
        ctx.lineWidth = "1";

        for (var x = 0; x < xLineNumber; x++) {
          ctx.beginPath();
          ctx.moveTo(x * grid, 0);
          ctx.lineTo(x * grid, canvasHeight);
          ctx.stroke();
        }

        for (var y = 0; y < yLineNumber; y++) {
          ctx.beginPath();
          ctx.moveTo(0, y * grid);
          ctx.lineTo(canvasWidth, y * grid);
          ctx.stroke();
        }

        if (this.selectedMppt == 'all') {
          this.mpptData.forEach(element => {
            this.drawCoordinate(element.mppt_coordinates, false,element.name);
          });
        } else {
          this.drawCoordinate(this.currentMpptCoordinates);
        }

      });

      img.src = this.image;
    },

    clearCoordinates() {
      this.$set(this.mpptData.find(x => x.id == this.selectedMppt), 'mppt_coordinates', []);
      this.getCoordinateGraph();
    },
    addCoordinate() {
      if (this.isFinish) {
        self.alert('座標圖已經完成，若想新增座標，請先清除舊的座標');
      } else {
        var xAxis = parseInt(this.xCoordinate);
        var yAxis = parseInt(this.yCoordinate);

        if (!xAxis) {
          self.alert('x座標不可以為空');
        } else if (!yAxis) {
          self.alert('y座標不可以為空');
        } else if (this.currentMpptCoordinates.find(mpptCoordinate => mpptCoordinate.x == xAxis && mpptCoordinate.y == yAxis)) {
          self.alert('座標不可重複!');
        } else {
          this.currentMpptCoordinates.push({x: xAxis, y: yAxis});
        }

        this.getCoordinateGraph();
      }
    },
    updateLocationMppts(){
      if (this.isFinish) {
        this.$store.commit('app/isLoading', true);

        var updateMppt = {
          device: {
            mppt_coordinates: this.currentMpptCoordinates
          }
        };

        this.$axios.patch(`apis/devices/${this.selectedMppt}/update_mppt_coordinates`, updateMppt)
          .then(response => {
            console.log(response.data.message);
          })
          .catch(error => {
            console.log(error.response.message);
          })
          .finally(() => {
            this.$store.commit('app/isLoading', false);
          });
      } else {
        self.alert('請先完成座標圖');
      }
    },
    updateBackGround(event) {
      this.$store.commit('app/isLoading', true);

      var file = event.target.files.item(0);
      var uploadData = new FormData();

      uploadData.append('location[mppt_image]', file);

      this.$axios.put(`apis/locations/${this.editID}?fields=mppt_image_url`, uploadData)
        .then(response => {
          this.image = 'http://scloud.trillioninnovations.com/' + response.data.location.mppt_image_url;
        })
        .catch(error => {
          console.log(error.response.data);
        })
        .finally(() => {
          this.$store.commit('app/isLoading', false);
        });
    },
    uploadEvent() {
      document.getElementById('file').click();
    },
    changeButtonMode(mode) {
      this.buttonMode = mode;
    },
    showButton(condition) {
      if (!condition) return true;

      var show = [];

      condition.split(', ').forEach(element => {
        show.push(this[element]);
      });

      return !show.includes(false);
    },
    clickEvent(method, params) {
      if (!method) return;

      if (params && params.includes('this')) {
        this[method](this[params.replace('this.', '')]);
      } else {
        this[method](params);
      }
    }
  }
};
</script>

<style lang="scss" scoped>
form {
  margin-top: 10px;
  margin-left: 15px;
}

canvas {
  border: 1px solid black;
}

#add-coordinates-row > .form-group {
  margin: auto 0px;
}

#button-row {
  .btn {
    width: 5.5rem;
  }
}

#button-row.right-bottom {
  position: absolute;
  right: 40px;
  bottom: 15px;
}
</style>