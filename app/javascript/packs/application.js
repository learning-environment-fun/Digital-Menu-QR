import "bootstrap";
require('../bootstrap-material-design.min.js');
require("chartkick")
require("chart.js")

// import kitchen organizer
import kitchenOrganizer from "../components/kitchen_organizer";
// const Rails = require('rails-ujs');
// Rails.start();

//import { cartPageSetup } from '../components/cart_logic/cartHandler.js';
//cartPageSetup();

import { listenForOrders } from "../components/order_fetcher.js";

listenForOrders();

$(document).ready(function () {
  $('body').bootstrapMaterialDesign();
});

import { updateAmountItem } from '../components/updatePriceAmount';
updateAmountItem();

// Run kitchen organizer wheen function executes
kitchenOrganizer();
