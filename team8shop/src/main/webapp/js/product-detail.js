/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Dữ liệu sản phẩm mẫu (thay thế bằng dữ liệu thực tế từ database)
const productsData = [
    { 
        id: 1, 
        name: 'Áo Polo', 
        price: 150000, 
        image: 'images/ao_polo_aircool.avif',
        description: 'Áo polo chất liệu Aircool thoáng mát, thấm hút mồ hôi tốt. Kiểu dáng trẻ trung, phù hợp với mọi hoạt động.',
        category: 'Áo'
    },
    { 
        id: 2, 
        name: 'Áo sơ mi', 
        price: 250000, 
        image: 'images/ao_so_mi.avif',
        description: 'Áo sơ mi vải cotton cao cấp, mềm mại và ít nhăn. Thiết kế lịch lãm, dễ dàng phối đồ.',
        category: 'Áo'
    },
    { 
        id: 3, 
        name: 'Quần dài', 
        price: 300000, 
        image: 'images/quan_outdoor.avif',
        description: 'Quần dài outdoor với chất liệu bền bỉ, co giãn, thoải mái vận động. Phù hợp cho dã ngoại, leo núi.',
        category: 'Quần'
    },
    { 
        id: 4, 
        name: 'Quần Jogger', 
        price: 350000, 
        image: 'images/quan_jogger.avif',
        description: 'Quần Jogger chất liệu thun co giãn tốt, thiết kế ống bo năng động. Thích hợp cho thể thao và đi chơi.',
        category: 'Quần'
    },
    { 
        id: 5, 
        name: 'Áo chạy bộ', 
        price: 100000, 
        image: 'images/ao_chay_bo.avif',
        description: 'Áo chạy bộ với chất liệu vải dù cao cấp, siêu nhẹ và thoát mồ hôi. Phù hợp cho các buổi tập luyện cường độ cao.',
        category: 'Áo'
    },
    { 
        id: 6, 
        name: 'Mũ lưỡi trai', 
        price: 50000, 
        image: 'images/mu_luoi_trai.avif',
        description: 'Mũ lưỡi trai phong cách cổ điển, chất liệu cotton, khóa kim loại điều chỉnh dễ dàng. Phụ kiện không thể thiếu.',
        category: 'Phụ kiện'
    },
    { 
        id: 7, 
        name: 'Quần short', 
        price: 90000, 
        image: 'images/short_the_thao.avif',
        description: 'Quần short thể thao co giãn 4 chiều, thoải mái khi vận động. Lưng thun có dây rút, có túi tiện lợi.',
        category: 'Quần'
    },
    { 
        id: 8, 
        name: 'Quần Chino', 
        price: 220000, 
        image: 'images/quan_chino.avif',
        description: 'Quần Chino dáng slim fit, chất vải mềm, bền màu. Phù hợp cho cả đi làm và đi chơi.',
        category: 'Quần'
    },
    { 
        id: 9, 
        name: 'Tất cổ dài', 
        price: 20000, 
        image: 'images/tat_co_dai.avif',
        description: 'Tất cotton cổ dài, thấm hút tốt, không gây bí bách chân. Thiết kế đơn giản, dễ phối đồ.',
        category: 'Phụ kiện'
    },
    { 
        id: 10, 
        name: 'Tất cổ ngắn', 
        price: 20000, 
        image: 'images/tat_co_ngan.avif',
        description: 'Tất cổ ngắn, thoáng khí và êm ái. Phù hợp mang với giày thể thao hoặc giày lười.',
        category: 'Phụ kiện'
    },
    { 
        id: 11, 
        name: 'Thắt lưng', 
        price: 250000, 
        image: 'images/that_lung.avif',
        description: 'Thắt lưng da cao cấp, mặt khóa kim loại sáng bóng. Thiết kế tinh tế, thể hiện sự sang trọng.',
        category: 'Phụ kiện'
    },
    { 
        id: 12, 
        name: 'Quần dài nam', 
        price: 250000, 
        image: 'images/quan_dai_nam.avif',
        description: 'Quần dài nam công sở, chất liệu vải Kaki co giãn. Thiết kế ống đứng, tạo cảm giác thoải mái khi mặc.',
        category: 'Quần'
    },
];

document.addEventListener('DOMContentLoaded', () => {
    // Lấy ID sản phẩm từ URL
    const urlParams = new URLSearchParams(window.location.search);
    const productId = parseInt(urlParams.get('id'));

    const product = productsData.find(p => p.id === productId);

    const productTitlePage = document.getElementById('product-title-page');
    const productMainImage = document.getElementById('product-main-image');
    const productName = document.getElementById('product-name');
    const productPrice = document.getElementById('product-price');
    const productDescriptionText = document.getElementById('product-description-text');
    const minusBtn = document.querySelector('.quantity-btn.minus-btn');
    const plusBtn = document.querySelector('.quantity-btn.plus-btn');
    const quantityInput = document.getElementById('quantity');
    const addToCartBtn = document.getElementById('add-to-cart-btn');

    if (product) {
        // Cập nhật nội dung trang
        productTitlePage.textContent = product.name;
        productMainImage.src = product.image;
        productName.textContent = product.name;
        productPrice.textContent = `${product.price.toLocaleString('vi-VN')}đ`;
        productDescriptionText.textContent = product.description;

        // Xử lý sự kiện click cho nút trừ
        minusBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        });

        // Xử lý sự kiện click cho nút cộng
        plusBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        });

        // Xử lý sự kiện click cho nút thêm vào giỏ hàng
        addToCartBtn.addEventListener('click', () => {
            const selectedSize = document.getElementById('size-select').value;
            const selectedQuantity = parseInt(quantityInput.value);

            if (selectedQuantity < 1 || isNaN(selectedQuantity)) {
                alert('Số lượng không hợp lệ. Vui lòng nhập số lượng lớn hơn 0.');
                return;
            }

            // Lấy thông tin sản phẩm
            const productToAdd = {
                id: product.id,
                name: product.name,
                price: product.price,
                image: product.image,
                size: selectedSize,
                quantity: selectedQuantity
            };

            // Lấy giỏ hàng hiện tại từ LocalStorage
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            
            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
            const existingProductIndex = cart.findIndex(item => item.id === productToAdd.id && item.size === productToAdd.size);

            if (existingProductIndex > -1) {
                // Nếu sản phẩm đã có, cập nhật số lượng
                cart[existingProductIndex].quantity += selectedQuantity;
            } else {
                // Nếu chưa có, thêm sản phẩm mới vào giỏ hàng
                cart.push(productToAdd);
            }

            // Lưu giỏ hàng đã cập nhật vào LocalStorage
            localStorage.setItem('cart', JSON.stringify(cart));
            
            // Chuyển hướng đến trang giỏ hàng
            window.location.href = 'cart.html';
        });

    } else {
        // Xử lý trường hợp không tìm thấy sản phẩm
        alert('Không tìm thấy sản phẩm này!');
        window.location.href = 'products.html'; // Chuyển hướng về trang danh sách
    }
});
