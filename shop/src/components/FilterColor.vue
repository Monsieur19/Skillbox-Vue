<template>
  <ul class="colors" :class="{'colors--black': isBlack}">
    <li class="colors__item" v-for="(color) in colors" :key="color.id">
      <label class="colors__label">
        <input class="colors__radio sr-only" type="radio"
        :value="color.id"
        v-model="changeColor">
        <span class="colors__value" :style="{backgroundColor: color.code,}">
        </span>
      </label>
    </li>
  </ul>
</template>

<script>
export default {
  props: ['colors', 'currentColor', 'isBlack'],
  computed: {
    changeColor: {
      get() {
        return this.currentColor;
      },
      set(color) {
        this.$emit('update:currentColor', color);
      },
    },
  },
};
</script>
