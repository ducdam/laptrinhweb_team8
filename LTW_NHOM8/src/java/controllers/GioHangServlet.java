package controllers;

import dal.SanPhamDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.GioHang;
import models.Item;
import models.SanPham;

@WebServlet(name = "GioHangServlet", urlPatterns = {"/giohang"})
public class GioHangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHang gioHang = (GioHang) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new GioHang();
        }

        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            gioHang.removeItem(id);
        }
        
        session.setAttribute("gioHang", gioHang);
        request.getRequestDispatcher("giohang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        GioHang gioHang = (GioHang) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new GioHang();
        }

        int id = Integer.parseInt(request.getParameter("id"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        
        SanPhamDAO spDAO = new SanPhamDAO();
        SanPham sp = spDAO.getSanPhamByID(id);
        
        Item item = new Item(sp, soLuong);
        gioHang.addItem(item);
        
        session.setAttribute("gioHang", gioHang);
        response.sendRedirect("trangchu");
    }
}