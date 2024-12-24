<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.util.Map, java.util.LinkedHashMap, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders - MK Bookstore</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        /* Your existing CSS styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 32px;
            margin-bottom: 20px;
        }
        .order-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: box-shadow 0.3s, border-color 0.3s;
        }
        .order-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-color: #ff7200;
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-header h2 {
            margin: 0;
            font-size: 24px;
            color: #ff7200;
        }
        .toggle-details {
            font-size: 18px;
            color: #ff7200;
            cursor: pointer;
        }
        .order-details {
            display: none;
            padding: 10px 0;
        }
        .order-details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            font-size: 14px;
        }
        .cancel-button {
    background-color: #ff7200;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    display: inline-block;
    text-align: center;
}

.cancel-button:hover {
    background-color: #e66a00;
    transform: scale(1.05);
}

.cancel-button:active {
    background-color: #d65a00;
    transform: scale(0.98);
}
        
        th {
            background-color: #ff7200;
            color: white;
            border-radius: 8px 8px 0 0;
        }
        tr:nth-child(even) {
            background-color: #f1f1f1;
        }
        .progress-container {
            margin: 15px 0;
            background-color: #ddd;
            border-radius: 6px;
            overflow: hidden;
            height: 10px;
            position: relative;
        }
        .progress-bar {
            height: 100%;
            background-color: #4CAF50;
            width: 0;
            transition: width 0.5s ease;
        }
        .status-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .status-item {
            text-align: center;
            width: 24%;
            position: relative;
        }
        .status-item .icon {
            font-size: 20px;
            margin-bottom: 5px;
        }
        .status-item span {
            display: block;
            font-size: 14px;
            color: #555;
        }
        .status-item.completed .icon {
            color: #4CAF50;
        }
        .status-item.active .icon {
            color: #ff7200;
        }
        .status-item.pending .icon {
            color: #999;
        }
        .status-item::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 4px;
            height: 4px;
            background-color: #333;
            border-radius: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
        }
        .status-container .status-item:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 50%;
            right: -20px;
            width: 20px;
            height: 2px;
            background-color: #ddd;
            transform: translateY(-50%);
            z-index: 0;
        }
        .date {
            font-size: 12px;
            color: #888;
        }
        .back-to-home {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #ff7200;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('.order-card').forEach(function(card) {
                card.addEventListener('click', function() {
                    const details = this.querySelector('.order-details');
                    details.style.display = details.style.display === 'none' || details.style.display === '' ? 'block' : 'none';
                });
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>My Orders</h1>

        <% 
        String dbUrl = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
        String dbUser = "root";
        String dbPassword = "MANISH#27";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Map<String, List<Map<String, Object>>> orders = new LinkedHashMap<>();
        String phoneNumber = "";
        String fullName = "";
        String address = "";
        String pincode = "";

        try {
            phoneNumber = (String) session.getAttribute("phoneNumber");

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            String sql = "SELECT * FROM Orders WHERE phoneNumber = ? ORDER BY orderDate DESC";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phoneNumber);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String orderDate = rs.getString("orderDate");

                if (orders.get(orderDate) == null) {
                    orders.put(orderDate, new ArrayList<>());
                }

                fullName = rs.getString("fullName");
                address = rs.getString("address");
                pincode = rs.getString("pincode");
                phoneNumber = rs.getString("phoneNumber");

                Map<String, Object> orderDetails = new LinkedHashMap<>();
                orderDetails.put("orderID", rs.getString("orderID"));  // Ensure orderID is retrieved
                orderDetails.put("bookName", rs.getString("bookName"));
                orderDetails.put("barcode", rs.getString("barcode"));
                orderDetails.put("quantity", rs.getInt("quantity"));
                orderDetails.put("totalAmount", rs.getDouble("totalAmount")); // Add this line

                orders.get(orderDate).add(orderDetails);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { }
            if (conn != null) try { conn.close(); } catch (Exception e) { }
        }
        %>

        <%
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (Map.Entry<String, List<Map<String, Object>>> entry : orders.entrySet()) {
            String orderDate = entry.getKey();
            Calendar cal = Calendar.getInstance();
            Date date = sdf.parse(orderDate);

            cal.setTime(date);
            cal.add(Calendar.DATE, 1);
            String processingDate = sdf.format(cal.getTime());

            cal.setTime(date);
            cal.add(Calendar.DATE, 2);
            String shippedDate = sdf.format(cal.getTime());

            cal.setTime(date);
            cal.add(Calendar.DATE, 4);
            String deliveredDate = sdf.format(cal.getTime());

            List<Map<String, Object>> books = entry.getValue();

            // Calculate progress percentage
            long totalDuration = sdf.parse(deliveredDate).getTime() - sdf.parse(orderDate).getTime();
            long elapsedDuration = new Date().getTime() - sdf.parse(orderDate).getTime();
            int progressPercentage = 0;
            if (new Date().before(sdf.parse(orderDate))) {
                progressPercentage = 0;
            } else if (new Date().before(sdf.parse(processingDate))) {
                progressPercentage = (int) (elapsedDuration * 0.25 / totalDuration * 100);
            } else if (new Date().before(sdf.parse(shippedDate))) {
                progressPercentage = (int) (elapsedDuration * 0.5 / totalDuration * 100);
            } else if (new Date().before(sdf.parse(deliveredDate))) {
                progressPercentage = (int) (elapsedDuration * 0.75 / totalDuration * 100);
            } else {
                progressPercentage = 100;
            }
        %>

        <div class="order-card">
            <div class="order-header">
                <h2>Order Date: <%= orderDate %></h2>
                <span class="toggle-details">Details</span>
            </div>
            <div class="order-details">
                <div class="order-info">
                    <p><strong>Full Name:</strong> <%= fullName %></p>
                    <p><strong>Address:</strong> <%= address %></p>
                    <p><strong>Pincode:</strong> <%= pincode %></p>
                    <p><strong>Contact:</strong> <%= phoneNumber %></p>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th> <!-- Ensure this column matches the data being retrieved -->
                            <th>Book Name</th>
                            <th>Barcode</th>
                            <th>Quantity</th>
                            <th>totalAmount</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, Object> book : books) { %>
                        <tr>
                            <td><%= book.get("orderID") %></td> <!-- Check if orderID is null -->
                            <td><%= book.get("bookName") %></td>
                            <td><%= book.get("barcode") %></td>
                            <td><%= book.get("quantity") %></td>
                            <td>&#x20B9; <%= book.get("totalAmount") %></td>
                            <td>
                                <form action="CancelOrderServlet" method="post">
                                    <input type="hidden" name="orderID" value="<%= book.get("orderID") %>">
                                    <button type="submit" class="cancel-button">Cancel Order</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <div class="progress-container">
                    <div class="progress-bar" style="width: <%= progressPercentage %>%"></div>
                </div>

                <div class="status-container">
                    <div class="status-item <% if (new Date().after(sdf.parse(processingDate))) { %> completed <% } else { %> pending <% } %>">
                        <div class="icon">📦</div>
                        <span>Processing</span>
                        <div class="date"><%= processingDate %></div>
                    </div>
                    <div class="status-item <% if (new Date().after(sdf.parse(shippedDate))) { %> completed <% } else { %> pending <% } %>">
                        <div class="icon">🚚</div>
                        <span>Shipped</span>
                        <div class="date"><%= shippedDate %></div>
                    </div>
                    <div class="status-item <% if (new Date().after(sdf.parse(deliveredDate))) { %> completed <% } else { %> pending <% } %>">
                        <div class="icon">🏠</div>
                        <span>Delivered</span>
                        <div class="date"><%= deliveredDate %></div>
                    </div>
                    <% if (new Date().after(sdf.parse(deliveredDate))) { %>
                    <div class="status-item completed">
                        <div class="icon">✅</div>
                        <span>Successfully Delivered</span>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <% } %>

        <a href="Customerhome.jsp" class="back-to-home">Back to Home</a>
    </div>
</body>
</html>
