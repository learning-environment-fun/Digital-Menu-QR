export default class CartStorage {
  static readCart() {
    return JSON.parse(localStorage.getItem("cart"));
  }

  static writeCart(cart) {
    localStorage.setItem("cart", JSON.stringify(cart));
  }

  static eraseCart() {
    localStorage.removeItem("cart");
  }
}