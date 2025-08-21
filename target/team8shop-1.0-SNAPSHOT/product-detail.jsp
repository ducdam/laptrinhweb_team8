<%-- 
    Document   : detail
    Created on : Aug 9, 2025, 10:33:01?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<div class="breadcrumb-container">
    <a href="index.jsp">Trang chủ</a> / <a href="products.jsp">Tất cả sản phẩm</a> / <span id="breadcrumb-product-name">Tên sản phẩm</span>
    </div>
    <div class="product-detail-container">
        <div class="product-image-section">
            <img id="product-main-image" src="" alt="Hình ảnh sản phẩm">
        </div>
        <div class="product-info-section">
            <h2 id="product-name">Tên sản phẩm</h2>
            <p class="product-price" id="product-price">Giá sản phẩm</p>
            
            <div class="product-options">
                <div class="size-options">
                    <label>Kích cỡ:</label>
                    <select id="size-select">
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                    </select>
                </div>
                
                <div class="quantity-selector">
                    <label for="quantity">Số lượng:</label>
                    <div class="quantity-input-group">
                        <button class="quantity-btn minus-btn">-</button>
                        <input type="number" id="quantity" class="quantity-input" value="1" min="1">
                        <button class="quantity-btn plus-btn">+</button>
                    </div>
                </div>
            </div>
            
            <button id="add-to-cart-btn" class="add-to-cart-btn">Thêm vào giỏ hàng</button>
            
            <div class="product-description">
                <h3>Mô tả sản phẩm</h3>
                <p id="product-description-text">
                    Đây là mô tả chi tiết của sản phẩm. Chất liệu, đặc điểm nổi bật, v.v.
                </p>
            </div>
        </div>
    </div>
<script src="js/product-detail.js"></script>
<%@include file="footer.jsp" %>