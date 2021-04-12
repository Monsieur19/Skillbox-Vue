<template>
<li class="cart__item product">
  <div class="product__pic">
    <img :src="item.product.img" width="120" height="120"
    :alt="item.product.img">
  </div>
  <h3 class="product__title">
    {{item.product.title}}
  </h3>
  <span class="product__code">
    Артикул: {{item.product.id}}
  </span>

    <FormCounter class="product__counter" :amount.sync="amount"/>

  <b class="product__price">
    {{ (item.amount * item.product.price) | numberFormat }} ₽
  </b>

  <button class="product__del button-del" type="button"
  aria-label="Удалить товар из корзины"
  @click.prevent="deleteCartProduct(item.productId, amount)">
    <svg width="20" height="20" fill="currentColor">
      <use xlink:href="#icon-close"></use>
    </svg>
  </button>
</li>
</template>

<script>
import numberFormat from '@/helpers/numberFormat';
import FormCounter from '@/components/FormCounter.vue';

export default {
  props: ['item'],
  components: { FormCounter },
  filters: { numberFormat },
  computed: {
    amount: {
      get() {
        return this.item.amount;
      },
      set(value) {
        this.$store.dispatch('updateCartProductAmount', { productId: this.item.productId, amount: value });
      },
    },
  },
  methods: {
    deleteCartProduct(id, amount) {
      this.$store.dispatch('deleteCartProduct', { productId: id, amount });
    },
  },
};
</script>
