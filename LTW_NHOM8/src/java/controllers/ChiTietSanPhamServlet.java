package controllers;

import dal.SanPhamDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.SanPham;

// File: ChiTietSanPhamServlet.java
@WebServlet(name = "ChiTietSanPhamServlet", urlPatterns = {"/chitiet"})
public class ChiTietSanPhamServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lay id tu URL, vi du: /chitiet?pid=1
        String id_raw = request.getParameter("pid");
        try {
            int id = Integer.parseInt(id_raw);
            SanPhamDAO sanPhamDAO = new SanPhamDAO();
            SanPham sp = sanPhamDAO.getSanPhamByID(id);
            
            request.setAttribute("sanPham", sp);
            request.getRequestDispatcher("chitiet.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.out.println("Loi dinh dang ID: " + e.getMessage());
        }
    }
}