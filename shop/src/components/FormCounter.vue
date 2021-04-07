<template>
<div class="form__counter">
  <button type="button" aria-label="Убрать один товар"
  @click.prevent="changeNumber(-1)">
    <svg width="12" height="12" fill="currentColor">
      <use xlink:href="#icon-minus"></use>
    </svg>
  </button>

  <input type="text" v-model.number="counter">

  <button type="button" aria-label="Добавить один товар"
  @click.prevent="changeNumber(1)">
    <svg width="12" height="12" fill="currentColor">
      <use xlink:href="#icon-plus"></use>
    </svg>
  </button>
</div>
</template>

<script>
export default {
  props: ['amount'],
  computed: {
    counter: {
      get() {
        return this.amount;
      },
      set(value) {
        this.$emit('update:amount', value);
      },
    },
  },
  methods: {
    changeNumber(value) {
      this.$emit('update:amount', this.amount + value);
    },
  },
};
</script>
