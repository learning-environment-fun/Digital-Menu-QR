export default class CartItem {
  constructor(args) {
    this.name = args.name;
    this.id = parseInt(args.id);
    this.quantity = typeof (args.quantity) === 'undefined' || args.quantity === null ? 1 : parseInt(args.quantity);
    this.unitPrice = parseInt(args.unitPrice);
  }

  get totalPrice() {
    return this.quantity * this.unitPrice;
  }

  get priceFormatted() {
    return (this.unitPrice / 100).toFixed(2);
  }

  get totalPriceFormatted() {
    return (this.totalPrice / 100).toFixed(2);
  }
}