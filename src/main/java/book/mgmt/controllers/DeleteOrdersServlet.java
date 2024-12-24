package book.mgmt.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "MANISH#27";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("orderID");
        
        if (orderID != null && !orderID.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                String sql = "DELETE FROM orders WHERE orderID = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, orderID);
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("manageOrders.jsp"); // Redirect to order management page
                } else {
                    request.setAttribute("errorMessage", "Order not found or could not be deleted.");
                    request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while deleting the order. Please try again.");
                request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
            } finally {
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        } else {
            request.setAttribute("errorMessage", "Invalid order ID.");
            request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
        }
    }
}
