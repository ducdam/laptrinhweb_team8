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
            <div class="sort-by">
                <label for="sort-select">Sắp xếp theo:</label>
                <select id="sort-select">
                    <option value="newest">Mới nhất</option>
                    <option value="price-asc">Giá: Thấp đến cao</option>
                    <option value="price-desc">Giá: Cao đến thấp</option>
                </select>
            </div>
            
            <div class="filter-by">
                <span>Lọc theo:</span>
                <div class="filter-options">
                    <a href="#" class="filter-link active">Tất cả</a>
                    <a href="#" class="filter-link">Áo</a>
                    <a href="#" class="filter-link">Quần</a>
                    <a href="#" class="filter-link">Phụ kiện</a>
                </div>
            </div>
        </div>

        <div class="products-grid">
            <div class="product-item">
                <a href="product-detail.jsp?id=1">
                    <div class="img-trans"><img src="images/ao_polo_aircool.avif" alt="Áo Polo"></div>
                    <h4>Áo Polo</h4>
                    <p>150.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=2">
                    <div class="img-trans"><img src="images/ao_so_mi.avif" alt="Áo sơ mi"></div>
                    <h4>Áo sơ mi</h4>
                    <p>250.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=3">
                    <div class="img-trans"><img src="images/quan_outdoor.avif" alt="Quần dài"></div>
                    <h4>Quần dài</h4>
                    <p>300.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=4">
                    <div class="img-trans"><img src="images/quan_jogger.avif" alt="Quần Jogger"></div>
                    <h4>Quần Jogger</h4>
                    <p>350.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=5">
                    <div class="img-trans"><img src="images/ao_chay_bo.avif" alt="Áo chạy bộ"></div>
                    <h4>Áo chạy bộ</h4>
                    <p>100.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=6">
                    <div class="img-trans"><img src="images/mu_luoi_trai.avif" alt="Mũ"></div>
                    <h4>Mũ lưỡi trai</h4>
                    <p>50.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=7">
                    <div class="img-trans"><img src="images/short_the_thao.avif" alt="Quần short"></div>
                    <h4>Quần short</h4>
                    <p>90.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=8">
                    <div class="img-trans"><img src="images/quan_chino.avif" alt="Quần Chino"></div>
                    <h4>Quần Chino</h4>
                    <p>220.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=9">
                    <div class="img-trans"><img src="images/tat_co_dai.avif" alt="Tất cổ dài"></div>
                    <h4>Tất cổ dài</h4>
                    <p>20.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=10">
                    <div class="img-trans"><img src="images/tat_co_ngan.avif" alt="Tất cổ ngắn"></div>
                    <h4>Tất cổ ngắn</h4>
                    <p>20.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=11">
                    <div class="img-trans"><img src="images/that_lung.avif" alt="Thắt lưng"></div>
                    <h4>Thắt lưng</h4>
                    <p>250.000đ</p>
                </a>
            </div>
            <div class="product-item">
                <a href="product-detail.jsp?id=12">
                    <div class="img-trans"><img src="images/quan_dai_nam.avif" alt="Quần dài nam"></div>
                    <h4>Quần dài nam</h4>
                    <p>250.000đ</p>
                </a>
            </div>
        </div>
    </div>
<script src="js/script.js"></script>
<%@include file="footer.jsp" %>