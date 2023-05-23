let products = [];
let productsInCart = [];
const divProducts = document.getElementById('products');

function listProducts() {
    // 5. LLamar a la url correcta
    fetch('http://localhost:9000/listProducts.php')
    // --
    .then( (response) => response.json() )
    .then( (data) => {
        products = data; 
        showProducts();
    } )
    .catch( error => console.log(error))
}

function showProducts(){
    
    products.forEach(product => renderProductCard(product));
}

function renderProductCard(product){
    const divProducts= document.getElementById('products');
    const divProduct = document.createElement('div');
    divProduct.setAttribute('class', 'card product-card');
    divProduct.setAttribute('style', 'width: 18rem');
    
    const divProductBody = document.createElement('div');
    divProductBody.setAttribute('class', 'card-body product-card-body');

    
    const productName = document.createElement('h5');
    productName.setAttribute('class', 'card-title')
    
    const productStock = document.createElement('p');
    productStock.setAttribute('class', 'card-text');
    
    const productImage = document.createElement('img');
    productImage.setAttribute('class', 'card-img-top product-img');
    // 6. Agregar la sentencia faltante para que las imágenes de los productos se muestren en la interfaz
    productImage.setAttribute("src",`./img/${product.image}`)
    // --
    const addToCartButton = document.createElement('button');
    // 7. Corregir la etiqueta del botón
    addToCartButton.innerHTML = 'agregar al carrito';
    // --
    addToCartButton.setAttribute("onclick", `addToCart('${product.id}')`);
    addToCartButton.setAttribute('class', 'btn btn-secondary');
    
    productName.innerHTML = product.name;
    productStock.innerHTML = product.stock;
    
    
    divProduct.appendChild(productImage);
    divProduct.appendChild(divProductBody);
    divProductBody.appendChild(productName);
    divProductBody.appendChild(productStock);
    divProductBody.appendChild(addToCartButton);
    divProducts.appendChild(divProduct);
    
}

function addToCart(productId){
    const product = products.filter(product => product.id == productId)[0];
    productsInCart.push(product);
    updateCartList(product);
}

function updateCartList(product){
    const orderList = document.getElementById('cart-products');
    const item = document.createElement('li');
    item.innerHTML = product.name;
    orderList.appendChild(item);
}

function order(){
    const order = {
        userId: 1,
        products: productsInCart 
    };
    const jsonOrder = JSON.stringify( order );
    fetch('http:localhost:9000/order.php', {method:'post', body:jsonOrder})
    .then(() => alert('Pedido realizado'))
    .catch((error) => {
        alert('No se pudo realizar el pedido');
        console.log(error);
    })
}