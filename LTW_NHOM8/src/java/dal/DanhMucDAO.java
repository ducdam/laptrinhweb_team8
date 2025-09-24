package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.DanhMuc;

// File: DanhMucDAO.java
public class DanhMucDAO extends DBContext {

    /**
     * Lay tat ca danh muc tu database.
     * @return danh sach cac danh muc
     */
    public List<DanhMuc> getAllDanhMuc() {
        List<DanhMuc> danhSach = new ArrayList<>();
        String sql = "SELECT * FROM DanhMuc";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                DanhMuc dm = new DanhMuc(
                        rs.getInt("id"),
                        rs.getString("tenDanhMuc")
                );
                danhSach.add(dm);
            }
        } catch (SQLException e) {
            System.out.println("Loi khi lay danh sach danh muc: " + e.getMessage());
        }
        
        return danhSach;
    }

    /**
     * Lay mot danh muc theo ID.
     * @param id ID cua danh muc can tim
     * @return doi tuong DanhMuc hoac null neu khong tim thay
     */
    public DanhMuc getDanhMucByID(int id) {
        String sql = "SELECT * FROM DanhMuc WHERE id = ?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return new DanhMuc(
                        rs.getInt("id"),
                        rs.getString("tenDanhMuc")
                );
            }
        } catch (SQLException e) {
            System.out.println("Loi khi tim danh muc theo ID: " + e.getMessage());
        }
        
        return null;
    }
    
    // Cac ham them, sua, xoa danh muc khac neu can...
}