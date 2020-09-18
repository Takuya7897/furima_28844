window.addEventListener("DOMContentLoaded", () => {
    // 要素の取り出し
    console.log(22222)
    const priceInput = document.getElementById("item-price");
    const addTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      // 値の取り出し
      const inputValue = document.getElementById("item-price").value;
      // 計算と出力
        addTax.innerHTML = Math.floor(inputValue * 0.1);
        profit.innerHTML = Math.floor(inputValue * 0.9);
    })
});
