/* * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Function to update the cart in LocalStorage and re-render
function updateCartAndRender(cart) {
    localStorage.setItem('cart', JSON.stringify(cart));
    renderCart();
}

// Function to update item quantity in cart
function updateQuantity(id, size, change) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const itemIndex = cart.findIndex(item => item.id === id && item.size === size);

    if (itemIndex > -1) {
        cart[itemIndex].quantity += change;
        if (cart[itemIndex].quantity <= 0) {
            cart.splice(itemIndex, 1);
        }
        updateCartAndRender(cart);
    }
}

// Function to remove item from cart
function removeFromCart(id, size) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const updatedCart = cart.filter(item => !(item.id === id && item.size === size));
    updateCartAndRender(updatedCart);
}

// Function to render the cart
function renderCart() {
    const emptyCartMessage = document.getElementById('empty-cart-message');
    const cartItemsContainer = document.getElementById('cart-items-container');
    const cartSummary = document.getElementById('cart-summary');
    const totalItemsSpan = document.getElementById('total-items');
    const totalPriceSpan = document.getElementById('total-price');
    const checkoutBtn = document.querySelector('.checkout-btn');

    // Lấy dữ liệu giỏ hàng từ LocalStorage
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    if (cart.length === 0) {
        emptyCartMessage.style.display = 'block';
        cartItemsContainer.innerHTML = '';
        cartSummary.style.display = 'none';
        return;
    }

    emptyCartMessage.style.display = 'none';
    cartSummary.style.display = 'block';

    cartItemsContainer.innerHTML = '';
    let totalItems = 0;
    let totalPrice = 0;

    cart.forEach(item => {
        // TẠO HTML CHO TỪNG SẢN PHẨM trong giỏ hàng
        const itemTotalPrice = item.price * item.quantity;
        const cartItemHTML = `
            <div class="cart-item">
                <img src="${item.image}" alt="${item.name}">
                <div class="item-info">
                    <h4>${item.name}</h4>
                    <p>Kích cỡ: ${item.size}</p>
                    <p>Giá: ${item.price.toLocaleString('vi-VN')}đ</p>
                </div>
                <div class="item-quantity">
                    <button class="quantity-btn minus-btn" data-id="${item.id}" data-size="${item.size}">-</button>
                    <input type="number" class="quantity-input" value="${item.quantity}" min="1" data-id="${item.id}" data-size="${item.size}">
                    <button class="quantity-btn plus-btn" data-id="${item.id}" data-size="${item.size}">+</button>
                </div>
                <p class="item-total-price">${itemTotalPrice.toLocaleString('vi-VN')}đ</p>
                <button class="remove-btn" data-id="${item.id}" data-size="${item.size}">Xóa</button>
            </div>
        `;
        cartItemsContainer.innerHTML += cartItemHTML;

        totalItems += item.quantity;
        totalPrice += itemTotalPrice;
    });

    totalItemsSpan.textContent = totalItems;
    totalPriceSpan.textContent = totalPrice.toLocaleString('vi-VN') + 'đ';

    // Gán lại sự kiện cho các nút sau khi render
    attachEventListeners();
}

// Gán sự kiện cho các nút điều chỉnh số lượng và xóa
function attachEventListeners() {
    const minusBtns = document.querySelectorAll('.cart-item .minus-btn');
    const plusBtns = document.querySelectorAll('.cart-item .plus-btn');
    const removeBtns = document.querySelectorAll('.cart-item .remove-btn');
    const quantityInputs = document.querySelectorAll('.cart-item .quantity-input');
    const checkoutBtn = document.querySelector('.checkout-btn');

    minusBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const id = parseInt(btn.dataset.id);
            const size = btn.dataset.size;
            updateQuantity(id, size, -1);
        });
    });

    plusBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const id = parseInt(btn.dataset.id);
            const size = btn.dataset.size;
            updateQuantity(id, size, 1);
        });
    });

    removeBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const id = parseInt(btn.dataset.id);
            const size = btn.dataset.size;
            removeFromCart(id, size);
        });
    });

    quantityInputs.forEach(input => {
        input.addEventListener('change', (e) => {
            const id = parseInt(e.target.dataset.id);
            const size = e.target.dataset.size;
            let newQuantity = parseInt(e.target.value);
            if (isNaN(newQuantity) || newQuantity < 1) {
                newQuantity = 1;
            }
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const item = cart.find(i => i.id === id && i.size === size);
            if (item) {
                item.quantity = newQuantity;
                updateCartAndRender(cart);
            }
        });
    });
    
    // Thêm sự kiện click cho nút Thanh toán
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', () => {
            window.location.href = 'checkout.jsp';
        });
    }
}

// Gọi hàm render khi trang được tải
document.addEventListener('DOMContentLoaded', renderCart);