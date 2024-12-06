discountCalculator(discount, price) {
  if (discount < 0 || discount > 100) {
    return price;
  } else {
    return price * (1 - (discount / 100));
  }
}
