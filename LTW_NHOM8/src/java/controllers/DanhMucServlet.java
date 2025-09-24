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

// File: DanhMucServlet.java
@WebServlet(name = "DanhMucServlet", urlPatterns = {"/danhmuc"})
public class DanhMucServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lay id danh muc tu URL, vi du: /danhmuc?cid=2
        String cid_raw = request.getParameter("cid");
        try {
            int cid = Integer.parseInt(cid_raw);
            
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            DanhMucDAO danhMucDAO = new DanhMucDAO();
            
            List<SanPham> danhSachSP = sanPhamDAO.getSanPhamByCID(cid);
            List<DanhMuc> danhSachDM = danhMucDAO.getAllDanhMuc();
            
            request.setAttribute("danhSachSP", danhSachSP);
            request.setAttribute("danhSachDM", danhSachDM);
            // Danh dau danh muc dang duoc chon de to mau tren giao dien
            request.setAttribute("danhMucDaChon", cid);
            
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("Loi dinh dang CID: " + e.getMessage());
        }
    }
}