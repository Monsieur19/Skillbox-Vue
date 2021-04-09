<template>
<main class="content container">
  <div class="content__top content__top--catalog">
    <h1 class="content__title">
      Каталог
    </h1>
    <span class="content__info">
      152 товара
    </span>
  </div>

  <div class="content__catalog">
    <ProductFilter :price-from.sync="filterPriceFrom"
    :price-to.sync="filterPriceTo" :category-id.sync="filterCategoryId"
    :filter-color.sync="filterColor"/>

    <section class="catalog">
      <div v-if="productsLoadingFailed">
        Ошибка
        <button @click="loadProducts">Попробовать еще раз</button>
      </div>
      <Preloader v-if="productsLoading"/>
      <CatalogList v-if="!productsLoading" :products="products"/>
      <BasePagination :page.sync="page" :count="countProducts" :per-page="productsPerPage"/>
    </section>

  </div>
</main>
</template>

<script>
import CatalogList from '@/components/CatalogList.vue';
import BasePagination from '@/components/BasePagination.vue';
import ProductFilter from '@/components/ProductFilter.vue';
import Preloader from '@/components/Preloader.vue';
import axios from 'axios';

export default {
  components: {
    CatalogList, BasePagination, ProductFilter, Preloader,
  },
  data() {
    return {
      filterPriceFrom: 0,
      filterPriceTo: 0,
      filterCategoryId: 0,
      filterColor: 0,
      page: 1,
      productsPerPage: 3,
      productsData: null,
      productsLoading: false,
      productsLoadingFailed: false,
    };
  },
  computed: {
    products() {
      return this.productsData
        ? this.productsData.items.map((product) => ({
          ...product,
          img: product.image.file.url,
        }))
        : [];
    },
    countProducts() {
      return this.productsData
        ? this.productsData.pagination.total
        : 0;
    },
  },
  methods: {
    loadProducts() {
      this.productsLoading = true;
      this.productsLoadingFailed = false;
      clearTimeout(this.loadProductsTimer);
      this.loadProductsTimer = setTimeout(() => {
        axios
          .get('https://vue-study.skillbox.cc/api/products', {
            params: {
              page: this.page,
              limit: this.productsPerPage,
              categoryId: this.filterCategoryId,
              minPrice: this.filterPriceFrom,
              maxPrice: this.filterPriceTo,
              colorId: this.filterColor,
            },
          })
          .then((response) => { this.productsData = response.data; })
          .catch(() => { this.productsLoadingFailed = true; })
          .then(() => { this.productsLoading = false; });
      }, 1000);
    },
  },
  watch: {
    page() {
      this.loadProducts();
    },
    filterCategoryId() {
      this.loadProducts();
    },
    filterPriceFrom() {
      this.loadProducts();
    },
    filterPriceTo() {
      this.loadProducts();
    },
    filterColor() {
      this.loadProducts();
    },
  },
  created() {
    this.loadProducts();
  },
};
</script>
