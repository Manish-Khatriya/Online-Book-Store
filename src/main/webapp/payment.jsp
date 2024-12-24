<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="book.mgmt.entities.Cart" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        /* General Styles */
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
            transition: box-shadow 0.3s ease;
        }

        .container:hover {
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #444;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .book-details, .payment-details {
            margin-top: 20px;
        }

        .book-details h3, .payment-details h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: none;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
            transition: background-color 0.3s ease;
        }

        th {
            background-color: #fafafa;
            color: #333;
            text-transform: uppercase;
            font-weight: 600;
        }

        td {
            background-color: #fff;
            color: #555;
        }

        tr:hover td {
            background-color: #f7f7f7;
        }

        input[type="number"] {
            width: 70px;
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }

        input[type="number"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.2);
            outline: none;
        }

        .form-group button {
            width: 100%;
            padding: 14px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .form-group button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        .form-group button:active {
            transform: translateY(0);
        }

        .error {
            color: #dc3545;
            background-color: #f8d7da;
            padding: 10px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                width: 100%;
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            .book-details h3, .payment-details h3 {
                font-size: 18px;
            }

            th, td {
                padding: 10px;
            }

            .form-group button {
                padding: 12px;
                font-size: 16px;
            }
        }
    </style>
    <script>
        function updateTotal(bookId, price) {
            const quantityInput = document.getElementById('quantity_' + bookId);
            let quantity = parseInt(quantityInput.value);

            if (quantity < 1) {
                quantity = 1; // Ensure minimum quantity is 1
                quantityInput.value = quantity; // Reset input field to 1
            }

            const total = quantity * price;
            document.getElementById('total_' + bookId).innerText = total.toFixed(2);

            // Update the grand total
            updateGrandTotal();

            // Submit the form to update quantities in the session
            document.getElementById('updateCartForm').submit();
        }

        function updateGrandTotal() {
            let grandTotal = 0;
            const totals = document.getElementsByClassName('book-total');
            for (let i = 0; i < totals.length; i++) {
                grandTotal += parseFloat(totals[i].innerText);
            }
            document.getElementById('grandTotal').innerText = grandTotal.toFixed(2);
            document.getElementById('totalAmount').value = grandTotal.toFixed(2);
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Payment Page</h2>

    <!-- Display error message if present -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <!-- Book Details -->
    <form id="updateCartForm" action="UpdateCartServlet" method="post">
        <div class="book-details">
            <h3>Your Cart</h3>
            <table>
                <tr>
                    <th>Book Name</th>
                    <th>Barcode</th>
                    <th>Quantity</th>
                    <th>Price (₹)</th>
                    <th>Total (₹)</th>
                </tr>
                <%
                    HttpSession session1 = request.getSession();
                    List<Cart> shoppingCart = (List<Cart>) session1.getAttribute("shoppingCart");
                    BigDecimal totalAmount = BigDecimal.ZERO;

                    if (shoppingCart != null) {
                        for (Cart cart : shoppingCart) {
                            int quantity = cart.getQuantity() > 0 ? cart.getQuantity() : 1;
                            BigDecimal bookTotal = BigDecimal.valueOf(cart.getBook().getPrice()).multiply(BigDecimal.valueOf(quantity));
                            totalAmount = totalAmount.add(bookTotal);
                %>
                <tr>
                    <td><%= cart.getBook().getName() %></td>
                    <td><%= cart.getBook().getBarcode() %></td>
                    <td>
                        <input type="number" id="quantity_<%= cart.getBook().getId() %>" name="quantity_<%= cart.getBook().getId() %>" value="<%= quantity %>" min="1" 
                            oninput="updateTotal('<%= cart.getBook().getId() %>', <%= cart.getBook().getPrice() %>)">
                    </td>
                    <td>₹<%= cart.getBook().getPrice() %></td>
                    <td id="total_<%= cart.getBook().getId() %>" class="book-total"><%= bookTotal %></td>
                </tr>
                <%
                        }
                    }
                %>
                <tr>
                    <th colspan="4">Total Amount</th>
                    <th>₹<span id="grandTotal"><%= totalAmount %></span></th>
                </tr>
            </table>
        </div>
    </form>

    <!-- Payment Details Form -->
    <div class="payment-details">
        <h3>Payment Information</h3>
        <form action="PaymentServlet1" method="post">
            <input type="hidden" id="totalAmount" name="totalAmount" value="<%= totalAmount %>">
            <div class="form-group">
                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter your 16-digit card number" required pattern="\d{16}">
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date (MM/YY)</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required 
                    pattern="^(0[1-9]|1[0-2])/\d{2}$" 
                    title="Enter a valid expiry date in MM/YY format">
            </div>
            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="Enter your 3-digit CVV" required pattern="\d{3}">
            </div>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter your address" required>
            </div>
            <div class="form-group">
                <label for="pincode">Pincode</label>
                <input type="text" id="pincode" name="pincode" placeholder="Enter your 6-digit pincode" required pattern="\d{6}">
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Enter your 10-digit phone number" required pattern="\d{10}">
            </div>
            <div class="form-group">
                <button type="submit">Proceed to Payment</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
