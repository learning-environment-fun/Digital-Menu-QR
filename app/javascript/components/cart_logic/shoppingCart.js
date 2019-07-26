const PAYMENT_METHODS = Object.freeze({ applePay: 0, payPal: 1, creditCard: 2, cash: 3 });

export default class ShoppingCart {

  get PAYMENT_METHODS() {
    return PAYMENT_METHODS;
  }

  constructor() {
    this.items = [];
    this.gratuityPercentage = 10;
    this.paymentMethod = PAYMENT_METHODS.creditCard;
    this.isSplittingBill = false;
  }

  // increase quantity of item in cart by 1
  incrementItem(newItem) {
    const existingItem = this.items.find((item) => item.id === newItem.id);
    if (existingItem !== null) {
      existingItem.quantity += 1;
    } else {
      this.items.push(newItem);
    }
  }

  // reduce quantity of item in cart by 1
  decrementItem(oldItem) {
    const existingItem = this.items.find((item) => item.id === oldItem.id);
    if (existingItem !== null) {
      existingItem.quantity -= 1;

      if (existingItem.quantity <= 0) {
        this.items = this.items.filter((value) => value.id === existingItem.id);
      }
    }
  }

  // delete item from cart, regardless of quantity; 
  // can pass either an item instance or item id 
  deleteItem(item) {
    let filterFunction = (value) => value.id === item.id;

    if (typeof (item) === 'number') {
      filterFunction = (value) => value.id === item;
    }

    this.items = this.items.filter(filterFunction);
  }

  // getters 
  get costNoGratuity() {
    return this.items.reduce((total, num) => { total + num; });
  }

  get costGratuity() {
    return this.costNoGratuity * this.gratuityPercentage / 100;
  }

  get costTotal() {
    return this.costNoGratuity + this.costGratuity;
  }

  get gratuityFormatted() {
    return this.formatAmount(this.costGratuity);
  }

  get noGratuityFormatted() {
    return this.formatAmount(this.costNoGratuity);
  }

  get totalFormatted() {
    return this.formatAmount(this.costTotal);
  }

  // helpers
  static formatAmount(amount) {
    return (amount / 100).toFixed(2).toString;
  }
}