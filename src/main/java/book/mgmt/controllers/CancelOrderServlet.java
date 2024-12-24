package book.mgmt.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String dbUrl = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
        String dbUser = "root";
        String dbPassword = "MANISH#27";
        String orderID = request.getParameter("orderID");

        if (orderID == null || orderID.trim().isEmpty()) {
            request.setAttribute("message", "Invalid order ID");
            request.getRequestDispatcher("orderCancellationStatus.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String message = "";

        try {
            // Load database driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish database connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            // Check if orderID exists
            String checkSql = "SELECT COUNT(*) FROM orders WHERE orderID = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, orderID);
            rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                message = "Order not found";
            } else {
                // Prepare SQL statement to delete the order
                String sql = "DELETE FROM orders WHERE orderID = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, orderID);
                
                // Execute the delete operation
                int rowsAffected = pstmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    message = "Order canceled successfully";
                } else {
                    message = "Failed to cancel order";
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            message = "An error occurred while canceling the order: " + e.getMessage();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            message = "Database driver not found";
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
            if (conn != null) try { conn.close(); } catch (SQLException e) { }
        }
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("orderCancellationStatus.jsp").forward(request, response);
    }
}
