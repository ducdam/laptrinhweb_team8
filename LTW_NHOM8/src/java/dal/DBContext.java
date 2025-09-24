package dal;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            // Thay doi cac thong so nay cho phu hop voi may cua ban
            String url = "jdbc:sqlserver://localhost:1433;databaseName=LTW_NHOM8_DB;encrypt=true;trustServerCertificate=true";
            String username = "sa"; // Tai khoan SQL Server
            String password = "12345678"; // Mat khau SQL Server
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Loi ket noi: " + ex.getMessage());
        }
    }
}
