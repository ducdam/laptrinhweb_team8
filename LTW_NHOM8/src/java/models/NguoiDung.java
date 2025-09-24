package models;

// File: NguoiDung.java
public class NguoiDung {

    private int id;
    private String hoTen;
    private String email;
    private String tenDangNhap;
    private String matKhau;
    private boolean laQuanTri;

    public NguoiDung() {
    }

    public NguoiDung(int id, String hoTen, String email, String tenDangNhap, String matKhau, boolean laQuanTri) {
        this.id = id;
        this.hoTen = hoTen;
        this.email = email;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.laQuanTri = laQuanTri;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public boolean isLaQuanTri() {
        return laQuanTri;
    }

    public void setLaQuanTri(boolean laQuanTri) {
        this.laQuanTri = laQuanTri;
    }
}