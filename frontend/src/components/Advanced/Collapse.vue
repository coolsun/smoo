<template>
  <div>
    <component v-for="(toggler, index) in togglers" :key="index" :is="toggleTag[index]" :class="toggleClass[index]" @click.prevent="collapse = !collapse">{{toggleText[index]}}</component>
    <transition @before-enter="beforeEnter" @enter="enter" @before-leave="beforeLeave" @leave="leave">
      <div :id="`${closeTarget}-item`" ref="collapseContent" v-if="collapse" class="collapse show collapse-item">
        <slot></slot>
      </div>
    </transition>
  </div>
</template>

<script>
import classNames from 'classnames';

const Collapse = {
  props: {
    toggleTag: {
      type: [String, Array],
      default: () => ['button']
    },
    toggleClass: {
      type: [String, Array],
      default: () => ['btn btn-primary']
    },
    togglers: {
      type: Number,
      default: 1
    },
    toggleText: {
      type: [String, Array],
      default: () => ['Toggle']
    },
    closeTarget: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      collapse: true,
      height: 0
    };
  },
  mounted() {
    this.height = this.$refs.collapseContent.clientHeight;
    this.collapse = false;
  },
  methods: {
    beforeEnter(el) {
      el.style.height = '0';

      if (this.closeTarget) {
        document.querySelectorAll(`#${this.closeTarget}-item`).forEach(function(element) {
          element.hidden = true;
        });
      };
    },
    enter(el) {
      el.style.height = el.scrollHeight + 'px';
    },
    beforeLeave(el) {
      el.style.height = el.scrollHeight + 'px';

      if (this.closeTarget && el.hidden) {
        this.collapse = true;
      };
    },
    leave(el) {
      el.style.height = '0';

    }
  },
  computed: {
    btnClass() {
      return classNames(
        this.toggleClass
      );
    }
  }
};

export default Collapse;
export { Collapse as mdbCollapse };
</script>

<style scoped>
.collapse-item {
  overflow: hidden;
  padding: 0;
  transition: height 0.3s;
}
</style>
