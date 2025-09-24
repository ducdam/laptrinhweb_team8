package controllers;

import dal.DanhMucDAO;
import dal.SanPhamDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.DanhMuc;
import models.SanPham;

// File: TrangChuServlet.java
@WebServlet(name = "TrangChuServlet", urlPatterns = {"/trangchu"})
public class TrangChuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Khoi tao cac doi tuong DAO
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        DanhMucDAO danhMucDAO = new DanhMucDAO();
        
        // Goi cac phuong thuc de lay du lieu
        List<SanPham> danhSachSP = sanPhamDAO.getAllSanPham();
        List<DanhMuc> danhSachDM = danhMucDAO.getAllDanhMuc();
        
        // Thiet lap thuoc tinh de gui du lieu sang JSP
        request.setAttribute("danhSachSP", danhSachSP);
        request.setAttribute("danhSachDM", danhSachDM);
        
        // Chuyen huong (forward) den trang JSP de hien thi
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}