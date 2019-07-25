import "bootstrap";
require('../bootstrap-material-design.min.js');
// BootstrapMaterialDesign();

$(document).ready(function () {
  $('body').bootstrapMaterialDesign();
});

import { updateAmountItem } from '../components/updatePriceAmount';
updateAmountItem();