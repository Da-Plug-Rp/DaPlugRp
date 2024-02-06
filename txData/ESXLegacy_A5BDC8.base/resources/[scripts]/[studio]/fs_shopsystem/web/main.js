let listCard = [];
let products = []

$(function () {
  display(false)
  function display(bool) {
    if (bool) {
      clearCart()

      $("body").css("display", "block");
    } else {

      $("body").css("display", "none");
    }
  }

  window.onload = (e) => {

    window.addEventListener("message", (event) => {
      var item = event.data;
   
      if (item.display) {
        let body = document.querySelector('body');
        body.classList.remove('active');
        document.getElementById("heading").innerText = item.store
        products = item.items
        addDataToHTML()
        display(true)
      } else {
        display(false)
      }


    });
  };
});

if (window.location.pathname.includes('/index.html')) {
  let iconCart = document.querySelector('.iconcart');
  let Close = document.querySelector('.close');
  let body = document.querySelector('body');
  iconCart.addEventListener('click', () => {
    body.classList.add('active');
  })
  Close.addEventListener('click', () => {
    body.classList.remove('active');
  })
  //  addDataToHTML();
  function addDataToHTML() {
    let listProductHTML = document.querySelector('.listProduct');
    listProductHTML.innerHTML = '';

    let categoryTabsHTML = document.querySelector('.category-tabs');
    categoryTabsHTML.innerHTML = '';

    if (products != null) {
      let categories = new Set(products.map(product => product.category));

      // Add "All" category tab
      let allCategoryTab = document.createElement('div');
      allCategoryTab.classList.add('category-tab');
      allCategoryTab.innerText = 'All';
      categoryTabsHTML.appendChild(allCategoryTab);

      allCategoryTab.addEventListener('click', () => {
        showProductsByCategory(null); // Passing null shows all products
      });

      categories.forEach(category => {
        let categoryTab = document.createElement('div');
        categoryTab.classList.add('category-tab');
        categoryTab.innerText = category;
        categoryTabsHTML.appendChild(categoryTab);

        categoryTab.addEventListener('click', () => {
          showProductsByCategory(category);
        });
      });

      // Create and append product items to listProductHTML
      products.forEach(product => {

        let newProduct = document.createElement('div');
        newProduct.classList.add('item');
        newProduct.dataset.category = product.category;
        newProduct.dataset.id = product.id; // Add this line to set the data-id attribute

        if (product.shopaccount == 'black_money') {
          newProduct.innerHTML = `
                  <img src="image/${product.name}.png" alt="Product Image">
                  <h2>${product.label}</h2>
                  <div class="price" style="color: red;">${product.price}</div>
                  <button onclick="addCart(${product.id})">Add To Cart</button>
                `;
        }
        else {

          newProduct.innerHTML = `
              <img src="image/${product.name}.png" alt="Product Image">
              <h2>${product.label}</h2>
              <div class="price" >${product.price}</div>
              <button onclick="addCart(${product.id})">Add To Cart</button>
            `;

        }


        listProductHTML.appendChild(newProduct);
      });

      // Initially, show all products
      showProductsByCategory(null);
    }
  }
  function showProductsByCategory(category) {
    let items = document.querySelectorAll('.item');

    items.forEach(item => {
      let productCategory = item.dataset.category;
      if (category === null || productCategory === category) {
        item.style.display = 'block';
      } else {
        item.style.display = 'none';
      }
    });

    // Toggle the "active" class for the selected category tab
    let categoryTabs = document.querySelectorAll('.category-tab');
    categoryTabs.forEach(tab => {
      if (tab.innerText === category || (category === null && tab.innerText === 'All')) {
        tab.classList.add('active');
      } else {
        tab.classList.remove('active');
      }
    });
  }

  function checkCart() {
    var cookieValue = document.cookie
      .split(';')
      .find(row => row.startsWith('listCard='));
    if (cookieValue) {
      listCard = JSON.parse(cookieValue.split('=')[1]);
    }
  }
  checkCart();
  function addCart($id) {
 
    let productCopy = JSON.parse(JSON.stringify(products));
 
    if (!listCard[$id]) {
      let dataProduct = productCopy.filter(
        product => product.id == $id
      )[0];

      
      listCard[$id] = dataProduct;
     
      listCard[$id].quantity = 1;
    } else {
     
      listCard[$id].quantity + 1;
    }
    let timeSave = "expires=Thu, 31 Dec 2025 23:59:59 UTC";
    document.cookie = "listCard=" + JSON.stringify(listCard) + ";" + timeSave + "; path=/;";
    addCartToHTML();
  }
  // clear cart function
  function clearCart() {
    listCard = [];
    var pastDate = new Date(0).toUTCString();
    document.cookie = "listCard=; expires=" + pastDate + "; path=/;";
    addCartToHTML();
  }
 
  addCartToHTML();
  function addCartToHTML() {
    let listCartHTML = document.querySelector('.listCard');
    listCartHTML.innerHTML = '';
    let totalHTML = document.querySelector('.totalQuantity');
    let priceHTML = document.querySelector('.totalPrice');
    let totalQuantity = 0;
    let price = 0;
    if (listCard) {
      listCard.forEach(product => {
        if (product) {
          let newCart = document.createElement('div');
          newCart.classList.add('item');
          newCart.innerHTML = `
           <img src="image/${product.name}.png">
           <div class="content">
               <div class="name">${product.label}</div>
               <div class="price">${product.price}</div>
           </div>
           <div class="quantity">
               <button  onclick="changeQuantity(${product.id},'-')">-</button>
               <span class="value">${product.quantity}</span>
               <button onclick="changeQuantity(${product.id},'+')">+</button>
           </div>
           `;
          listCartHTML.appendChild(newCart);
          totalQuantity = totalQuantity + product.quantity;
          price += product.price * product.quantity;
        }
      })
    }
    totalHTML.innerText = totalQuantity;
    priceHTML.textContent = price;
  }
  function changeQuantity($idProduct, $type) {
    switch ($type) {
      case '+':
        listCard[$idProduct].quantity++;
        break;
      case '-':
        if (listCard[$idProduct].quantity > 1) {
          listCard[$idProduct].quantity--;
        } else {
          delete listCard[$idProduct];
        }
        break;
      default:
        break;
    }
    let timeSave = "expires=Thu, 31 Dec 2025 23:59:59 UTC";
    document.cookie = "listCard=" + JSON.stringify(listCard) + ";" + timeSave + "; path=/;";

    addCartToHTML();
  }
   
}

var faarrow = document.getElementById('faarrow');

faarrow.addEventListener('click', function () {
  $.post("https://fs_shopsystem/fs_shopsystemexit", JSON.stringify({}))
});
var checkout = document.getElementById('checkout');
checkout.addEventListener('click', function () {
  $.post("https://fs_shopsystem/fs_shopsystemcheckout", JSON.stringify(listCard))

});

document.onkeyup = function (data) {
  if (data.which == 27 || data.which == 8) {
    $.post("https://fs_shopsystem/fs_shopsystemexit", JSON.stringify({}))
  }
};

