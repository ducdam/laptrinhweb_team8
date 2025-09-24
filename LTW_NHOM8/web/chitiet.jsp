<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <%-- Đặt tiêu đề trang theo tên sản phẩm, hoặc tiêu đề mặc định nếu không có sản phẩm --%>
        <c:choose>
            <c:when test="${not empty sanPham}">
                <title>${sanPham.tenSanPham} - Chi tiết sản phẩm</title>
            </c:when>
            <c:otherwise>
                <title>Không tìm thấy sản phẩm</title>
            </c:otherwise>
        </c:choose>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <main>
            <div class="container">
                <%-- Chỉ hiển thị khối chi tiết nếu servlet tìm thấy sản phẩm --%>
                <c:if test="${not empty sanPham}">
                    <div class="product-detail">
                        <div class="product-detail-img">
                            <img src="${sanPham.hinhAnh}" alt="${sanPham.tenSanPham}">
                        </div>
                        <div class="product-detail-info">
                            <h1>${sanPham.tenSanPham}</h1>
                            
                            <%-- Sử dụng fmt để định dạng giá tiền cho dễ đọc --%>
                            <p class="price"><fmt:formatNumber value="${sanPham.giaGoc}" type="number"/> đ</p>
                            
                            <h3>Mô tả sản phẩm</h3>
                            <p>${sanPham.moTa}</p>
                            
                            <%-- Form để thêm sản phẩm vào giỏ hàng, sử dụng method POST --%>
                            <form action="giohang" method="post">
                                <input type="hidden" name="id" value="${sanPham.id}">
                                <div class="form-group">
                                    <label for="soLuong">Số lượng:</label>
                                    <input type="number" id="soLuong" name="soLuong" value="1" min="1" style="width: 60px; padding: 8px;">
                                </div>
                                <button type="submit">Thêm vào giỏ hàng</button>
                            </form>
                        </div>
                    </div>
                </c:if>

                <%-- Hiển thị thông báo nếu không tìm thấy sản phẩm --%>
                <c:if test="${empty sanPham}">
                    <div style="text-align: center; padding: 50px;">
                        <h2>Không tìm thấy sản phẩm</h2>
                        <p>Sản phẩm bạn đang tìm kiếm không tồn tại hoặc đã bị xóa.</p>
                        <a href="trangchu" class="button">Quay về trang chủ</a>
                    </div>
                </c:if>
            </div>
        </main>
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>