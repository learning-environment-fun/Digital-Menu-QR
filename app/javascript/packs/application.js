import "bootstrap";
require('../bootstrap-material-design.min.js');
require("chartkick")
require("chart.js")
import kitchenOrganizer from "../components/kitchen_organizer";
// const Rails = require('rails-ujs');
// Rails.start();

//import { cartPageSetup } from '../components/cart_logic/cartHandler.js';
//cartPageSetup();

$(document).ready(function () {
  $('body').bootstrapMaterialDesign();
});

import { updateAmountItem } from '../components/updatePriceAmount';
updateAmountItem();
kitchenOrganizer();