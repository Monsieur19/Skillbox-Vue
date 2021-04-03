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

  <FilterColor :colors="product.colors" :current-color.sync="currentColor" :is-black="true"/>

</li>
</template>

<script>
import FilterColor from './FilterColor.vue';

export default {
  props: ['product'],
  components: { FilterColor },
  data() {
    return {
      currentColor: '1',
    };
  },
};
</script>
