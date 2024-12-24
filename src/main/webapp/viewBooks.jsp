<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="book.mgmt.entities.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="book.mgmt.dao.Bookdao" %>
<%@ page import="book.mgmt.dao.BookdaoImpl" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <style>
        /* Add your styles here */
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
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .books-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }
        .book-card {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
        }
        .book-card:hover {
            transform: scale(1.03);
        }
        .book-image-container {
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
        }
        .book-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .book-details {
            padding: 15px;
            text-align: center;
            flex-grow: 1;
        }
        .book-name {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin: 10px 0;
        }
        .book-author, .book-price, .book-quantity {
            font-size: 16px;
            color: #777;
        }
        .book-rating {
            font-size: 16px;
            color: #f4c542;
        }
        .book-barcode-container {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
            font-family: 'Courier New', Courier, monospace;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        .button {
            display: inline-block;
            padding: 10px 15px;
            font-size: 14px;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }
        .button-cart {
            background-color: #28a745;
        }
        .button-cart:hover {
            background-color: #218838;
        }
        .no-books {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">Books Available</div>
    <div class="container">
        <%
            List<Book> booklist = null;
            try {
                Bookdao bookdao = new BookdaoImpl();
                booklist = bookdao.getAllBooks();
            } catch (Exception e) {
                e.printStackTrace();
                booklist = new ArrayList<>(); // Initialize to an empty list if there's an error
            }
        %>
        <div class="books-grid">
            <% if (booklist != null && !booklist.isEmpty()) { %>
                <% for(Book book : booklist) { %>
                <div class="book-card">
                    <div class="book-image-container">
                        <img class="book-image" src="images/logo.png" alt="<%= book.getName() %>">
                    </div>
                    <div class="book-details">
                        <div class="book-name"><%= book.getName() %></div>
                        <div class="book-author">Author: <%= book.getAuthor() %></div>
                        <div class="book-price">Price: &#8377; <%= book.getPrice() %></div>
                        <div class="book-quantity">Only : <%= book.getQuantity() %> items left</div>
                        <div class="book-rating">Rating: <%= String.format("%.1f", Math.random() * 5) %></div>
                        <div class="book-barcode-container">
                            Id: <%= book.getBarcode() %>
                        </div>
                        <a class="button button-cart" href="AddToCartServlet?action=add&bookId=<%= book.getId() %>">Add to Cart</a>
                    </div>
                </div>
                <% } %>
            <% } else { %>
                <div class="no-books">No books available.</div>
            <% } %>
        </div>
        <%@ include file="Message.jsp" %>
    </div>
</body>
</html>
