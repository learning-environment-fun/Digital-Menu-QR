export default class CartItem {
  constructor(args = {}) {
    this.name = args.name;
    this.id = args.id;
    this.quantity = args.quantity;
    this.unitPrice = args.unitPrice;
  }

  get totalPrice() {
    return this.quantity * this.unitPrice;
  }

  get priceFormatted() {
    return (this.unitPrice / 100).toFixed(2).toString;
  }

  get totalPriceFormatted() {
    return (this.totalPrice() / 100).toFixed(2).toString;
  }
}