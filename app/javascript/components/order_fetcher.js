const RailsUJS = require('rails-ujs');

const listenForOrders = () => {
  const ordersContainer = document.querySelector('.orders-container');
  if (ordersContainer !== null) {
    setInterval(() => {
      fetchRequest(ordersContainer);
    }, 2000);
  }
}

const fetchRequest = (ordersContainer) => {
  fetch('/kitchens/orders-list', {
    method: 'get',
    headers: {
      'X-CSRF-Token': RailsUJS.csrfToken()
    },
    credentials: 'same-origin'
  }).then(function (response) {
    response.text().then((text) => {
      document.querySelector('.loading-text').classList.toggle('invisible', true);
      ordersContainer.innerHTML = text
      setUpButtons();
    });
  });
}

const patchRequest = (status, id) => {
  // putting this invisible toggle here instead of in update as a hack
  document.querySelector('.loading-text').classList.toggle('invisible', false);
  fetch('/kitchens/orders', {
    method: 'post',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': RailsUJS.csrfToken()
    },
    body: JSON.stringify(
      {
        order_id: id,
        kitchen_status: status
      }
    ),
    credentials: 'same-origin'
  }).then(function (response) {
    // console.log("a response was received")
    // console.log(response)
    // force page reload
    //fetchRequest(document.querySelector('.orders-container'));
    // ^^ network error; maybe can't call a fetch from within a fetch?
    // now says promise was rejected, even though update goes through--what's happening?
    console.log("updating orders");
    document.querySelector('.loading-text').classList.toggle('invisible', false);
  });
};

const setUpButtons = () => {
  console.log('hello');

  const readyButtons = document.querySelectorAll('.ready');
  const servedButtons = document.querySelectorAll('.served');
  const cancelledButtons = document.querySelectorAll('.cancelled');

  readyButtons.forEach((readyButton) => readyButton.addEventListener('click', () => {
    const id = readyButton.parentElement.dataset.orderId;
    patchRequest('ready', id);
  }));

  servedButtons.forEach((servedButton) => servedButton.addEventListener('click', () => {
    const id = servedButton.parentElement.dataset.orderId;
    patchRequest('served', id);
  }));

  cancelledButtons.forEach((cancelledButton) => cancelledButton.addEventListener('click', () => {
    const id = cancelledButton.parentElement.dataset.orderId;
    patchRequest('cancelled', id);
    console.log(`cancel id was ${id}`);
  }));
};

export {
  listenForOrders
}