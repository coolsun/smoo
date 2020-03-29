<template>
  <div class="tree-menu-item">
    <div class="p-1" :class="headerClass" @click="opened = !opened" style="position: relative">
      <a v-if="nodes" class="p-0 m-0 z-depth-0 " @click="show = !show">
        <mdb-icon class="ic-w mx-1" :class="nestedIconClasses" :icon="arrow" />
      </a>
      <mdb-icon :class="iconClass" class="pl-1 ic-w mr-1" :icon="icon" />
      <span>{{ name }}</span>
      <a v-if="nodes" class="p-0 m-0 z-depth-0" @click="$emit('add-item', nodes) " >
        <mdb-icon class="ic-w mx-1" :icon="plusIconClass" />
      </a>
      <a v-else class="p-0 m-0 z-depth-0" @click="$emit('remove-item', name)">
        <mdb-icon class="ic-w mx-1" :icon="minusIconClass" />
      </a>
    </div>
    <transition v-if="nodes" name="slide" >
      <ul v-if="show" class="list-unstyled pl-4">
        <slot></slot>
        <app-tree-menu-item
        v-if="show"
        v-for="node in nodes" 
        :name="node.label"
        :key="node.label"
        :icon="node.icon"
        :nodes="node.nodes"
        @add-item="addItem" 
        @remove-item="removeItem"
        />
      </ul>
    </transition>
    <ul v-else-if="show && nodes" class="list-unstyled pl-5">
      <slot></slot>
      <app-tree-menu-item
      v-if="show"
      v-for="node in nodes" 
      :name="node.label"
      :key="node.label"
      :icon="node.icon"
      :nodes="node.nodes" 
      @add-item="addItem" 
      @remove-item="removeItem"
      />
    </ul>
  </div>
</template>
<script>
import classNames from "classnames";
import { mdbIcon } from "../Content/Fa";
import { mdbBtn } from "../Components/Button";

export default {
  name: "app-tree-menu-item",
  components: {
    mdbIcon,
    mdbBtn
  },
  props: {
    tag: {
      type: String,
      default: "li"
    },
    icon: {
      type: String,
      default: "folder-open"
    },
    nodes: {
      type: Array
    },
    name: {
      type: String
    }
  },
  data() {
    return {
      show: false,
      opened: false
    };
  },
  computed: {
    nestedIcon() {
      return false ? 'plus-circle' : "angle-right";
    },
    nestedActiveIcon() {
      return false ? 'minus-circle' : "angle-down";
    },
    plusIconClass() {
      return "plus-square";
    },
    minusIconClass() {
      return "minus-square";
    },
    arrow() {
      if (this.show) {
        return this.nestedActiveIcon;
      }
      return this.nestedIcon;
    },
    headerClass() {
      return classNames(
        this.opened && 'opened',
        this.show && 'open'
      );
    },
    nestedIconClasses() {
      return classNames(
        'cyan-text'
      );
    },
    iconClass() {
      return classNames(
        'blue-text'
      );
    },
  },
  methods: {
    addItem(nodes) {
      this.$emit('add-item', nodes);
      console.log("a");
    },
    removeItem(removeNode) {
      this.$emit('remove-item', removeNode);
      console.log("b");
    }
  }
};

</script>

<style scoped>
/* .active {
  background-color: #32a0ff;
  border-radius: 3px;
  color: white;
}

.treeview-header {
  transition: all 0.5s ease-out;
}
.treeview-header:hover {
  background-color: #8cb9ff;
  border-radius: 3px;
} */

.slide-enter-active {
  -moz-transition-duration: 0.3s;
  -webkit-transition-duration: 0.3s;
  -o-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -moz-transition-timing-function: ease-in;
  -webkit-transition-timing-function: ease-in;
  -o-transition-timing-function: ease-in;
  transition-timing-function: ease-in;
}

.slide-leave-active {
  -moz-transition-duration: 0.5s;
  -webkit-transition-duration: 0.5s;
  -o-transition-duration: 0.5s;
  transition-duration: 0.5s;
  -moz-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  -webkit-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  -o-transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
  transition-timing-function: cubic-bezier(0, 1, 0.5, 1);
}

.slide-enter-to,
.slide-leave {
  max-height: 120px;
  overflow: hidden;
}

.slide-enter,
.slide-leave-to {
  overflow: hidden;
  max-height: 0;
}
</style>

