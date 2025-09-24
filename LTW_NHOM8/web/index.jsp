<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cửa hàng thời trang PTIT</title>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <main>
            <div class="container">
                <c:if test="${not empty tuKhoaDaTim}">
                    <h2>Kết quả tìm kiếm cho: "${tuKhoaDaTim}"</h2>
                </c:if>

                <div class="product-grid">
                    <c:forEach items="${danhSachSP}" var="sp">
                        <div class="product-item">
                            <a href="chitiet?pid=${sp.id}">
                                <img src="${sp.hinhAnh}" alt="${sp.tenSanPham}">
                                <h3>${sp.tenSanPham}</h3>
                                <p class="price">${sp.giaGoc} đ</p>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>