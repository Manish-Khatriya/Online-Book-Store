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

@WebServlet("/UpdateCartServlet")
public class UpdateQuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cart> shoppingCart = (List<Cart>) session.getAttribute("shoppingCart");

        if (shoppingCart != null) {
            for (Cart cart : shoppingCart) {
                String quantityParam = request.getParameter("quantity_" + cart.getBook().getId());
                if (quantityParam != null) {
                    try {
                        int quantity = Integer.parseInt(quantityParam);
                        if (quantity < 1) {
                            quantity = 1; // Ensure minimum quantity is 1
                        }
                        cart.setQuantity(quantity);
                    } catch (NumberFormatException e) {
                        // Handle invalid number format
                        e.printStackTrace();
                    }
                }
            }

            // Optionally, update the database with the new quantities
            // CartDAO cartDAO = new CartDAO();
            // for (Cart cart : shoppingCart) {
            //     cartDAO.updateQuantity(cart.getBook().getId(), cart.getQuantity());
            // }

            // Redirect to payment page or any other page
            response.sendRedirect("payment.jsp");
        } else {
            response.sendRedirect("index.jsp"); // Redirect to home or error page if shoppingCart is null
        }
    }
}
