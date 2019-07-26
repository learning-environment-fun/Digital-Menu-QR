import CartItem from '../cart_logic/cartItem.js';
import CartStorage from '../cart_logic/cartStorage.js';

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
    if (typeof (existingItem) !== 'undefined' && existingItem !== null) {
      existingItem.quantity += 1;
    } else {
      this.items.push(newItem);
    }
    CartStorage.writeCart(this);
  }

  incrementItemById(itemId) {
    const existingItem = this.items.find((item) => item.id === itemId);
    if (typeof (existingItem) !== 'undefined' && existingItem !== null) {
      existingItem.quantity += 1;
    } else {
      this.items.push(new CartItem({ id: itemId }));
    }
    CartStorage.writeCart(this);
  }

  // reduce quantity of item in cart by 1
  decrementItem(oldItem) {
    const existingItem = this.items.find((item) => item.id === oldItem.id);
    if (typeof (existingItem) !== 'undefined' && existingItem !== null) {
      existingItem.quantity -= 1;

      if (existingItem.quantity <= 0) {
        this.items = this.items.filter((value) => value.id === existingItem.id);
      }
    }
    CartStorage.writeCart(this);
  }

  // delete item from cart, regardless of quantity; 
  // can pass either an item instance or item id 
  deleteItem(item) {
    let filterFunction = (value) => value.id !== item.id;

    if (typeof (item) === 'number') {
      filterFunction = (value) => value.id !== item;
    }

    this.items = this.items.filter(filterFunction);
    CartStorage.writeCart(this);
  }

  // getters 
  get costNoGratuity() {
    return this.items.map((item) => item.unitPrice * item.quantity).reduce((total, num) => total + num);
  }

  get costGratuity() {
    return this.costNoGratuity * this.gratuityPercentage / 100;
  }

  get costTotal() {
    return this.costNoGratuity + this.costGratuity;
  }

  get gratuityFormatted() {
    return ShoppingCart.formatAmount(this.costGratuity);
  }

  get noGratuityFormatted() {
    return ShoppingCart.formatAmount(this.costNoGratuity);
  }

  get totalFormatted() {
    return ShoppingCart.formatAmount(this.costTotal);
  }

  // helpers
  static formatAmount(amount) {
    return (amount / 100).toFixed(2);
  }
}