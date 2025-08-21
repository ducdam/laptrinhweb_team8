<%-- 
    Document   : index
    Created on : Aug 9, 2025, 10:33:36?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

    <div class="banner">
      <img src="images/banner1.jpg" alt="" class="banner_img">
      <a href="products.jsp" class="buy-now-btn">Shop now</a>
    </div>
    <div class="featured-products">
      <h3>Sản phẩm bán chạy</h3>
      <div class="product-item">
          <a href="product-detail.jsp?id=1">
            <div class="img-trans"><img src="images/ao_polo_aircool.avif" alt="Áo Polo"></div>
            <h4>Áo Polo</h4>
            <p>150.000d</p>
          </a>
      </div>
      <div class="product-item">
          <a href="product-detail.jsp?id=2">
            <div class="img-trans"><img src="images/ao_so_mi.avif" alt="Áo sơ mi"></div>
            <h4>Áo sơ mi</h4>
            <p>250.000d</p>
          </a>
      </div>
      <div class="product-item">
          <a href="product-detail.jsp?id=3">
            <div class="img-trans"><img src="images/quan_outdoor.avif" alt="Quần dài"></div>
            <h4>Quần dài</h4>
            <p>300.000d</p>
            </a>
      </div>
    </div>
<%@include file="footer.jsp" %>