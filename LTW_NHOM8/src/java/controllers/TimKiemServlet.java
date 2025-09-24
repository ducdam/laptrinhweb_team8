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

@WebServlet(name = "TimKiemServlet", urlPatterns = {"/timkiem"})
public class TimKiemServlet extends HttpServlet {

    // ĐỔI TÊN TỪ doPost THÀNH doGet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8"); 
        
        String tuKhoa = request.getParameter("tuKhoa");
        if (tuKhoa == null) {
            tuKhoa = "";
        }
        
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        DanhMucDAO danhMucDAO = new DanhMucDAO();
        
        List<SanPham> ketQua = sanPhamDAO.timKiemTheoTen(tuKhoa);
        List<DanhMuc> danhSachDM = danhMucDAO.getAllDanhMuc();
        
        // Gửi kết quả và từ khóa tìm kiếm sang trang JSP
        request.setAttribute("danhSachSP", ketQua);
        request.setAttribute("danhSachDM", danhSachDM); // Gửi cả danh sách danh mục
        request.setAttribute("tuKhoaDaTim", tuKhoa);
        
        // Chuyển đến trang index.jsp để hiển thị
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}