package book.mgmt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import book.mgmt.dao.Bookdao;
import book.mgmt.dao.BookdaoImpl;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String barcode = request.getParameter("barcode");

        try {
            Bookdao bookdao = new BookdaoImpl();
            int result = bookdao.deleteBookByBarcode(barcode);

            if (result > 0) {
                response.sendRedirect("Book_list.jsp?message=Book Deleted Successfully");
            } else {
                response.sendRedirect("Book_list.jsp?message=Failed to Delete Book");
            }
        } catch (Exception e) {
            response.sendRedirect("Book_list.jsp?message=Error Occurred");
            e.printStackTrace();
        }
    }
}
