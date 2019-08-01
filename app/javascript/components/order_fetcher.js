const RailsUJS = require('rails-ujs');

const listenForOrders = () => {
  const ordersContainer = document.querySelector('.orders-container');
  if (ordersContainer !== null) {
    setInterval(() => {
      fetch('/kitchens/orders-list', {
        method: 'get',
        headers: {
          'X-CSRF-Token': RailsUJS.csrfToken()
        },
        credentials: 'same-origin'
      }).then(function (response) {
        response.text().then((text) => { ordersContainer.innerHTML = text });
      });
    }, 2000);
  }
}

export { listenForOrders }