import "bootstrap";
require('../bootstrap-material-design.min.js');

import cartPageSetup from '../components/cart_logic/cartHandler.js';
cartPageSetup();

$(document).ready(function () {
  $('body').bootstrapMaterialDesign();
});

import { updateAmountItem } from '../components/updatePriceAmount';
updateAmountItem();