package book.mgmt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.mgmt.entities.Book;
import book.mgmt.utils.DbUtils;

public class BookdaoImpl implements Bookdao {

    public BookdaoImpl() {
        try {
            createSchema();
            createTable();
        } catch (Exception e) {
            e.printStackTrace(); // Consider using a logging framework in a real-world application
        }
    }

    private Connection getConnection() throws Exception {
        Class.forName(DbUtils.DRIVER);
        return DriverManager.getConnection(DbUtils.DB_URL, DbUtils.USERNAME, DbUtils.PASSWORD);
    }

    public void createSchema() throws Exception {
        try (Connection con = DriverManager.getConnection(DbUtils.DB_BASE, DbUtils.USERNAME, DbUtils.PASSWORD);
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(DbUtils.CREATE_SCHEMA);
        }
    }

    public void createTable() throws Exception {
        try (Connection con = getConnection();
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(DbUtils.CREATE_TABLE);
        }
    }

    public int addBook(Book book) throws Exception {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.INSERT_BOOK)) {
            pStmt.setString(1, book.getBarcode());
            pStmt.setString(2, book.getName());
            pStmt.setString(3, book.getAuthor());
            pStmt.setDouble(4, book.getPrice());
            pStmt.setInt(5, book.getQuantity());
            return pStmt.executeUpdate();
        }
    }

    public int updateBook(Book book) throws Exception {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.UPDATE_BOOK)) {
            pStmt.setString(1, book.getBarcode());
            pStmt.setString(2, book.getName());
            pStmt.setString(3, book.getAuthor());
            pStmt.setDouble(4, book.getPrice());
            pStmt.setInt(5, book.getQuantity());
            pStmt.setInt(6, book.getId());
            return pStmt.executeUpdate();
        }
    }

    public int deleteBookByBarcode(String barcode) throws Exception {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.DELETE_BOOK_BY_BARCODE)) {
            pStmt.setString(1, barcode);
            return pStmt.executeUpdate();
        }
    }

    public List<Book> getAllBooks() throws Exception {
        List<Book> books = new ArrayList<>();
        try (Connection con = getConnection();
             Statement stmt = con.createStatement();
             ResultSet rset = stmt.executeQuery(DbUtils.GET_ALL_BOOKS)) {
            while (rset.next()) {
                int id = rset.getInt("id");
                String barcode = rset.getString("barcode");
                String name = rset.getString("name");
                String author = rset.getString("author");
                double price = rset.getDouble("price");
                int quantity = rset.getInt("quantity");
                books.add(new Book(id, barcode, name, author, price, quantity));
            }
        }
        return books;
    
    }

    @Override
    public Book getBookById(int id) throws Exception {
        Book book = null;
        String sql = "SELECT * FROM books WHERE id = ?";
        
        try (Connection con = getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int Id = rs.getInt("id");
                    String barcode = rs.getString("barcode");
                    String name = rs.getString("name");
                    String author = rs.getString("author");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    
                    book = new Book(Id, barcode, name, author, price, quantity);
                }
            }
        } 
        return book;
    }
    
    // Other methods like getAllBooks(), addBook(), updateBook(), etc., go here
}

