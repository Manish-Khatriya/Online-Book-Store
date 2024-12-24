<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.IOException" %>

<html>
<head>
    <title>Sales Report</title>
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
        .total-section {
            margin-top: 20px;
            font-weight: bold;
        }
        .total-section p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>Wallet Transactions Report</h1>
    

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Book Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Order Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                double totalSales = 0.0;
                int totalQuantity = 0;

                try {
                    String url = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
                    String user = "root";
                    String password = "MANISH#27";

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    String sql = "SELECT orderID, bookName, quantity, price, (quantity * price) AS total, orderDate FROM orders";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    SimpleDateFormat sdfOutput = new SimpleDateFormat("MMM dd, yyyy");

                    while (rs.next()) {
                        String orderID = rs.getString("orderID");
                        String bookName = rs.getString("bookName");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        double total = rs.getDouble("total");
                        Date orderDate = rs.getDate("orderDate");

                        totalSales += total;
                        totalQuantity += quantity;

                        String formattedDate = sdfOutput.format(orderDate);
            %>
            <tr>
                <td><%= orderID %></td>
                <td><%= bookName %></td>
                <td><%= quantity %></td>
                <td>&#x20B9; <%= String.format("%.2f", price) %></td>
                <td>&#x20B9; <%= String.format("%.2f", total) %></td>
                <td><%= formattedDate %></td>
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

    <div class="total-section">
        <p>Total Balance: &#x20B9; <%= String.format("%.2f", totalSales) %></p>
        <p>Total Quantity Sold: <%= totalQuantity %></p>
    </div>

</body>
</html>
