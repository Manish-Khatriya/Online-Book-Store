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

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "MANISH#27";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        
        if (userID != null && !userID.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                String sql = "DELETE FROM users WHERE user_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userID);
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.sendRedirect("manageUsers.jsp"); // Redirect to user management page
                } else {
                    request.setAttribute("errorMessage", "User not found or could not be deleted.");
                    request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while deleting the user. Please try again.");
                request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
            } finally {
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        } else {
            request.setAttribute("errorMessage", "Invalid user ID.");
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
        }
    }
}
