<%-- 
    Document   : cart
    Created on : Aug 9, 2025, 10:32:48?PM
    Author     : DW
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.CartItem"%> <%-- Giả sử bạn tạo class CartItem --%>

<%@include file="header.jsp" %>

<%
    // Lấy giỏ hàng từ session
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Xử lý hành động (thêm vào giỏ)
    String action = request.getParameter("action");
    if (action != null && action.equals("add")) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Kiểm tra sản phẩm đã có trong giỏ chưa
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getId().equals(id)) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }
        
        // Nếu chưa có thì thêm mới
        if (!found) {
            cart.add(new CartItem(id, name, price, image, quantity));
        }
        // Cập nhật lại session
        session.setAttribute("cart", cart);
    }
    
    // Tính tổng tiền và tổng số sản phẩm
    double total = 0;
    int totalItems = 0;
    for(CartItem item : cart) {
        total += item.getPrice() * item.getQuantity();
        totalItems += item.getQuantity();
    }
    NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
%>
    <div class="cart-container">
        <h2>Giỏ Hàng</h2>
        
        <% if (cart.isEmpty()) { %>
            <div id="empty-cart-message" class="empty-cart-message">
                <p>Bạn không có sản phẩm nào trong giỏ hàng. <a href="products.jsp">Mua ngay</a></p>
            </div>
        <% } else { %>
            <div id="cart-items-container" class="cart-items-container">
                <div class="cart-header cart-row">
                    <span class="cart-item cart-column">Sản phẩm</span>
                    <span class="cart-price cart-column">Giá</span>
                    <span class="cart-quantity cart-column">Số lượng</span>
                    <span class="cart-subtotal cart-column">Thành tiền</span>
                </div>
                <% for (CartItem item : cart) { %>
                <div class="cart-item-row cart-row">
                    <div class="cart-item cart-column">
                        <img class="cart-item-image" src="<%= item.getImage() %>" alt="<%= item.getName() %>">
                        <span class="cart-item-title"><%= item.getName() %></span>
                    </div>
                    <span class="cart-price cart-column"><%= nf.format(item.getPrice()) %></span>
                    <div class="cart-quantity cart-column">
                        <input class="cart-quantity-input" type="number" value="<%= item.getQuantity() %>" min="1" disabled>
                        <button class="remove-btn">Xóa</button>
                    </div>
                    <span class="cart-subtotal cart-column"><%= nf.format(item.getPrice() * item.getQuantity()) %></span>
                </div>
                <% } %>
            </div>
    
            <div id="cart-summary" class="cart-summary">
                <h3>Tổng cộng:</h3>
                <div class="summary-details">
                    <p>Tổng số sản phẩm: <span id="total-items"><%= totalItems %></span></p>
                    <p>Tổng giá: <span id="total-price"><%= nf.format(total) %></span></p>
                </div>
                <button class="checkout-btn">Thanh toán</button>
            </div>
        <% } %>
    </div>
<%@include file="footer.jsp" %>