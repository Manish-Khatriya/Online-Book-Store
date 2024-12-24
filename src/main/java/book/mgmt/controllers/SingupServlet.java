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

@WebServlet("/SingupServlet")
public class SingupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    private static final String dbUser = "root";
    private static final String dbPassword = "MANISH#27";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            if ("login".equals(action)) {
                handleLogin(request, response);
            } else if ("register".equals(action)) {
                handleRegister(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver not found.");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the request.");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                	request.getSession().setAttribute("username", username);
                    response.sendRedirect("Customerhome.jsp");
                } else {
                    response.sendRedirect("login_register.jsp?error=invalid_login");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error during login.");
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            // Check if username or email already exists
            String checkUserSql = "SELECT * FROM users WHERE username = ? OR email = ?";
            try (PreparedStatement checkUserStatement = connection.prepareStatement(checkUserSql)) {
                checkUserStatement.setString(1, username);
                checkUserStatement.setString(2, email);
                ResultSet resultSet = checkUserStatement.executeQuery();
                
                if (resultSet.next()) {
                    // Username or email already exists
                    String errorMessage = resultSet.getString("username").equals(username) ? "username_exists" : "email_exists";
                    response.sendRedirect("login_register.jsp?error=" + errorMessage);
                    return;
                }
            }

            // Register new user
            String registerSql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement registerStatement = connection.prepareStatement(registerSql)) {
                registerStatement.setString(1, username);
                registerStatement.setString(2, email);
                registerStatement.setString(3, password);
                int rowsInserted = registerStatement.executeUpdate();

                if (rowsInserted > 0) {
                	request.getSession().setAttribute("username", username);
                    response.sendRedirect("login_register.jsp?success=registered");
                } else {
                    response.sendRedirect("login_register.jsp?error=registration_failed");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error during registration.");
        }
    }
}
