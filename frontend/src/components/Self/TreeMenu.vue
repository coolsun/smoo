<template>
  <component :is="tag" class="border m-3" @add-item="addItem" @remove-item="removeItem">
    <h6 v-if="header" class="pt-3 pl-3">{{header}}</h6>
    <hr>
    <ul :class="listClass" @add-item="addItem" @remove-item="removeItem">
      <slot @add-item="addItem" @remove-item="removeItem"></slot>
    </ul>
  </component>
</template>

<script>
import classNames from "classnames";

const TreeMenu = {
  props: {
    tag: {
      type: String,
      default: "div"
    },
    header: String
  },
  computed: {
    listClass() {
      return classNames(
        'list-unstyled',
        false ? 'treeview-animated-list mb-3 pl-3 pb-2' : '',
        true ? 'treeview-colorful-list' : 'mb-1 pl-3 pb-2 '
      );
    }
  },
  methods: {
    addItem(nodes) {
      this.$emit('add-item', nodes);
      console.log("at");
    },
    removeItem(removeNode) {
      this.$emit('remove-item', removeNode);
      console.log("bt");
    }
  }
};

export default TreeMenu;
</script>

<style scoped>
</style>
