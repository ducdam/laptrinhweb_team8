/* * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Dữ liệu sản phẩm, mỗi sản phẩm có một 'id' duy nhất
const productsData = [
    { id: 1, name: 'Áo Polo', price: 150000, category: 'Áo', image: 'images/ao_polo_aircool.avif', description: 'Áo Polo chất liệu vải cao cấp, thoáng mát, thích hợp cho mọi hoạt động hàng ngày.' },
    { id: 2, name: 'Áo sơ mi', price: 250000, category: 'Áo', image: 'images/ao_so_mi.avif', description: 'Áo sơ mi thiết kế tinh tế, lịch lãm, phù hợp cho môi trường công sở và các buổi tiệc.' },
    { id: 3, name: 'Quần dài', price: 300000, category: 'Quần', image: 'images/quan_outdoor.avif', description: 'Quần dài outdoor với chất liệu bền bỉ, co giãn tốt, mang lại sự thoải mái khi vận động.' },
    { id: 4, name: 'Quần Jogger', price: 350000, category: 'Quần', image: 'images/quan_jogger.avif', description: 'Quần Jogger form dáng trẻ trung, năng động, phù hợp cho tập luyện thể thao và dạo phố.' },
    { id: 5, name: 'Áo chạy bộ', price: 100000, category: 'Áo', image: 'images/ao_chay_bo.avif', description: 'Áo chạy bộ chuyên dụng với công nghệ thấm hút mồ hôi, giúp bạn luôn khô thoáng.' },
    { id: 6, name: 'Mũ lưỡi trai', price: 50000, category: 'Phụ kiện', image: 'images/mu_luoi_trai.avif', description: 'Mũ lưỡi trai phong cách, bảo vệ bạn khỏi ánh nắng mặt trời, dễ dàng phối đồ.' },
    { id: 7, name: 'Quần short', price: 90000, category: 'Quần', image: 'images/short_the_thao.avif', description: 'Quần short thể thao, nhẹ và co giãn tốt, lý tưởng cho các hoạt động ngoài trời.' },
    { id: 8, name: 'Quần Chino', price: 220000, category: 'Quần', image: 'images/quan_chino.avif', description: 'Quần Chino kiểu dáng hiện đại, chất liệu cotton cao cấp, mang lại sự thoải mái và lịch lãm.' },
    { id: 9, name: 'Tất cổ dài', price: 20000, category: 'Phụ kiện', image: 'images/tat_co_dai.avif', description: 'Tất cổ dài với chất liệu mềm mại, ôm sát, giúp bảo vệ chân hiệu quả.' },
    { id: 10, name: 'Tất cổ ngắn', price: 20000, category: 'Phụ kiện', image: 'images/tat_co_ngan.avif', description: 'Tất cổ ngắn tiện lợi, thoáng khí, phù hợp cho giày lười và giày thể thao.' },
    { id: 11, name: 'Thắt lưng', price: 250000, category: 'Phụ kiện', image: 'images/that_lung.avif', description: 'Thắt lưng da cao cấp, thiết kế sang trọng, điểm nhấn hoàn hảo cho trang phục của bạn.' },
    { id: 12, name: 'Quần dài nam', price: 250000, category: 'Quần', image: 'images/quan_dai_nam.avif', description: 'Quần dài nam với chất liệu vải thoáng khí, form regular fit, phù hợp cho mọi vóc dáng.' }
];

document.addEventListener('DOMContentLoaded', () => {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = parseInt(urlParams.get('id'));

    const product = productsData.find(p => p.id === productId);

    if (product) {
        document.getElementById('product-main-image').src = product.image;
        document.getElementById('product-main-image').alt = product.name;
        document.getElementById('product-name').textContent = product.name;
        document.getElementById('breadcrumb-product-name').textContent = product.name;
        document.getElementById('product-price').textContent = `${product.price.toLocaleString('vi-VN')}đ`;
        document.getElementById('product-description-text').textContent = product.description;

        const quantityInput = document.getElementById('quantity');
        const minusBtn = document.querySelector('.minus-btn');
        const plusBtn = document.querySelector('.plus-btn');

        minusBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        });

        plusBtn.addEventListener('click', () => {
            let currentValue = parseInt(quantityInput.value);
            quantityInput.value = currentValue + 1;
        });

        // Thêm đoạn code mới ở đây
        const addToCartBtn = document.getElementById('add-to-cart-btn');
        addToCartBtn.addEventListener('click', () => {
            const sizeSelect = document.getElementById('size-select');
            const selectedSize = sizeSelect.value;
            const quantity = parseInt(quantityInput.value);

            addToCart(product, selectedSize, quantity);
        });

    } else {
        document.querySelector('.product-detail-container').innerHTML = '<p>Không tìm thấy sản phẩm.</p>';
        document.getElementById('breadcrumb-product-name').textContent = 'Sản phẩm không tồn tại';
    }
});

// Hàm mới để thêm sản phẩm vào giỏ hàng
function addToCart(product, size, quantity) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingItemIndex = cart.findIndex(item => item.id === product.id && item.size === size);

    if (existingItemIndex > -1) {
        // Nếu sản phẩm đã tồn tại, cập nhật số lượng
        cart[existingItemIndex].quantity += quantity;
    } else {
        // Nếu sản phẩm chưa tồn tại, thêm mới vào giỏ hàng
        const newItem = {
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.image,
            size: size,
            quantity: quantity
        };
        cart.push(newItem);
    }

    // Lưu lại giỏ hàng vào LocalStorage
    localStorage.setItem('cart', JSON.stringify(cart));

    // Chuyển hướng đến trang giỏ hàng
    window.location.href = 'cart.jsp';
}