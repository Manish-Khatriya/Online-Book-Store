<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="book.mgmt.entities.Book"%>
<%@page import="book.mgmt.entities.Cart"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #ff7200;
            color: #ffffff;
            padding: 15px;
            text-align: center;
            font-size: 35px;
            font-weight: bold;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .header .button-home {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            background-color: #28a745;
            color: #ffffff;
            padding: 10px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }
        .header .button-home:hover {
            background-color: #218838;
        }
        .container {
            max-width: 1400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #ff7200;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }
        td {
            font-size: 16px;
        }
        .button {
            display: inline-block;
            padding: 10px 15px;
            font-size: 17px;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .button-checkout {
            background-color: #007bff;
            margin-top: 10px;
            display: block;
            width: 180px;
            padding: 10px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }
        .button-checkout:hover {
            background-color: #0056b3;
        }
        .button-remove {
            background-color: #dc3545;
            text-decoration: none;
            color: #ffffff;
            padding: 5px 10px;
            border-radius: 4px;
        }
        .button-remove:hover {
            background-color: #c82333;
        }
        .empty-cart {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
        .total-price {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            text-align: left;
        }
        .button-update-container {
            display: flex;
            align-items: center;
            justify-content: center; /* Center the content horizontally */
            gap: 10px; /* Adjust the gap between the buttons and the input */
        }
        .button-update {
            background-color: #007bff;
            color: #ffffff;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-update:hover {
            background-color: #0056b3;
        }
        .quantity-input {
            width: 40px; /* Adjust width as needed */
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="header">
        Your Shopping Cart
        <a href="Customerhome.jsp" class="button-home"> < Back to Home</a>
    </div>
    <div class="container">
        <%
            HttpSession session1 = request.getSession();
            List<Cart> shoppingCart = (List<Cart>) session1.getAttribute("shoppingCart");
            double totalPrice = 0.0;

            if (shoppingCart == null) {
                shoppingCart = new ArrayList<>();
            } else {
                for (Cart cart : shoppingCart) {
                    Book book = cart.getBook();
                    totalPrice += book.getPrice();
                }
            }
        %>
        <% if (shoppingCart != null && !shoppingCart.isEmpty()) { %>
        <form id="cart-form">
            <table>
                <thead>
                    <tr>
                        <th>Barcode</th>
                        <th>Name</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Rating</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Cart cart : shoppingCart) { 
                        Book book = cart.getBook();
                        double bookPrice = book.getPrice();
                        String bookId = String.valueOf(book.getId());
                    %>
                    <tr>
                        <td><%= book.getBarcode() %></td>
                        <td><%= book.getName() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td>&#8377; <span class="price" id="price_<%= bookId %>"><%= bookPrice %></span></td>
                        <td>
                            <button type="button" class="button-update" onclick="updatePrice('<%= bookId %>', 'minus')">-</button>
                            <input type="text" class="quantity-input"id="quantity_<%= bookId %>" value="1" size="2" readonly>
                            <button type="button" class="button-update" onclick="updatePrice('<%= bookId %>', 'plus')">+</button>
                        </td>
                        <td><%= String.format("%.1f", Math.random() * 5) %></td>
                        <td><a href="RemoveFromCartServlet?bookId=<%= book.getId() %>" class="button button-remove">Remove</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="total-price">Total Price: &#8377; <span id="total-price"><%= totalPrice %></span></div>
            <a class="button button-checkout" href="payment.jsp">Proceed to Pay ></a>
        </form>
        <% } else { %>
            <div class="empty-cart">Your cart is empty.</div>
        <% } %>
    </div>

    <script>
        function updatePrice(bookId, action) {
            var quantityInput = document.getElementById('quantity_' + bookId);
            var priceElement = document.getElementById('price_' + bookId);
            var totalPriceElement = document.getElementById('total-price');
            
            var currentQuantity = parseInt(quantityInput.value);
            var bookPrice = parseFloat(priceElement.textContent.replace('₹', ''));
            var currentTotalPrice = parseFloat(totalPriceElement.textContent.replace('₹', ''));

            if (action === 'plus') {
                quantityInput.value = currentQuantity + 1;
                currentTotalPrice += bookPrice;
            } else if (action === 'minus' && currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
                currentTotalPrice -= bookPrice;
            }

            totalPriceElement.textContent =  currentTotalPrice.toFixed(2);
        }
    </script>
</body>
</html>
