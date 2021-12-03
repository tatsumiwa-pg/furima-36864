function display () {
  const price = document.getElementById('item-price');
  const shipping_fee = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');
  price.addEventListener("keyup", () => {
    const per = 0.1;
    const fee_value  = Math.round(price.value * per);
    const profit_value = price.value - fee_value;
    shipping_fee.innerHTML = fee_value;
    profit.innerHTML = profit_value;
  });
};

window.addEventListener('load', display);