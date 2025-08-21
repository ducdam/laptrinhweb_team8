<%-- 
    Document   : detail
    Created on : Aug 9, 2025, 10:33:01?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.NumberFormat, java.util.Locale" %>
<%@include file="header.jsp" %>
<%
    // Lấy thông tin sản phẩm từ URL
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String priceStr = request.getParameter("price");
    String image = request.getParameter("image");
    String description = request.getParameter("description");
    
    // Xử lý các giá trị mặc định nếu không có dữ liệu
    if (name == null) name = "Sản phẩm không có tên";
    if (priceStr == null) priceStr = "0";
    if (image == null) image = "images/default.jpg";
    if (description == null) description = "Đây là mô tả chi tiết của sản phẩm. Chất liệu, đặc điểm nổi bật, v.v.";
    
    double price = Double.parseDouble(priceStr);

    // Định dạng giá tiền cho đẹp
    NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>

    <div class="breadcrumb-container">
    <a href="index.html">Trang chủ</a> / <a href="products.html">Tất cả sản phẩm</a> / <%= name %>
    </div>
    <div class="product-detail-container">
        <div class="product-image-section">
            <img id="product-main-image" src="<%= image %>" alt="<%= name %>">
        </div>
        <div class="product-info-section">
            <h2 id="product-name"><%= name %></h2>
            <p class="product-price" id="product-price"><%= nf.format(price) %></p>
            
            <div class="options-container">
                <div class="size-selector">
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
                    <%= description %>
                </p>
            </div>
        </div>
    </div>

<%@include file="footer.jsp" %>