<template>
  <ul class="catalog__list">
    <CatalogItem :product="product" v-for="product in products" :key="product.id"/>
  </ul>
</template>

<script>
import CatalogItem from './CatalogItem.vue';

export default {
  props: ['products'],
  components: { CatalogItem },
};
</script>
