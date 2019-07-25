import ShoppingCart from '../cart_logic/shoppingCart.js';
import CartStorage from '../cart_logic/cartStorage.js';
import CartItem from '../cart_logic/cartItem.js';

export function cartPageSetup() {
  // which page are we on? 
  pageDiv = document.querySelector('.app-page');
  switch (pageDiv.id) {
    case 'payment-page':
      break;
    case 'feedback-page':
      break;
    case 'order-summary-page':
      break;
    default:
      console.log("not on a valid page for cart setup");
      break;
  }
}

function cartLoad() {
  this.cart = Object.assign(new ShoppingCart, CartStorage.readCart());
  if (this.cart === null || this.cart === {}) {
    this.cart = new ShoppingCart();
  }
}

function cartErase() {
  CartStorage.eraseCart();
}

function handlePaymentPage() {
  cartLoad();

  document.addEventListener('DOMContentLoaded', () => {
    // need to add listeners to gratuity buttons, display
    gratuityDecrement = document.querySelector('#gratuity-decrement');
    gratuityIncrement = document.querySelector('#gratuity-increment');
    gratuityPercentage = document.querySelector('.gratuity-percentage');
    gratuityTotal = document.querySelector('.gratuity-total');

    const updateGratuityFields = () => {
      gratuityPercentage.innerHTML = `${this.cart.gratuityPercentage}%`;
      gratuityTotal.innerHTML = `$${this.cart.costGratuity}`;
    };

    gratuityDecrement.addEventListener('click', () => {
      this.cart.gratuityPercentage = Math.max(0, this.cart.gratuityPercentage - 5);
      updateGratuityFields();
    });

    gratuityIncrement.addEventListener('click', () => {
      this.cart.gratuityPercentage = Math.min(100, this.cart.gratuityPercentage + 5);
      updateGratuityFields();
    });

    // need to add listener to payment method buttons 

    // split the bill listener
  });





  this.gratuityPercentage = 10;
  this.paymentMethod = PAYMENT_METHODS.creditCard;
  this.isSplittingBill = false;
}

function handleFeedbackPage() {
  // order was successfully completed, so the local cart can be erased
  cartErase();
}

function handleOrderSummaryPage() {
  cartLoad();

  // add listeners to trashcan icons
  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.order-action').forEach((button) => {
      button.addEventListener('click', (event) => {
        this.cart.deleteItem(button.dataset.itemId);
        // need to delete whole row of content--means button, and two siblings preceding
        elems = [button,
          button.previousElementSibling,
          button.previousElementSibling.previousElementSibling];

        parent = button.parentElement;

        elems.forEach((child) => parent.removeChild(child));

      });
    });

  });
}