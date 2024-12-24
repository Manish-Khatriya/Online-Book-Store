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

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String barcode = request.getParameter("barcode");
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");

        double pri = Double.parseDouble(price);
        int quan = Integer.parseInt(quantity);

        Book book = new Book(id, barcode, name, author, pri, quan);

        try {
            Bookdao bookdao = new BookdaoImpl();
            int result = bookdao.updateBook(book);

            if (result > 0) {
                response.sendRedirect("Book_list.jsp?message=Book Updated Successfully");
            } else {
                response.sendRedirect("UpdateBook.jsp?id=" + id + "&message=Failed to Update Book");
            }
        } catch (Exception e) {
            response.sendRedirect("UpdateBook.jsp?id=" + id + "&message=Error Occurred");
            e.printStackTrace();
        }
    }
}
