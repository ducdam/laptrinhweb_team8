<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<div class="form-container">
    <h2>Đăng ký tài khoản</h2>
    <form action="user" method="post" class="register-form">
        <input type="hidden" name="action" value="register">
        <label>Username:</label>
        <input type="text" name="username" required><br>
        <label>Password:</label>
        <input type="password" name="password" required><br>
        <label>Email:</label>
        <input type="email" name="email"><br>
        <button type="submit">Đăng ký</button>
    </form>
    <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
</div>

<%@include file="footer.jsp" %>
