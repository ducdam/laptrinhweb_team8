package models;

// File: SanPham.java
public class SanPham {

    private int id;
    private String tenSanPham;
    private String hinhAnh;
    private double giaGoc;
    private double giaKhuyenMai;
    private String moTa;
    private int idDanhMuc;

    public SanPham() {
    }

    public SanPham(int id, String tenSanPham, String hinhAnh, double giaGoc, double giaKhuyenMai, String moTa, int idDanhMuc) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.hinhAnh = hinhAnh;
        this.giaGoc = giaGoc;
        this.giaKhuyenMai = giaKhuyenMai;
        this.moTa = moTa;
        this.idDanhMuc = idDanhMuc;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public double getGiaGoc() {
        return giaGoc;
    }

    public void setGiaGoc(double giaGoc) {
        this.giaGoc = giaGoc;
    }

    public double getGiaKhuyenMai() {
        return giaKhuyenMai;
    }

    public void setGiaKhuyenMai(double giaKhuyenMai) {
        this.giaKhuyenMai = giaKhuyenMai;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getIdDanhMuc() {
        return idDanhMuc;
    }

    public void setIdDanhMuc(int idDanhMuc) {
        this.idDanhMuc = idDanhMuc;
    }
}