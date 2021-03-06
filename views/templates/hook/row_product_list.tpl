<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
   body {
     margin: 0;
     padding: 0;
   }
   .wrapper {
     display: flex;
     flex-direction: column;
     align-items: center;
     margin-top: 50px;
   }
   .header {
     width: 100%;
     display: flex;
     align-items: center;
   }
   .header-line {
     width: 100%;
     height: 1px;
     background: rgb(182, 182, 182);
   }
   .header-text {
     font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     font-size: 2em;
     font-weight: 200;
     white-space: nowrap;
     padding-left: 13px;
     padding-right: 13px;
   }
   .product-list {
     width: 90%;
     margin-top: 40px;
     display: flex;
     flex-direction: row;
     align-items: center;
     justify-content: center;
   }
   .check-button {
     width: 200px;
     height: 45px;
     border: 1px solid #000;
     display: flex;
     justify-content: center;
     align-items: center;
     font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     font-size: 1.2em;
     font-weight: 200;
     cursor: pointer;
     transition: .3s;
     background: #000;
     color: #fff;
     margin-top: 30px; 
     position: relative;
     padding-right: 25px;
   }
   .check-button:hover {
      background: #fff;
      color: #000;
   }
   .check-button span {
     font-size: 1.3em;
     margin-left: 20px;
     margin-bottom: 2px;
     position: absolute;
     top: 8px;
     right: 38px;
     transition: .3s;
   }
   .product {
     display: flex;
     flex-direction: column;
     align-items: center;
     max-width: 300px;
     margin-left: 20px;
     margin-right: 20px;
   }
   .product-image {
     width: 240px;
     height: 260px;
   }
   .product-title {
     font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     font-size: 1.2em;
     margin-top: 15px;
     text-align: center;
     font-weight: 400;
     letter-spacing: 1px;
   }
   .product-price {
     font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     font-size: 1.2em;
     margin-top: 13px;
     font-weight: 300;
     letter-spacing: 1px;
   }
   .check-product-button {
     width: 180px;
     height: 40px;
     margin-top: 15px;
     font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     font-size: 1.1em;
     font-weight: 300;
     cursor: pointer;
     display: flex;
     justify-content: center;
     align-items: center;
     color: #fff;
     background: orange;
     margin-bottom: 25px;
     transition: .3s;
   }
   .check-product-button:hover {
      background: rgb(255, 174, 24);
   }
   @media only screen and (max-width: 1000px) {
      .product-list {
      flex-direction: column;
    }
   };

  </style>
</head>
<body>
  <div>Dorobić pobieranie ceny zdjęcia i by przenosilo do produktu po wciscnieciu. I by sprawdz wiecej przenosiło do kategorii</div>
  <div class='wrapper'>
    <div class='header'>
      <div class='header-line'></div>
      <div class='header-text'>Wyjątkowe szklanki</div>
      <div class='header-line'></div>
    </div>
    <div class='product-list'>
      {foreach from=$products item=$product}
        <div class='product'>
          <img class='product-image' src="{$image}" alt="product">
          <span class='product-title'>
            {$product.name}
          </span>
          <span class='product-price'>23.54 zł</span>
          <div class='check-product-button'>Dodaj do koszyka</div>
        </div>
      {/foreach}
    </div>
    <div id='check-button' class='check-button'>Sprawdź więcej <span id='button-arrow'>»</span></div>
  </div>
  <script>
    const button =  document.querySelector('#check-button');

    button.addEventListener('mouseover', () => {
      document.querySelector('#button-arrow').style = 'right: 20px;';
    })

    button.addEventListener('mouseout', () => {
      document.querySelector('#button-arrow').style = 'right: 38px';
    })
  </script>
</body>
</html>