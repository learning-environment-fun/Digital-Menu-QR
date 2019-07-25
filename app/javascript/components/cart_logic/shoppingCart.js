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
    existingItem = this.items.find((item) => item.id === newItem.id);
    if (existingItem !== null) {
      existingItem.quantity += 1;
    } else {
      this.items.push(newItem);
    }
  }

  // reduce quantity of item in cart by 1
  decrementItem(oldItem) {
    existingItem = this.items.find((item) => item.id === oldItem.id);
    if (existingItem !== null) {
      existingItem.quantity -= 1;

      if (existingItem.quantity <= 0) {
        this.items = this.items.filter((value, _index, _arr) => value.id === existingItem.id);
      }
    }
  }

  // delete item from cart, regardless of quantity 
  deleteItem(item) {
    this.items = this.items.filter((value, _index, _arr) => value.id === item.id);
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
    return formatAmount(this.costGratuity);
  }

  get noGratuityFormatted() {
    return formatAmount(this.costNoGratuity);
  }

  get totalFormatted() {
    return formatAmount(this.costTotal);
  }

  // helpers
  static formatAmount(amount) {
    return (amount / 100).toFixed(2).toString;
  }
}