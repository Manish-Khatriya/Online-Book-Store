package book.mgmt.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import book.mgmt.dao.Bookdao;
import book.mgmt.dao.BookdaoImpl;
import book.mgmt.entities.Book;

@WebServlet("/ListBooksServlet")
public class ListBooksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Bookdao bookdao = new BookdaoImpl();
            List<Book> books = bookdao.getAllBooks();
            request.setAttribute("books", books);
            request.getRequestDispatcher("Book_list.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("Book_list.jsp?message=Error Occurred");
            e.printStackTrace();
        }
    }
}
