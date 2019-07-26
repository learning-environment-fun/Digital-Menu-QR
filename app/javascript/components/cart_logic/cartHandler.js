import ShoppingCart from '../cart_logic/shoppingCart.js';
import CartStorage from '../cart_logic/cartStorage.js';
import CartItem from '../cart_logic/cartItem.js';

export function cartPageSetup() {
  // which page are we on? 
  const pageDiv = document.querySelector('.app-page');
  switch (pageDiv.id) {
    case 'payment-page':
      handlePaymentPage();
      break;
    case 'feedback-page':
      handleFeedbackPage();
      break;
    case 'order-summary-page':
      handleOrderSummaryPage();
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
  } else {
    this.cart.items.forEach((item) => item = Object.assign(new CartItem, item));
  }
}

function cartErase() {
  CartStorage.eraseCart();
}

function handlePaymentPage() {
  cartLoad();

  document.addEventListener('DOMContentLoaded', () => {
    // need to add listeners to gratuity buttons, display
    const gratuityDecrement = document.querySelector('#gratuity-decrement');
    const gratuityIncrement = document.querySelector('#gratuity-increment');
    const gratuityPercentage = document.querySelector('.gratuity-percentage');
    const gratuityTotal = document.querySelector('.gratuity-total');

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
    const paymentMethodForm = document.querySelector('.payment-method-form');
    paymentMethodForm.querySelectorAll('.rad').forEach((button) => {
      button.addEventListener('click', () => {
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
    const splitTheBillForm = document.querySelector('#split-bill-form');
    const splitTheBillCheckBox = document.querySelector('#split-bill-checkbox');

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

  populateCartSummary();

  // add listeners to trashcan icons
  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.order-action').forEach((button) => {
      button.addEventListener('click', () => {
        this.cart.deleteItem(button.dataset.itemId);
        // need to delete whole row of content--means button, and two siblings preceding
        const elems = [button,
          button.previousElementSibling,
          button.previousElementSibling.previousElementSibling];

        const parent = button.parentElement;

        elems.forEach((child) => parent.removeChild(child));

      });
    });

  });
}

// shown on order-summary-page
function populateCartSummary() {
  const orderGrid = document.querySelector('.order-grid');

  this.cart.items.forEach((item) => {
    const orderItem = document.createElement('span');
    const orderPrice = document.createElement('span');
    const orderAction = document.createElement('button');

    orderItem.classList.add('order-item');
    orderItem.innerHTML = `${item.name} x${item.quantity}`;

    orderPrice.classList.add('order-price');
    orderPrice.innerHTML = `$${item.totalPriceFormatted}`;

    orderAction.classList.add('order-action', 'btn', 'btn-danger', 'bmd-btn-icon');
    orderAction.dataset.itemId = `${item.id}`;
    orderAction.type = 'button';

    const trashCan = document.createElement('i');
    trashCan.classList.add('material-icons');
    trashCan.innerHTML = 'delete_outline';

    orderAction.appendChild(trashCan);

    orderGrid.appendChild(orderItem);
    orderGrid.appendChild(orderPrice);
    orderGrid.appendChild(orderAction);

  });
}
