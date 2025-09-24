package models;

import java.util.ArrayList;
import java.util.List;

public class GioHang {
    private List<Item> items;

    public GioHang() {
        items = new ArrayList<>();
    }

    // Thêm sản phẩm vào giỏ hoặc cập nhật số lượng nếu đã có
    public void addItem(Item newItem) {
        for (Item item : items) {
            if (item.getSanPham().getId() == newItem.getSanPham().getId()) {
                item.setSoLuong(item.getSoLuong() + newItem.getSoLuong());
                return;
            }
        }
        items.add(newItem);
    }

    // Xóa sản phẩm khỏi giỏ
    public void removeItem(int id) {
        items.removeIf(item -> item.getSanPham().getId() == id);
    }
    
    // Tính tổng tiền
    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += (item.getSoLuong() * item.getSanPham().getGiaGoc());
        }
        return total;
    }

    public List<Item> getItems() { return items; }
    public void setItems(List<Item> items) { this.items = items; }
}