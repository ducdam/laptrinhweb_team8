package controllers;

import dal.NguoiDungDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.NguoiDung;

// File: DangNhapServlet.java
@WebServlet(name = "DangNhapServlet", urlPatterns = {"/dangnhap"})
public class DangNhapServlet extends HttpServlet {

    // Hien thi trang dang nhap
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
    }

    // Xu ly du lieu tu form dang nhap
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        
        NguoiDungDAO nguoiDungDAO = new NguoiDungDAO();
        NguoiDung taiKhoan = nguoiDungDAO.checkLogin(tenDangNhap, matKhau);
        
        if (taiKhoan == null) {
            // Dang nhap that bai
            request.setAttribute("thongBaoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        } else {
            // Dang nhap thanh cong, luu tai khoan vao Session
            HttpSession session = request.getSession();
            session.setAttribute("taiKhoan", taiKhoan);
            // Chuyen huong ve trang chu
            response.sendRedirect("trangchu");
        }
    }
}