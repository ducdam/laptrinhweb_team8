<%-- 
    Document   : detail
    Created on : Aug 9, 2025, 10:33:01?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <div class="checkout-container">
        <h2>Thông Tin Thanh Toán</h2>
        <form id="checkout-form">
            <div class="form-group">
                <label for="full-name">Họ và tên</label>
                <input type="text" id="full-name" name="full-name" required>
            </div>
            <div class="form-group">
                <label for="phone-number">Số điện thoại</label>
                <input type="tel" id="phone-number" name="phone-number" required>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="email">Email (tùy chọn)</label>
                <input type="email" id="email" name="email">
            </div>
            
            <div class="order-summary">
                <h3>Tóm tắt đơn hàng</h3>
                <div id="checkout-items">
                    </div>
                <div class="summary-line">
                    <span>Tổng sản phẩm:</span>
                    <span id="checkout-total-items">0</span>
                </div>
                <div class="summary-line total-price-line">
                    <span>Tổng giá:</span>
                    <span id="checkout-total-price">0đ</span>
                </div>
            </div>

            <button type="submit" class="place-order-btn">Đặt hàng</button>
        </form>
    </div>
<script src="js/checkout.js"></script>
<%@include file="footer.jsp" %>