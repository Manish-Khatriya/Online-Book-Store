package book.mgmt.controllers;

import book.mgmt.entities.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PaymentServlet1")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/OnlineBookStoreMain";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "MANISH#27";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cart> shoppingCart = (List<Cart>) session.getAttribute("shoppingCart");

        // Retrieve payment details from the form
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String phoneNumber = request.getParameter("phoneNumber");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        // Validate inputs
        if (fullName == null || fullName.isEmpty() ||
            address == null || address.isEmpty() ||
            pincode == null || pincode.isEmpty() ||
            phoneNumber == null || phoneNumber.isEmpty() ||
            cardNumber == null || cardNumber.isEmpty() ||
            expiryDate == null || expiryDate.isEmpty() ||
            cvv == null || cvv.isEmpty()) {
            
            request.setAttribute("errorMessage", "All payment details must be provided.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        if (shoppingCart == null || shoppingCart.isEmpty()) {
            request.setAttribute("errorMessage", "Your cart is empty. Please add items to your cart before proceeding.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        BigDecimal totalAmount = BigDecimal.ZERO;
        List<String> bookNames = new ArrayList<>();
        List<String> barcodes = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Orders (fullName, address, pincode, phoneNumber, cardNumber, expiryDate, cvv, barcode, bookName, quantity, price, status, orderDate, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    for (Cart cart : shoppingCart) {
                        int quantity = cart.getQuantity(); // Retrieve the quantity

                        // If quantity is not set or is zero, default to 1
                        if (quantity <= 0) {
                            quantity = 1;
                        }

                        BigDecimal itemTotal = BigDecimal.valueOf(cart.getBook().getPrice()).multiply(BigDecimal.valueOf(quantity));
                        totalAmount = totalAmount.add(itemTotal);

                        pstmt.setString(1, fullName);
                        pstmt.setString(2, address);
                        pstmt.setString(3, pincode);
                        pstmt.setString(4, phoneNumber);
                        pstmt.setString(5, cardNumber);
                        pstmt.setString(6, expiryDate);
                        pstmt.setString(7, cvv);
                        pstmt.setString(8, cart.getBook().getBarcode());
                        pstmt.setString(9, cart.getBook().getName());
                        pstmt.setInt(10, quantity); // Save the validated quantity
                        pstmt.setBigDecimal(11, BigDecimal.valueOf(cart.getBook().getPrice()));
                        pstmt.setString(12, "Success");
                        pstmt.setDate(13, new java.sql.Date(System.currentTimeMillis()));
                        pstmt.setBigDecimal(14, itemTotal);

                        pstmt.addBatch();
                        bookNames.add(cart.getBook().getName());
                        barcodes.add(cart.getBook().getBarcode());
                        quantities.add(quantity);
                    }
                    pstmt.executeBatch();
                }

                session.removeAttribute("shoppingCart");
                request.setAttribute("fullName", fullName);
                request.setAttribute("address", address);
                request.setAttribute("pincode", pincode);
                request.setAttribute("phoneNumber", phoneNumber);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("bookNames", bookNames);
                request.setAttribute("barcodes", barcodes);
                request.setAttribute("quantities", quantities);

                request.getRequestDispatcher("Success.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while processing your order. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database driver not found.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
