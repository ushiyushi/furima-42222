const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value / 10);
   const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
})
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);