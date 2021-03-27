<template>
<li class="catalog__item">
  <a class="catalog__pic" href="#">
    <img :src="product.img" alt="Название товара">
  </a>

  <h3 class="catalog__title">
    <a href="#">
      {{product.title}}
    </a>
  </h3>

  <span class="catalog__price">
    {{product.price}}
  </span>

  <ul class="colors colors--black">
    <li class="colors__item" v-for="(color) in product.colors" :key="color">
      <label class="colors__label">
        <input class="colors__radio sr-only" type="radio" :value="color"
        :checked="checkColor(color)" @click="changeColor(color)">
        <span class="colors__value" :style="{backgroundColor: color,}">
        </span>
      </label>
    </li>
  </ul>
</li>
</template>

<script>
export default {
  props: ['product'],
  methods: {
    checkColor(clr) {
      return this.color === clr;
    },
    changeColor(clr) {
      this.color = clr;
    },
  },
  data() {
    return {
      color: '#73B6EA',
    };
  },
};
</script>
