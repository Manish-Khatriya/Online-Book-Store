package book.mgmt.controllers;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginorderServlet")
public class LoginorderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");

        String dbUrl = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
        String dbUser = "root";
        String dbPassword = "MANISH#27";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String sql = "SELECT * FROM orders WHERE phoneNumber = ? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phoneNumber);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("phoneNumber", phoneNumber);
                session.setAttribute("fullName", rs.getString("fullName"));
                response.sendRedirect("myorderdetails.jsp");
            } else {
                // Login failed
                request.setAttribute("loginError", "Invalid phone number");
                request.getRequestDispatcher("loginorder.jsp").forward(request, response);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("loginError", "An error occurred. Please try again.");
            request.getRequestDispatcher("loginorder.jsp").forward(request, response);
        }
    }
}
