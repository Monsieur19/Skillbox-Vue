<template>
<li class="catalog__item">
  <a class="catalog__pic" href="#" @click.prevent="gotoPage('product', {id: product.id})">
    <img :src="product.img" alt="Название товара">
  </a>

  <h3 class="catalog__title">
    <a href="#">
      {{product.title}}
    </a>
  </h3>

  <span class="catalog__price">
    {{product.price | numberFormat}}
  </span>

  <FilterColor :colors="product.colors" :current-color.sync="currentColor" :is-black="true"/>

</li>
</template>

<script>
import gotoPage from '@/helpers/gotoPage';
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
      currentColor: '1',
    };
  },
  methods: {
    gotoPage,
  },
};
</script>
