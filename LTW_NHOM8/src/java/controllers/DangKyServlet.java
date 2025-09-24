package controllers;

import dal.NguoiDungDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.NguoiDung;

// File: DangKyServlet.java
@WebServlet(name = "DangKyServlet", urlPatterns = {"/dangky"})
public class DangKyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("dangky.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String hoTen = request.getParameter("hoTen");
        String email = request.getParameter("email");
        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");

        if (!matKhau.equals(nhapLaiMatKhau)) {
            // Lỗi mật khẩu không khớp
            request.setAttribute("thongBaoLoi", "Mật khẩu nhập lại không khớp!");
            request.getRequestDispatcher("dangky.jsp").forward(request, response);
        } else {
            NguoiDungDAO dao = new NguoiDungDAO();
            NguoiDung taiKhoan = dao.checkAccountExist(tenDangNhap);
            if (taiKhoan == null) {
                // Tên đăng nhập chưa tồn tại, tiến hành đăng ký
                dao.signup(hoTen, email, tenDangNhap, matKhau);
                response.sendRedirect("dangnhap");
            } else {
                // Lỗi tên đăng nhập đã tồn tại
                request.setAttribute("thongBaoLoi", "Tên đăng nhập đã tồn tại!");
                request.getRequestDispatcher("dangky.jsp").forward(request, response);
            }
        }
    }
}