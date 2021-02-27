// JavaScriptではwindow全体を読み込んでから実行する為、loadは必ず最初に記述する
window.addEventListener('load',() => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
  //  console.log(inputValue);

   const salesCommission = document.getElementById('add-tax-price');
   salesCommission.innerHTML = Math.floor(inputValue*0.1);
    const salesCommissionValue = Math.floor(inputValue*0.1);

   const salesProfit= document.getElementById('profit');
   salesProfit.innerHTML = inputValue - salesCommissionValue;
   
 })
})