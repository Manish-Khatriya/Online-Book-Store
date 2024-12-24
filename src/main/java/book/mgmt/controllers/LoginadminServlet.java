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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginadminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC driver name and database URL
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "MANISH#27";
    
    // SQL query for authentication
    private static final String SQL_QUERY = "SELECT * FROM admin_users WHERE username = ? AND password = ?";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            // Prepare statement
            stmt = conn.prepareStatement(SQL_QUERY);
            stmt.setString(1, username);
            stmt.setString(2, password);
            // Execute query
            rs = stmt.executeQuery();
            
            // Check if a matching record is found
            if (rs.next()) {
                // User authenticated, create a session
                HttpSession session = request.getSession();
                session.setAttribute("adminLoggedIn", true);
                // Redirect to the admin dashboard
                response.sendRedirect("admin.jsp");
            } else {
                // Authentication failed, set error message
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions (consider logging these)
            request.setAttribute("error", "An error occurred while processing your request.");
            request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
