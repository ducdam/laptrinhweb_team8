<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giỏ Hàng</title>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h2>Giỏ Hàng Của Bạn</h2>
        <c:if test="${empty sessionScope.gioHang.items}">
            <p>Chưa có sản phẩm nào trong giỏ hàng.</p>
        </c:if>
        <c:if test="${not empty sessionScope.gioHang.items}">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.gioHang.items}" var="item">
                        <tr>
                            <td>${item.sanPham.tenSanPham}</td>
                            <td><fmt:formatNumber value="${item.sanPham.giaGoc}" type="number"/> đ</td>
                            <td>${item.soLuong}</td>
                            <td><fmt:formatNumber value="${item.sanPham.giaGoc * item.soLuong}" type="number"/> đ</td>
                            <td><a href="giohang?action=delete&id=${item.sanPham.id}">Xóa</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h3 class="total-money">Tổng tiền: <fmt:formatNumber value="${sessionScope.gioHang.totalMoney}" type="number"/> đ</h3>
        </c:if>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>