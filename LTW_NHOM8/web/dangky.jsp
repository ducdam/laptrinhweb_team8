<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng Ký Tài Khoản</title>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="form-container">
        <h2>Tạo tài khoản</h2>
        <c:if test="${not empty thongBaoLoi}">
            <p class="error-message">${thongBaoLoi}</p>
        </c:if>
        <form action="dangky" method="post">
            <div class="form-group">
                <label>Họ và Tên</label>
                <input type="text" name="hoTen" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            <div class="form-group">
                <label>Tên đăng nhập</label>
                <input type="text" name="tenDangNhap" required>
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="matKhau" required>
            </div>
            <div class="form-group">
                <label>Nhập lại mật khẩu</label>
                <input type="password" name="nhapLaiMatKhau" required>
            </div>
            <button type="submit">Đăng Ký</button>
        </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>