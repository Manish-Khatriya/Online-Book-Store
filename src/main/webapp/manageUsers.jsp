<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<html>
<head>
    <title>Manage Users</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .search-container {
            margin: 20px 0;
        }
        .search-input {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
        }
        .search-button {
            padding: 10px;
            background-color: #ff7200;
            color: white;
            border: none;
            cursor: pointer;
        }
        .pagination {
            margin: 20px 0;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #ff7200;
        }
        .actions a {
            margin-right: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Manage Users</h1>

    <!-- Search and Filter -->
    <div class="search-container">
        <form action="manageUsers.jsp" method="get">
            <input type="text" name="search" class="search-input" placeholder="Search by User ID or Username">
            <input type="submit" value="Search" class="search-button">
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    String url = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
                    String user = "root";
                    String password = "MANISH#27";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    String search = request.getParameter("search");
                    String sql = "SELECT user_id, username, email, password FROM users";
                    if (search != null && !search.trim().isEmpty()) {
                        sql += " WHERE user_id LIKE ? OR username LIKE ?";
                    }
                    stmt = conn.prepareStatement(sql);
                    if (search != null && !search.trim().isEmpty()) {
                        stmt.setString(1, "%" + search + "%");
                        stmt.setString(2, "%" + search + "%");
                    }
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String userID = rs.getString("user_id");
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        String passwordHash = rs.getString("password"); // Retrieve password

            %>
            <tr>
                <td><%= userID %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= passwordHash %></td> <!-- Display the password -->
                <td class="actions">
                    <!-- Update and Delete Buttons -->
                    <a href="DeleteUserServlet?userID=<%= userID %>" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </tbody>
    </table>
</body>
</html>
