/* * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', () => {
    const checkoutItemsContainer = document.getElementById('checkout-items');
    const checkoutTotalItems = document.getElementById('checkout-total-items');
    const checkoutTotalPrice = document.getElementById('checkout-total-price');
    const checkoutForm = document.getElementById('checkout-form');

    // Lấy giỏ hàng từ LocalStorage
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    // Kiểm tra nếu giỏ hàng trống, chuyển hướng về trang giỏ hàng
    if (cart.length === 0) {
        alert('Giỏ hàng của bạn đang trống. Vui lòng thêm sản phẩm trước khi thanh toán.');
        window.location.href = 'cart.jsp';
        return;
    }

    let totalItems = 0;
    let totalPrice = 0;

    cart.forEach(item => {
        // Tạo HTML cho từng sản phẩm trong tóm tắt đơn hàng
        const itemTotalPrice = item.price * item.quantity;
        const checkoutItemHTML = `
            <div class="checkout-item">
                <span>${item.name} (x${item.quantity})</span>
                <span>${itemTotalPrice.toLocaleString('vi-VN')}đ</span>
            </div>
        `;
        checkoutItemsContainer.innerHTML += checkoutItemHTML;

        totalItems += item.quantity;
        totalPrice += itemTotalPrice;
    });

    // Cập nhật tổng số sản phẩm và tổng giá
    checkoutTotalItems.textContent = totalItems;
    checkoutTotalPrice.textContent = totalPrice.toLocaleString('vi-VN') + 'đ';

    // Xử lý sự kiện khi form được submit
    checkoutForm.addEventListener('submit', (e) => {
        e.preventDefault(); // Ngăn form gửi đi
        
        // Lấy thông tin người mua
        const fullName = document.getElementById('full-name').value;
        const phoneNumber = document.getElementById('phone-number').value;
        const address = document.getElementById('address').value;
        const email = document.getElementById('email').value;

        // Xử lý logic đặt hàng (ví dụ: gửi dữ liệu đến server)
        console.log('Thông tin đơn hàng:', {
            customer: { fullName, phoneNumber, address, email },
            cart: cart
        });

        // Xóa giỏ hàng sau khi đặt hàng thành công
        localStorage.removeItem('cart');

        // Chuyển hướng đến trang thông báo đặt hàng thành công
        window.location.href = 'order-success.jsp';
    });
});