<%@ page import="java.util.ArrayList"%>
<%@ page import="book.mgmt.entities.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="book.mgmt.dao.Bookdao"%>
<%@ page import="book.mgmt.dao.BookdaoImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book List</title>
<link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
<link href="css/style.css" type="text/css" rel="stylesheet">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}
.container {
    max-width: 1200px;
    margin: 50px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 18px;
    text-align: left;
}
table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
    font-weight: bold;
}
table th, table td {
    padding: 12px 15px;
}
table tbody tr {
    border-bottom: 1px solid #dddddd;
}
table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}
table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
table tbody tr:hover {
    background-color: #f1f1f1;
}
caption {
    margin-bottom: 15px;
    font-size: 24px;
    letter-spacing: 1px;
    color: #333333;
    text-decoration: underline;
    font-weight: bold;
}
.button {
    display: inline-block;
    padding: 10px 20px;
    margin: 5px 0;
    font-size: 16px;
    color: white;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}
.button-update {
    background-color: #007bff;
}
.button-update:hover {
    background-color: #0056b3;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.button-update:active {
    background-color: #004080;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
.button-delete {
    background-color: #ff0000;
}
.button-delete:hover {
    background-color: #cc0000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.button-delete:active {
    background-color: #990000;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}
.no-books {
    text-align: center;
    font-size: 20px;
    color: #666666;
}
</style>
</head>
<body>
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
<table>
    <caption>Book List</caption>
    <thead>
        <tr>
            <th>Id</th>
            <th>Barcode</th>
            <th>Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <% if (booklist != null && !booklist.isEmpty()) { %>
        <% for(Book book : booklist) { %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getBarcode() %></td>
            <td><%= book.getName() %></td>
            <td><%= book.getAuthor() %></td>
            <td>&#x20B9; <%= book.getPrice() %></td>
            <td><%= book.getQuantity() %></td>
            <td>
                <a class="button button-update" href="UpdateBook.jsp?id=<%= book.getId() %>">Update</a>
                <a class="button button-delete" href="DeleteBookServlet?barcode=<%= book.getBarcode() %>">Delete</a>
            </td>
        </tr>
        <% } %>
    <% } else { %>
        <tr>
            <td colspan="7" class="no-books">No books available.</td>
        </tr>
    <% } %>
    </tbody>
</table>
<%@ include file="Message.jsp" %>
</div>
</body>
</html>
