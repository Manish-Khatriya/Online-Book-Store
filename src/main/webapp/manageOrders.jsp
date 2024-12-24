<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>

<html>
<head>
    <title>Manage Orders</title>
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
    </style>
</head>
<body>
    <h1>Manage Orders</h1>

    <!-- Search and Filter -->
    <div class="search-container">
        <form action="manageOrders.jsp" method="get">
            <input type="text" name="search" class="search-input" placeholder="Search by Order ID, Book Name, etc.">
            <input type="submit" value="Search" class="search-button">
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Barcode</th>
                <th>Book Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>TotalAmount</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Pincode</th>
                <th>Phone Number</th>
                <th>Card Number</th>
                <th>CVV</th>
                <th>Expire Date</th>
                <th>Status</th>
                <th>Order Date</th>
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
                    String sql = "SELECT orderID, fullName, address, pincode, phoneNumber, barcode, bookName, quantity, price, status, cardNumber, cvv, expiryDate, orderDate, totalAmount FROM orders";
                    if (search != null && !search.trim().isEmpty()) {
                        sql += " WHERE orderID LIKE ? OR bookName LIKE ?";
                    }
                    stmt = conn.prepareStatement(sql);
                    if (search != null && !search.trim().isEmpty()) {
                        stmt.setString(1, "%" + search + "%");
                        stmt.setString(2, "%" + search + "%");
                    }
                    rs = stmt.executeQuery();

                    // Define date formats
                    SimpleDateFormat sdfExpiry = new SimpleDateFormat("MM/yy"); // Expiry date format
                    SimpleDateFormat sdfOrder = new SimpleDateFormat("yyyy-MM-dd"); // Order date format
                    SimpleDateFormat sdfOutput = new SimpleDateFormat("MM/yy"); // Output format for expiry date
                    SimpleDateFormat sdfOrderOutput = new SimpleDateFormat("MMM dd, yyyy"); // Output format for order date

                    while (rs.next()) {
                        String orderID = rs.getString("orderID");
                        String barcode = rs.getString("barcode");
                        String bookName = rs.getString("bookName");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        double totalAmount=rs.getDouble("totalAmount");
                        String fullName = rs.getString("fullName");
                        String address = rs.getString("address");
                        String pincode = rs.getString("pincode");
                        String phoneNumber = rs.getString("phoneNumber");
                        String cardNumber = rs.getString("cardNumber");
                        String cvv = rs.getString("cvv");
                        String expiryDateStr = rs.getString("expiryDate");
                        String status = rs.getString("status");
                        String orderDateStr = rs.getString("orderDate");

                        // Parse and format dates
                        String formattedExpiryDate = parseDateSafely(expiryDateStr, sdfExpiry, sdfOutput);
                        String formattedOrderDate = parseDateSafely(orderDateStr, sdfOrder, sdfOrderOutput);

            %>
            <tr>
                <td><%= orderID %></td>
                <td><%= barcode %></td>
                <td><%= bookName %></td>
                <td><%= quantity %></td>
                <td>&#x20B9; <%= price %></td>
                <td>&#x20B9; <%= totalAmount %></td>
                <td><%= fullName %></td>
                <td><%= address %></td>
                <td><%= pincode %></td>
                <td><%= phoneNumber %></td>
                <td><%= cardNumber %></td>
                <td><%= cvv %></td>
                <td><%= formattedExpiryDate %></td>
                <td><%= status %></td>
                <td><%= formattedOrderDate %></td>
                <td>
                    <!-- Update and Delete Buttons -->
                    <a href="DeleteOrderServlet?orderID=<%= orderID %>" onclick="return confirm('Are you sure you want to delete this order?');">Delete</a>
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

    <%! 
        // Method to safely parse and format a date string
        public String parseDateSafely(String dateStr, SimpleDateFormat inputFormat, SimpleDateFormat outputFormat) {
            try {
                if (dateStr != null && !dateStr.trim().isEmpty()) {
                    return outputFormat.format(inputFormat.parse(dateStr));
                }
                return "N/A";
            } catch (ParseException e) {
                System.err.println("Error parsing date: " + dateStr);
                return "Invalid Date";
            }
        }
    %>
</body>
</html>
