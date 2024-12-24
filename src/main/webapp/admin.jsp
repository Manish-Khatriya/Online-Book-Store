<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Online Bookstore</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #ecf0f1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 2rem;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h1 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .sidebar a {
            width: 100%;
            padding: 1rem;
            color: #ecf0f1;
            text-decoration: none;
            text-align: left;
            padding-left: 80px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .sidebar a.active {
            background-color: #e74c3c;
        }

        .sidebar i {
            margin-right: 0.5rem;
        }

        .main-content {
            flex-grow: 1;
            background-color: #ecf0f1;
            padding: 2rem;
            overflow-y: auto;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: #34495e;
            color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar h2 {
            margin: 0;
        }

        .navbar .nav-links a {
            color: #ecf0f1;
            text-decoration: none;
            margin-left: 1.5rem;
        }

        .navbar .nav-links a:hover {
            text-decoration: underline;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .card {
            background-color: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card a {
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .card i {
            font-size: 2rem;
            color: #e74c3c;
            margin-bottom: 0.5rem;
        }

        .card h3 {
            font-size: 1.5rem;
            margin: 0;
        }

        .card p {
            font-size: 1.2rem;
            margin: 0.5rem 0 0;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h1>Admin</h1>
        <a href="index.jsp" class="active"><i class="fas fa-home"></i> Home</a>
        <a href="AddBook.jsp"><i class="fas fa-book"></i> Manage Books</a>
        <a href="manageOrders.jsp"><i class="fas fa-shopping-cart"></i> Manage Orders</a>
        <a href="manageUsers.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="salesReport.jsp"><i class="fas fa-chart-line"></i> Reports</a>
        <a href="setting.jsp"><i class="fas fa-cog"></i> Settings</a>
    </div>

    <div class="main-content">
        <div class="navbar">
            <h2>Dashboard</h2>
            <div class="nav-links">
                <a href="adminabout.jsp"><i class="fas fa-user"></i> Profile</a>
                <a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

        <div class="dashboard-cards">
            <%-- JDBC Code to Connect to Database and Fetch Total Books, Users, Orders, and Sales --%>
            <%
                String url = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
                String user = "root";
                String password = "MANISH#27";
                
                int totalBooks = 0;
                int totalUsers = 0;
                int totalOrders = 0;
                double totalSales = 0.0;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection conn = DriverManager.getConnection(url, user, password);
                         Statement stmt = conn.createStatement()) {

                        // Total Books
                        ResultSet rsBooks = stmt.executeQuery("SELECT COUNT(*) FROM books");
                        if (rsBooks.next()) {
                            totalBooks = rsBooks.getInt(1);
                        }

                        // Total Users
                        ResultSet rsUsers = stmt.executeQuery("SELECT COUNT(*) FROM users");
                        if (rsUsers.next()) {
                            totalUsers = rsUsers.getInt(1);
                        }

                        // Total Orders
                        ResultSet rsOrders = stmt.executeQuery("SELECT COUNT(*) FROM orders");
                        if (rsOrders.next()) {
                            totalOrders = rsOrders.getInt(1);
                        }

                        // Total Sales
                        ResultSet rsSales = stmt.executeQuery("SELECT SUM(totalAmount) FROM orders");
                        if (rsSales.next()) {
                            totalSales = rsSales.getDouble(1);
                        }

                        rsBooks.close();
                        rsUsers.close();
                        rsOrders.close();
                        rsSales.close();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            
            <div class="card">
                <a href="Book_list.jsp">
                    <i class="fas fa-book"></i>
                    <h3>Total Books</h3>
                    <p><%= totalBooks %></p>
                </a>
            </div>
            <div class="card">
                <a href="manageOrders.jsp">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Total Orders</h3>
                    <p><%= totalOrders %></p>
                </a>
            </div>
            <div class="card">
                <a href="manageUsers.jsp">
                    <i class="fas fa-users"></i>
                    <h3>Total Users</h3>
                    <p><%= totalUsers %></p>
                </a>
            </div>
            <div class="card">
                <a href="salesReport.jsp">
                    <i class="fas fa-chart-line"></i>
                    <h3>Sales Report</h3>
                    <p>&#x20B9; <%= String.format("%.2f", totalSales) %></p>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
