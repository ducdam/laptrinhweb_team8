<%-- 
    Document   : products
    Created on : Aug 9, 2025, 10:33:45?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<div class="products-main"> 
    <h2>Tất Cả Sản Phẩm</h2>
    
    <div class="filter-sort-container">
        </div>
    
    <div class="product-grid">
        <div class="product-item">
            <a href="product-detail.html?id=1">
                <div class="img-trans"><img src="images/ao1.jpg" alt="Áo thun basic"></div>
                <h4>Áo Thun Basic</h4>
                <p>150.000d</p>
            </a>
        </div>
        
        <div class="product-item">
            <a href="product-detail.html?id=2">
                <div class="img-trans"><img src="images/quan1.jpg" alt="Quần jeans"></div>
                <h4>Quần Jeans</h4>
                <p>350.000d</p>
            </a>
        </div>
        
        <div class="product-item">
            <a href="product-detail.html?id=3">
                <div class="img-trans"><img src="images/quan2.jpg" alt="Quần jeans 2"></div>
                <h4>Quần Jeans 2</h4>
                <p>400.000d</p>
            </a>
        </div>
        
    </div>
</div>

<%@include file="footer.jsp" %>