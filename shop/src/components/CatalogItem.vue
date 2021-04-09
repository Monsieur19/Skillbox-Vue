<template>
<li class="catalog__item">
  <router-link class="catalog__pic" href="#"
  :to="{name: 'Product', params: {id: product.id}}">
    <img :src="product.img" :alt="product.title">
  </router-link>

  <h3 class="catalog__title">
    <a href="#">
      {{product.title}}
    </a>
  </h3>

  <span class="catalog__price">
    {{product.price | numberFormat}}
  </span>

  <FilterColor class="colors--black" :colors="product.colors" :current-color.sync="currentColor"/>

</li>
</template>

<script>
import numberFormat from '@/helpers/numberFormat';
import FilterColor from './FilterColor.vue';

export default {
  props: ['product'],
  filters: {
    numberFormat,
  },
  components: { FilterColor },
  data() {
    return {
      currentColor: this.product.colors[0].id,
    };
  },
};
</script>
