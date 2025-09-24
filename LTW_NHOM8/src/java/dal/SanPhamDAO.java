package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.SanPham;

// File: SanPhamDAO.java (phiên bản hoàn chỉnh)
public class SanPhamDAO extends DBContext {

    /**
     * Lay tat ca san pham tu database.
     * @return danh sach cac san pham
     */
    public List<SanPham> getAllSanPham() {
        List<SanPham> danhSach = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("tenSanPham"),
                        rs.getString("hinhAnh"),
                        rs.getDouble("giaGoc"),
                        rs.getDouble("giaKhuyenMai"),
                        rs.getString("moTa"),
                        rs.getInt("idDanhMuc")
                );
                danhSach.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("Loi khi lay danh sach san pham: " + e.getMessage());
        }
        return danhSach;
    }

    /**
     * [MỚI] Lay mot san pham theo ID.
     * @param id ID cua san pham can tim
     * @return doi tuong SanPham hoac null neu khong tim thay
     */
    public SanPham getSanPhamByID(int id) {
        String sql = "SELECT * FROM SanPham WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new SanPham(
                        rs.getInt("id"),
                        rs.getString("tenSanPham"),
                        rs.getString("hinhAnh"),
                        rs.getDouble("giaGoc"),
                        rs.getDouble("giaKhuyenMai"),
                        rs.getString("moTa"),
                        rs.getInt("idDanhMuc")
                );
            }
        } catch (SQLException e) {
            System.out.println("Loi khi tim san pham theo ID: " + e.getMessage());
        }
        return null;
    }
    
    /**
     * [MỚI] Tim kiem san pham theo ten.
     * @param tuKhoa Tu khoa tim kiem
     * @return danh sach san pham phu hop
     */
    public List<SanPham> timKiemTheoTen(String tuKhoa) {
        List<SanPham> danhSach = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE tenSanPham LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Tim kiem tat ca san pham co ten chua tu khoa
            st.setString(1, "%" + tuKhoa + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("tenSanPham"),
                        rs.getString("hinhAnh"),
                        rs.getDouble("giaGoc"),
                        rs.getDouble("giaKhuyenMai"),
                        rs.getString("moTa"),
                        rs.getInt("idDanhMuc")
                );
                danhSach.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("Loi khi tim kiem san pham: " + e.getMessage());
        }
        return danhSach;
    }
    
    /**
     * [MỚI] Lay san pham theo ID danh muc.
     * @param cid ID cua danh muc
     * @return danh sach san pham thuoc danh muc do
     */
    public List<SanPham> getSanPhamByCID(int cid) {
        List<SanPham> danhSach = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE idDanhMuc = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("tenSanPham"),
                        rs.getString("hinhAnh"),
                        rs.getDouble("giaGoc"),
                        rs.getDouble("giaKhuyenMai"),
                        rs.getString("moTa"),
                        rs.getInt("idDanhMuc")
                );
                danhSach.add(sp);
            }
        } catch (SQLException e) {
            System.out.println("Loi khi lay san pham theo danh muc: " + e.getMessage());
        }
        return danhSach;
    }
}