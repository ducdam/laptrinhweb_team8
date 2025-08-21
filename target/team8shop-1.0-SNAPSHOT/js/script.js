/* * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Dữ liệu sản phẩm, mỗi sản phẩm có một 'id' duy nhất
const productsData = [
    { id: 1, name: 'Áo Polo', price: 150000, category: 'Áo', image: 'images/ao_polo_aircool.avif' },
    { id: 2, name: 'Áo sơ mi', price: 250000, category: 'Áo', image: 'images/ao_so_mi.avif' },
    { id: 3, name: 'Quần dài', price: 300000, category: 'Quần', image: 'images/quan_outdoor.avif' },
    { id: 4, name: 'Quần Jogger', price: 350000, category: 'Quần', image: 'images/quan_jogger.avif' },
    { id: 5, name: 'Áo chạy bộ', price: 100000, category: 'Áo', image: 'images/ao_chay_bo.avif' },
    { id: 6, name: 'Mũ lưỡi trai', price: 50000, category: 'Phụ kiện', image: 'images/mu_luoi_trai.avif' },
    { id: 7, name: 'Quần short', price: 90000, category: 'Quần', image: 'images/short_the_thao.avif' },
    { id: 8, name: 'Quần Chino', price: 220000, category: 'Quần', image: 'images/quan_chino.avif' },
    { id: 9, name: 'Tất cổ dài', price: 20000, category: 'Phụ kiện', image: 'images/tat_co_dai.avif' },
    { id: 10, name: 'Tất cổ ngắn', price: 20000, category: 'Phụ kiện', image: 'images/tat_co_ngan.avif' },
    { id: 11, name: 'Thắt lưng', price: 250000, category: 'Phụ kiện', image: 'images/that_lung.avif' },
    { id: 12, name: 'Quần dài nam', price: 250000, category: 'Quần', image: 'images/quan_dai_nam.avif' }
];

let filteredProducts = [...productsData];

const sortSelect = document.getElementById('sort-select');
const filterLinks = document.querySelectorAll('.filter-link');
const productsGrid = document.querySelector('.products-grid');

// Hàm hiển thị sản phẩm ra giao diện
function renderProducts(products) {
    productsGrid.innerHTML = '';
    products.forEach(product => {
        const productItem = document.createElement('div');
        productItem.className = 'product-item';
        // Thêm đường dẫn động dựa trên product.id
        productItem.innerHTML = `
            <a href="product-detail.jsp?id=${product.id}">
                <div class="img-trans"><img src="${product.image}" alt="${product.name}"></div>
                <h4>${product.name}</h4>
                <p>${product.price.toLocaleString('vi-VN')}đ</p>
            </a>
        `;
        productsGrid.appendChild(productItem);
    });
}

// Hàm sắp xếp sản phẩm
function sortProducts(products, sortBy) {
    switch (sortBy) {
        case 'newest':
            return products;
        case 'price-asc':
            return products.sort((a, b) => a.price - b.price);
        case 'price-desc':
            return products.sort((a, b) => b.price - a.price);
        default:
            return products;
    }
}

// Hàm lọc và sắp xếp
function updateProducts() {
    const sortBy = sortSelect.value;
    const activeFilter = document.querySelector('.filter-link.active').textContent;

    if (activeFilter === 'Tất cả') {
        filteredProducts = [...productsData];
    } else {
        filteredProducts = productsData.filter(product => product.category === activeFilter);
    }

    const sortedProducts = sortProducts(filteredProducts, sortBy);
    renderProducts(sortedProducts);
}

// Lắng nghe sự kiện thay đổi trên select
sortSelect.addEventListener('change', updateProducts);

// Lắng nghe sự kiện click trên các liên kết lọc
filterLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        filterLinks.forEach(item => item.classList.remove('active'));
        e.target.classList.add('active');
        updateProducts();
    });
});

// Lần đầu tiên tải trang, hiển thị sản phẩm mặc định
document.addEventListener('DOMContentLoaded', () => {
    updateProducts();
});