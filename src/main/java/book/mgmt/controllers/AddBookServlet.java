package book.mgmt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import book.mgmt.dao.Bookdao;
import book.mgmt.dao.BookdaoImpl;
import book.mgmt.entities.Book;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String barcode = request.getParameter("barcode");
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Book book = new Book(0, barcode, name, author, price, quantity);
            Bookdao bookdao = new BookdaoImpl();
            int result = bookdao.addBook(book);

            if (result > 0) {
                response.sendRedirect("Book_list.jsp?message=Book Added Successfully");
            } else {
                response.sendRedirect("AddBook.jsp?message=Failed to Add Book");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("AddBook.jsp?message=Invalid Number Format");
            e.printStackTrace();
        } catch (Exception e) {
            response.sendRedirect("AddBook.jsp?message=Error Occurred");
            e.printStackTrace();
        }
    }
}
