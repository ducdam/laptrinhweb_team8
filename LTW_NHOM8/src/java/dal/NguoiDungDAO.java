package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.NguoiDung;

// File: NguoiDungDAO.java
public class NguoiDungDAO extends DBContext {

    /**
     * Kiem tra thong tin dang nhap cua nguoi dung.
     * @param tenDangNhap Ten dang nhap
     * @param matKhau Mat khau (chua ma hoa)
     * @return doi tuong NguoiDung neu dang nhap thanh cong, null neu that bai
     */
    public NguoiDung checkLogin(String tenDangNhap, String matKhau) {
        String sql = "SELECT * FROM NguoiDung WHERE tenDangNhap = ? AND matKhau = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tenDangNhap);
            st.setString(2, matKhau); // Luu y: Trong thuc te, mat khau can duoc ma hoa
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new NguoiDung(
                        rs.getInt("id"),
                        rs.getString("hoTen"),
                        rs.getString("email"),
                        rs.getString("tenDangNhap"),
                        rs.getString("matKhau"),
                        rs.getBoolean("laQuanTri")
                );
            }
        } catch (SQLException e) {
            System.out.println("Loi khi kiem tra dang nhap: " + e.getMessage());
        }
        return null;
    }
    /**
 * Kiem tra ten dang nhap da ton tai trong CSDL hay chua.
 * @param tenDangNhap Ten dang nhap can kiem tra
 * @return doi tuong NguoiDung neu tim thay, null neu khong ton tai
 */
public NguoiDung checkAccountExist(String tenDangNhap) {
    String sql = "SELECT * FROM NguoiDung WHERE tenDangNhap = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, tenDangNhap);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return new NguoiDung(
                    rs.getInt("id"),
                    rs.getString("hoTen"),
                    rs.getString("email"),
                    rs.getString("tenDangNhap"),
                    rs.getString("matKhau"),
                    rs.getBoolean("laQuanTri")
            );
        }
    } catch (SQLException e) {
        System.out.println("Loi khi kiem tra tai khoan: " + e.getMessage());
    }
    return null;
}

/**
 * Them mot tai khoan moi vao CSDL.
 * @param hoTen Ho ten nguoi dung
 * @param email Email
 * @param tenDangNhap Ten dang nhap
 * @param matKhau Mat khau
 */
public void signup(String hoTen, String email, String tenDangNhap, String matKhau) {
    String sql = "INSERT INTO NguoiDung(hoTen, email, tenDangNhap, matKhau, laQuanTri) VALUES(?,?,?,?,0)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, hoTen);
        st.setString(2, email);
        st.setString(3, tenDangNhap);
        st.setString(4, matKhau); // Luu y: Can ma hoa mat khau trong thuc te
        st.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Loi khi dang ky tai khoan: " + e.getMessage());
    }
}

    // Cac ham them sua, xoa nguoi dung khac...
}