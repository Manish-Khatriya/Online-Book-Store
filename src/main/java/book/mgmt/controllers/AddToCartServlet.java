package book.mgmt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.mgmt.dao.Bookdao;
import book.mgmt.dao.BookdaoImpl;
import book.mgmt.entities.Book;
import book.mgmt.entities.Cart;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Dependency Injection - DAO instance
    private Bookdao bookDao;

    public AddToCartServlet() {
        this.bookDao = new BookdaoImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get bookId from request
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        
        // Fetch book details using the bookId
        Book book = null;
        try {
            book = bookDao.getBookById(bookId);
        } catch (Exception e) {
            e.printStackTrace();
            // You may want to add error handling here, like redirecting to an error page
        }

        // If book is not found, handle appropriately
        if (book == null) {
            response.sendRedirect("error.jsp"); // Redirect to an error page if book not found
            return;
        }

        // Create a Cart object for the selected book
        Cart cart = new Cart(book);

        // Get the session and retrieve the shopping cart
        HttpSession session1 = request.getSession();
        List<Cart> shoppingCart = (List<Cart>) session1.getAttribute("shoppingCart");

        // If shoppingCart is null, create a new one
        if (shoppingCart == null) {
            shoppingCart = new ArrayList<>();
        }

        // Add the cart item to the shopping cart
        shoppingCart.add(cart);

        // Set the updated shopping cart back to the session
        session1.setAttribute("shoppingCart", shoppingCart);

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }

    // You can implement the doPost method similarly if needed.
}
