<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<div class="form-container">
    <h2>Đăng nhập</h2>
    <form action="user" method="post" class="login-form">
        <input type="hidden" name="action" value="login">
        <label>Username:</label>
        <input type="text" name="username" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <button type="submit">Đăng nhập</button>
    </form>
    <p>Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
</div>

<%@include file="footer.jsp" %>
