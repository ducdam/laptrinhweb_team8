<%-- 
    Document   : cart
    Created on : Aug 9, 2025, 10:32:48?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<div class="cart-container">
        <h2>Giỏ Hàng</h2>
        
        <div id="empty-cart-message" class="empty-cart-message" style="display: none;">
            <p>Bạn không có sản phẩm nào trong giỏ hàng. <a href="products.jsp">Mua ngay</a></p>
        </div>

        <div id="cart-items-container" class="cart-items-container">
            </div>

        <div id="cart-summary" class="cart-summary" style="display: none;">
            <h3>Tổng cộng:</h3>
            <div class="summary-details">
                <p>Tổng số sản phẩm: <span id="total-items">0</span></p>
                <p>Tổng giá: <span id="total-price">0đ</span></p>
            </div>
            <button class="checkout-btn">Thanh toán</button>
        </div>
    </div>
<script src="js/cart.js"></script>
<%@include file="footer.jsp" %>