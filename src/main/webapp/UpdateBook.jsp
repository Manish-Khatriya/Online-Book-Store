<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="book.mgmt.dao.Bookdao" %>
<%@ page import="book.mgmt.dao.BookdaoImpl" %>
<%@ page import="book.mgmt.entities.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Book</title>
<link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
<link href="css/style.css" type="text/css" rel="stylesheet">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f9fa;
        color: #495057;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 500px;
        margin: 50px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h1 {
        color: #343a40;
        margin-bottom: 20px;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    input[type="text"],
    input[type="number"] {
        width: 90%;
        max-width: 400px;
        padding: 12px;
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 16px;
    }
    .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    input[type="submit"],
    input[type="reset"] {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }
    input[type="submit"] {
        background-color: #28a745;
    }
    input[type="submit"]:hover {
        background-color: #218838;
    }
    input[type="reset"] {
        background-color: #dc3545;
    }
    input[type="reset"]:hover {
        background-color: #c82333;
    }
    .message {
        margin-top: 20px;
        padding: 15px;
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
        border-radius: 5px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Update Book</h1>
        <%
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Bookdao bookdao = new BookdaoImpl();
                Book book = bookdao.getBookById(id); // Ensure this method exists in your BookdaoImpl

                if (book != null) {
        %>
        <form action="UpdateBookServlet" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>" />
            <input type="text" name="barcode" value="<%= book.getBarcode() %>" required />
            <input type="text" name="name" value="<%= book.getName() %>" required />
            <input type="text" name="author" value="<%= book.getAuthor() %>" required />
            <input type="number" step="0.01" name="price" value="<%= book.getPrice() %>" required />
            <input type="number" name="quantity" value="<%= book.getQuantity() %>" required />
            <div class="button-group">
                <input type="submit" value="Update" />
                <input type="reset" value="Reset" />
            </div>
        </form>
        <%
                } else {
        %>
        <p>Book not found!</p>
        <%
                }
            } else {
        %>
        <p>Invalid ID!</p>
        <%
            }
        %>

        <%@ include file="Message.jsp" %>
    </div>
</body>
</html>
