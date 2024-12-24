package book.mgmt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtils {
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    public static final String DB_BASE = "jdbc:mysql://localhost:3306";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "MANISH#27";
    
    public static final String CREATE_SCHEMA = "CREATE SCHEMA IF NOT EXISTS OnlineBookStoreMain";
    
    public static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS books (" +
            "id INT AUTO_INCREMENT PRIMARY KEY, " +
            "barcode VARCHAR(13) UNIQUE NOT NULL, " +
            "name VARCHAR(255) NOT NULL, " +
            "author VARCHAR(255) NOT NULL, " +
            "price DECIMAL(10, 2) NOT NULL, " +
            "quantity INT NOT NULL)";
    
    public static final String INSERT_BOOK = "INSERT INTO books (barcode, name, author, price, quantity) VALUES (?, ?, ?, ?, ?)";
    
    // Update book details
    public static final String UPDATE_BOOK = "UPDATE books SET barcode = ?, name = ?, author = ?, price = ?, quantity = ? WHERE id = ?";
    
    // Delete book by barcode
    public static final String DELETE_BOOK_BY_BARCODE = "DELETE FROM books WHERE barcode = ?";
    
    // Get all books
    public static final String GET_ALL_BOOKS = "SELECT * FROM books";

    static {
        try {
            // Register the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC driver not found", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL , USERNAME, PASSWORD);
    }
}
