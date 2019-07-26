import ShoppingCart from '../cart_logic/shoppingCart.js';
import CartStorage from '../cart_logic/cartStorage.js';
import CartItem from '../cart_logic/cartItem.js';

const RailsUJS = require('rails-ujs');
// RailsUJS.start();
let cart = null;

export function cartPageSetup() {
  // which page are we on? 
  const pageDiv = document.querySelector('.app-page');
  switch (pageDiv.id) {
    case 'item-listing-page':
      handleItemListingPage();
      break;
    case 'payment-page':
      handlePaymentPage();
      break;
    case 'feedback-page':
      handleFeedbackPage();
      break;
    case 'order-summary-page':
      handleOrderSummaryPage();
      break;
    case 'restaurant-show-page':
      handleRestaurantShowPage();
      break;
    default:
      console.log("not on a valid page for cart setup");
      break;
  }
}

function cartLoad() {
  cart = Object.assign(new ShoppingCart, CartStorage.readCart());
  if (cart === null || cart === {}) {
    cart = new ShoppingCart();
  } else {
    cart.items = cart.items.map((item) => new CartItem({
      name: item.name,
      id: item.id,
      unitPrice: item.unitPrice,
      quantity: item.quantity
    }));
  }
}

function cartErase() {
  CartStorage.eraseCart();
}

function handleItemListingPage() {
  cartLoad();

  let tempQuantity = 1;

  document.addEventListener('DOMContentLoaded', () => {
    document.querySelector('.item-amount-smaller').addEventListener('click', () => {
      tempQuantity = Math.max(0, tempQuantity - 1);
    });

    document.querySelector('.item-amount-greater').addEventListener('click', () => {
      tempQuantity = Math.min(100, tempQuantity + 1);
    });

    document.querySelector('.commit-to-cart-button').addEventListener('click', (event) => {
      const parent = event.target.parentElement;
      const item = new CartItem({
        id: parent.dataset.itemId,
        name: parent.dataset.itemName,
        unitPrice: parent.dataset.itemPrice,
        quantity: tempQuantity
      });

      cart.incrementItem(item);
    });
  });


}

function handlePaymentPage() {
  cartLoad();

  document.addEventListener('DOMContentLoaded', () => {
    // need to add listeners to gratuity buttons, display
    const gratuityDecrement = document.querySelector('#gratuity-decrement');
    const gratuityIncrement = document.querySelector('#gratuity-increment');
    const gratuityPercentage = document.querySelector('.gratuity-percentage');
    const gratuityTotal = document.querySelector('.gratuity-total');
    const orderTotalAmount = document.querySelector('.order-total-amount');

    const updateGratuityFields = () => {
      gratuityPercentage.innerHTML = `${cart.gratuityPercentage}%`;
      gratuityTotal.innerHTML = `$${cart.costGratuity}`;
      orderTotalAmount.innerHTML = `$${cart.costTotal}`;
    };

    updateGratuityFields();

    gratuityDecrement.addEventListener('click', () => {
      cart.gratuityPercentage = Math.max(0, cart.gratuityPercentage - 5);
      updateGratuityFields();
      CartStorage.writeCart(cart);
    });

    gratuityIncrement.addEventListener('click', () => {
      cart.gratuityPercentage = Math.min(100, cart.gratuityPercentage + 5);
      updateGratuityFields();
      CartStorage.writeCart(cart);
    });

    // need to add listener to payment method buttons 
    const paymentMethodForm = document.querySelector('.payment-method-form');
    paymentMethodForm.querySelectorAll('.rad').forEach((button) => {
      button.addEventListener('click', () => {
        let method = cart.PAYMENT_METHODS.applePay;
        switch (button.dataset.paymentMethod) {
          case 'apple_pay':
            method = cart.PAYMENT_METHODS.applePay;
            break;
          case 'paypal':
            method = cart.PAYMENT_METHODS.payPal;
            break;
          case 'credit_card':
            method = cart.PAYMENT_METHODS.creditCard;
            break;
          case 'cash':
            method = cart.PAYMENT_METHODS.cash;
            break;
          default:
            console.log("invalid payment method button present");
            break;
        }
        cart.paymentMethod = method;
        CartStorage.writeCart(cart);
      });
    });


    // split the bill listener
    const splitTheBillForm = document.querySelector('#split-bill-form');
    const splitTheBillCheckBox = document.querySelector('#split-bill-checkbox');

    splitTheBillForm.addEventListener('click', () => {
      cart.isSplittingBill = splitTheBillCheckBox.checked;
      CartStorage.writeCart(cart);
    });

    const paymentConfirmButton = document.querySelector('.payment-confirm-button');
    paymentConfirmButton.addEventListener('click', () => {
      // send post request to make new order
      fetch('/orders', {
        method: 'post',
        body: JSON.stringify(
          cart
        ),
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': RailsUJS.csrfToken()
        },
        credentials: 'same-origin'
      }).then(function (response) {
        return response.json();
      }).then(function (data) {
        window.location.href = `/feedback/${data.id}`;
      });
    });

  });
}

function handleRestaurantShowPage() {
  cartLoad();

  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.item-decrement-button').forEach((button) => {
      button.addEventListener('click', () => {
        const parent = button.parentElement;
        const item = new CartItem({
          id: parent.dataset.itemId,
          name: parent.dataset.itemName,
          unitPrice: parent.dataset.itemPrice
        });
        cart.decrementItem(item);
        console.log(cart);
      });
    });

    document.querySelectorAll('.item-increment-button').forEach((button) => {
      button.addEventListener('click', () => {
        const parent = button.parentElement;
        const item = new CartItem({
          id: parent.dataset.itemId,
          name: parent.dataset.itemName,
          unitPrice: parent.dataset.itemPrice
        });

        cart.incrementItem(item);

        //console.log(item);
        console.log(cart);
      });
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
        cart.deleteItem(button.dataset.itemId);
        // need to delete whole row of content--means button, and two siblings preceding
        const elems = [button,
          button.previousElementSibling,
          button.previousElementSibling.previousElementSibling
        ];

        const parent = button.parentElement;

        elems.forEach((child) => parent.removeChild(child));

        // update cart total
        const orderTotal = document.querySelector('.order-total-amount');
        orderTotal.innerHTML = `$${cart.noGratuityFormatted}`;

      });
    });

  });
}

// shown on order-summary-page
function populateCartSummary() {
  const orderGrid = document.querySelector('.order-grid');

  const orderTotal = document.querySelector('.order-total-amount');
  orderTotal.innerHTML = `$${cart.noGratuityFormatted}`;

  cart.items.forEach((item) => {
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