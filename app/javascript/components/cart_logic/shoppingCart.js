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

  formatAmount(amount) {
    return (amount / 100).toFixed(2).toString;
  }
}