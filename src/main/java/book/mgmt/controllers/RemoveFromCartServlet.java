package book.mgmt.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.mgmt.entities.Cart;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the bookId from the request parameter
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        
        // Get the current session
        HttpSession session1 = request.getSession();
        List<Cart> shoppingCart = (List<Cart>) session1.getAttribute("shoppingCart");

        // If shoppingCart is null or empty, simply redirect to the cart page
        if (shoppingCart != null && !shoppingCart.isEmpty()) {
            // Find the item to remove
            Cart itemToRemove = null;
            for (Cart cartItem : shoppingCart) {
                if (cartItem.getBook().getId() == bookId) {
                    itemToRemove = cartItem;
                    break;
                }
            }

            // Remove the item from the shopping cart
            if (itemToRemove != null) {
                shoppingCart.remove(itemToRemove);
            }

            // Update the shopping cart in the session
            session1.setAttribute("shoppingCart", shoppingCart);
        }

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }
}
