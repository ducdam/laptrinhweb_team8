package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// File: DangXuatServlet.java
@WebServlet(name = "DangXuatServlet", urlPatterns = {"/dangxuat"})
public class DangXuatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Xoa session hien tai
        session.invalidate();
        // Chuyen huong ve trang chu
        response.sendRedirect("trangchu");
    }
}