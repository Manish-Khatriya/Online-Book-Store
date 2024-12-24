<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.math.BigDecimal, java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Successful - MK Bookstore</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        .success-container h1 {
            color: #28a745;
            font-size: 2em;
            margin-bottom: 10px;
        }
        .success-container p {
            font-size: 1.1em;
            color: #333;
            margin-bottom: 20px;
        }
        .order-details {
            margin-top: 20px;
            text-align: left;
        }
        .order-details h2 {
            color: #333;
            margin-bottom: 15px;
        }
        .order-details ul {
            list-style: none;
            padding: 0;
        }
        .order-details ul li {
            margin-bottom: 8px;
            font-size: 1em;
        }
        .order-details ul li span {
            font-weight: bold;
        }
        .back-to-home {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff7200;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .back-to-home:hover {
            background-color: #e66a00;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h1>Order Placed Successfully!</h1>
        <p>Thank you, <strong><%= request.getAttribute("fullName") %></strong>! Your order has been successfully placed.</p>
        
        <%
            try {
                // Retrieve totalAmount attribute
                BigDecimal totalAmount = (BigDecimal) request.getAttribute("totalAmount");
                
                if (totalAmount != null) {
                    DecimalFormat df = new DecimalFormat("#,###.00");
                    String formattedTotalAmount = df.format(totalAmount);
        %>
            <p><strong>Total Amount Paid:</strong> &#8377; <%= formattedTotalAmount %></p>
        <%
                } else {
                    out.println("<p>Error: Total amount is not provided or is invalid.</p>");
                }
            } catch (Exception e) {
                // Handle any potential errors
                out.println("<p>Error formatting total amount: " + e.getMessage() + "</p>");
            }
        %>

        <div class="order-details">
            <h2>Order Details</h2>
            <ul>
                <li><span>Order Date:</span> <%= new java.sql.Timestamp(System.currentTimeMillis()) %></li>
                <li><span>Delivery Address:</span> <%= request.getAttribute("address") %>, <%= request.getAttribute("pincode") %></li>
                <li><span>Contact Number:</span> <%= request.getAttribute("phoneNumber") %></li>
                <%
                  List<String> bookNames = (List<String>) request.getAttribute("bookNames");
                  List<String> barcodes = (List<String>) request.getAttribute("barcodes");
                  List<Integer> quantities = (List<Integer>) request.getAttribute("quantities");
    
                    if (bookNames != null && barcodes != null && quantities != null) {
               %>
              <ul>
               <% for (int i = 0; i < bookNames.size(); i++) { %>
                <li>
                    <span>Book Name:</span> <%= bookNames.get(i) %>,
                    <span>Quantity:</span> <%= quantities.get(i) %>,<br>
                    <span>Barcode:</span> <%= barcodes.get(i) %>
                </li>
            <% } %>
             </ul>
         <%
    }           else {
          %>
                   <p>No order details available.</p>
           <%
    }
           %>
            </ul>
        </div>

        <a href="Customerhome.jsp" class="back-to-home">Continue Shopping</a>
    </div>
</body>
</html>
