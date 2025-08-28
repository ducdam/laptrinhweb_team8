package com.example.model;

import java.sql.*;

public class UserDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/team8shop_csdl";
    private static final String USER = "user";
    private static final String PASSWORD = "password";

    public boolean registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword()); // Nên mã hóa mật khẩu!
            ps.setString(3, user.getEmail());
            return ps.executeUpdate() > 0;
        }
    }

    public User login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password); // Nên mã hóa mật khẩu!
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                return user;
            }
        }
        return null;
    }
}