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
    paymentMethodForm = document.querySelector('.payment-method-form');
    paymentMethodForm.querySelectorAll('.rad').forEach((button) => {
      button.addEventListener('click', (_event) => {
        let method = ShoppingCart.PAYMENT_METHODS.applePay;
        switch (button.dataset.paymentMethod) {
          case 'apple_pay':
            method = ShoppingCart.PAYMENT_METHODS.applePay;
            break;
          case 'paypal':
            method = ShoppingCart.PAYMENT_METHODS.payPal;
            break;
          case 'credit_card':
            method = ShoppingCart.PAYMENT_METHODS.creditCard;
            break;
          case 'cash':
            method = ShoppingCart.PAYMENT_METHODS.cash;
            break;
          default:
            console.log("invalid payment method button present");
            break;
        }
        this.cart.paymentMethod = method;
      });
    });


    // split the bill listener
    splitTheBillForm = document.querySelector('#split-bill-form');
    splitTheBillCheckBox = document.querySelector('#split-bill-checkbox');

    splitTheBillForm.addEventListener('click', () => {
      this.cart.isSplittingBill = splitTheBillCheckBox.checked;
    });

  });
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