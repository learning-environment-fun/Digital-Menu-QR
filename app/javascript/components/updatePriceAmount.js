const updateAmountItem = () => {



// save the Plus Button in a var
const clickPlus = document.querySelector(".item-amount-greater");
const clickMinus = document.querySelector(".item-amount-smaller");
var input = document.getElementById("input");

  // save the Plus Button in a var

  const priceItem = document.querySelector("#price");
  // -------------- INCREASE BUTTON ---------------------------------



  if (clickPlus !== null && clickMinus !== null && priceItem !== null) {

    // --- this has to be out of the clickPlus function ---------------
    // --because it needs a fix price, to stop increasing the price until reaching 5 amounts
    const price = priceItem.innerHTML;
    let priceInteger = parseInt(price, 10);
    var stoppPrice = price * 5;




// ----------- Increase Function --------------------------------
// increase Amount +1, double the Value when button + is clicked
clickPlus.addEventListener("click", () => {
  // save the price into a variable and convert to integer
const price = document.querySelector("#price").innerHTML;
let priceInteger = parseInt(price, 10);
// save the amount into a var and convert to integer
var amount = document.querySelector(".item-amount-display p").innerHTML;
//console.log(amount);
let amountInteger = parseInt(amount, 10);



      event.preventDefault();
      const totalprice = priceInteger / amountInteger * (amountInteger + 1);

if (amountInteger == 5) {
document.querySelector("#price").innerHTML =stoppPrice;
} else {
  amountInteger += 1;
  document.querySelector("#price").innerHTML = totalprice;
  document.querySelector(".item-amount-display p").innerHTML = amountInteger;
  // Change the value of the input form with the amount
  document.getElementById("input").value = amountInteger;
}

    }); // end of event Listener for clickPlusbutton


    // -------------- DECREASE BUTTON ---------------------------------

// decrease Amount -1, reduce the Value when button - is clicked
clickMinus.addEventListener("click", () => {
  // save the price into a variable and convert to integer
var price = document.querySelector("#price").innerHTML;
let priceInteger = parseInt(price, 10);
// save the amount into a var and convert to integer
var amount = document.querySelector(".item-amount-display p").innerHTML;
let amountInteger = parseInt(amount, 10);

event.preventDefault();
const totalprice = priceInteger / amountInteger * (amountInteger - 1);
// Check if amount is not zero!
if (amountInteger < 2) {
amountInteger = 1;
document.querySelector("#price").innerHTML = price;
} else {
  amountInteger -= 1;
  document.querySelector("#price").innerHTML = totalprice;
  document.querySelector(".item-amount-display p").innerHTML = amountInteger;
    // Change the value of the input form with the amount
  document.getElementById("input").value = amountInteger;
}

    }); // end of event Listener for clickPlusbutton

  }
}

export {
  updateAmountItem
};
