window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    

    const addTaxDom = document.getElementById("add-tax-price")
    const ten_percent = inputValue * 0.1
    addTaxDom.innerHTML = (Math.floor(ten_percent))
  

    const salesProfit = document.getElementById("profit")
    salesProfit.innerHTML = (Math.floor(inputValue - ten_percent))
  })
});