<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<header>
    <div class="container">
        <a href="trangchu" class="logo">PTIT</a>
        
        <nav>
            <ul>
                <li><a href="trangchu">Trang Chủ</a></li>
                
                <%-- Vòng lặp để hiển thị các danh mục sản phẩm từ servlet --%>
                <c:forEach items="${danhSachDM}" var="dm">
                    <li><a href="danhmuc?cid=${dm.id}">${dm.tenDanhMuc}</a></li>
                </c:forEach>
            </ul>
        </nav>
        
        <div class="header-right">
            <%-- Form tìm kiếm, sử dụng method GET --%>
            <form action="timkiem" method="get" class="search-form">
                <input type="text" name="tuKhoa" placeholder="Tìm kiếm sản phẩm..." value="${tuKhoaDaTim}">
                <button type="submit">Tìm</button>
            </form>

            <div class="auth-links">
                <%-- Kiểm tra xem người dùng đã đăng nhập chưa thông qua session --%>
                <c:if test="${sessionScope.taiKhoan == null}">
                    <a href="dangnhap">Đăng Nhập</a>
                    <a href="dangky">Đăng Ký</a>
                </c:if>
                <c:if test="${sessionScope.taiKhoan != null}">
                    <span>Xin chào, ${sessionScope.taiKhoan.hoTen}</span>
                    <a href="dangxuat">Đăng Xuất</a>
                </c:if>
                
                <%-- Hiển thị số lượng sản phẩm trong giỏ hàng --%>
                <a href="giohang">
                    Giỏ Hàng (
                    <c:choose>
                        <c:when test="${not empty sessionScope.gioHang.items}">
                            ${sessionScope.gioHang.items.size()}
                        </c:when>
                        <c:otherwise>
                            0
                        </c:otherwise>
                    </c:choose>
                    )
                </a>
            </div>
        </div>
    </div>
</header>