<template>
<main class="content container">
  <div class="content__top">
    <ul class="breadcrumbs">
      <li class="breadcrumbs__item">
        <a class="breadcrumbs__link" href="index.html">
          Каталог
        </a>
      </li>
      <li class="breadcrumbs__item">
        <a class="breadcrumbs__link" href="cart.html">
          Корзина
        </a>
      </li>
      <li class="breadcrumbs__item">
        <a class="breadcrumbs__link">
          Оформление заказа
        </a>
      </li>
    </ul>

    <h1 class="content__title">
      Заказ оформлен <span>№ 23621</span>
    </h1>
  </div>

  <section class="cart" v-if="orderInfo">
    <form class="cart__form form" action="#" method="POST">
      <div class="cart__field">
        <p class="cart__message">
          Благодарим за&nbsp;выбор нашего магазина. На&nbsp;Вашу
          почту придет письмо с&nbsp;деталями заказа.
          Наши менеджеры свяжутся с&nbsp;Вами в&nbsp;течение часа для
          уточнения деталей доставки.
        </p>

        <ul class="dictionary">
          <li class="dictionary__item">
            <span class="dictionary__key">
              Получатель
            </span>
            <span class="dictionary__value">
              {{ orderInfo.name }}
            </span>
          </li>
          <li class="dictionary__item">
            <span class="dictionary__key">
              Адрес доставки
            </span>
            <span class="dictionary__value">
              {{ orderInfo.address }}
            </span>
          </li>
          <li class="dictionary__item">
            <span class="dictionary__key">
              Телефон
            </span>
            <span class="dictionary__value">
              {{ orderInfo.phone }}
            </span>
          </li>
          <li class="dictionary__item">
            <span class="dictionary__key">
              Email
            </span>
            <span class="dictionary__value">
              {{ orderInfo.email }}
            </span>
          </li>
          <li class="dictionary__item">
            <span class="dictionary__key">
              Способ оплаты
            </span>
            <span class="dictionary__value">
              картой при получении
            </span>
          </li>
        </ul>
      </div>

      <div class="cart__block" v-if="orderInfo">
        <ul class="cart__orders">
          <OrderItem v-for="item in orderList" :key="item.product.id" :item="item"/>
        </ul>

        <div class="cart__total">
          <p>Доставка: <b>500 ₽</b></p>
          <p>Итого: <b>3</b> товара на сумму <b>37 970 ₽</b></p>
        </div>
      </div>
    </form>
  </section>
</main>
</template>

<script>
import OrderItem from '@/components/OrderItem.vue';

export default {
  components: { OrderItem },
  computed: {
    orderInfo() {
      return this.$store.state.orderInfo;
    },
    orderList() {
      return this.orderInfo.basket.items;
    },
  },
  created() {
    if (this.$store.state.orderInfo && this.$store.state.orderInfo.id === this.$route.params.id) {
      return;
    }
    this.$store.dispatch('loadOrderInfo', this.$route.params.id);
  },
  watch: {
    '$route.params.id': {
      handler() {
        this.$store.dispatch('loadOrderInfo', this.$route.params.id)
          .catch(() => {
            this.$router.replace({ name: 'notFound' });
          });
      },
      immediate: true,
    },
  },
};
</script>
