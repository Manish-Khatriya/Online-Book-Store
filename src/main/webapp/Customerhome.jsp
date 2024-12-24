<%@page import="book.mgmt.entities.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer MK Bookstore</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e0e0e0; /* Light Gray */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #ffffff; /* White */
        }

        header h1 {
            margin: 0;
            font-size: 2rem;
            color: #004d40; /* Deep Teal */
        }

        header .nav-links a {
            color: #004d40; /* Deep Teal */
            text-decoration: none;
            margin-left: 1.5rem;
            font-size: 1.1rem;
            transition: color 0.3s;
        }

        header .nav-links a:hover {
            color: #ff6f61; /* Coral */
        }

        .hero-section {
            text-align: center;
            padding: 6rem 2rem;
            background: url("./images/L3.png") no-repeat center center;
            background-size: cover;
            color: #ffffff;
            border-bottom: 2px solid #ff6f61; /* Coral */
        }

        .hero-section h2 {
            font-size: 3rem;
            margin: 0 0 1rem;
        }

        .hero-section p {
            font-size: 1.2rem;
            margin: 0 0 2rem;
        }

        .btn-view-books {
            display: inline-block;
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
            color: #ffffff; /* White */
            background-color: #ff6f61; /* Coral */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-view-books:hover {
            background-color: #e65c50; /* Darker Coral */
            transform: translateY(-3px);
        }

        .content {
            flex: 1;
            padding: 2rem;
            background-color: #ffffff; /* White */
            border-radius: 10px;
            margin: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .section {
            background-color: #f9f5f2; /* Light Beige */
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .section h3 {
            font-size: 1.8rem;
            color: #333333; /* Charcoal */
            margin-bottom: 1rem;
            text-align: center;
            border-bottom: 2px solid #ff6f61; /* Coral */
            padding-bottom: 0.5rem;
        }

        .section .item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .section img {
            max-width: 120px;
            border-radius: 10px;
            margin-right: 1rem;
        }

        .section p {
            font-size: 1.1rem;
            color: #333333;
            margin: 0;
        }

        .testimonial-carousel {
            margin-top: 2rem;
        }

        .carousel {
            display: flex;
            flex-direction: column;
        }

        .carousel-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .carousel-item img {
            border-radius: 50%;
            margin-right: 1rem;
            max-width: 50px; /* Adjust size as needed */
            max-height: 50px; /* Adjust size as needed */
        }

        .carousel-item p {
            font-size: 1rem; /* Adjust font size as needed */
            margin: 0;
        }
 
        .footer {
            background-color: #333333; /* Dark Charcoal */
            color: #ffffff;
            text-align: center;
            padding: 1rem;
            position: relative;
            bottom: 0;
            border-top: 2px solid #e0e0e0; /* Light Gray */
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <header>
        <h1>MK Bookstore</h1>
        <div class="nav-links">
            <a href="Customerhome.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="viewBooks.jsp"><i class="fas fa-book"></i> Available Books</a>
            <a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
            <a href="loginorder.jsp"><i class="fas fa-book"></i> My Orders</a>
            <a href="adminabout.jsp"><i class="fas fa-info-circle"></i> About Us</a>
            <a href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </header>
    <% 
    String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "Guest";  // Fallback if username is not in session
    }
    %>
    <div class="hero-section">
        <h2>Welcome <%= username %> to MK Bookstore Dashboard!</h2>
        <p>Explore our latest collections, track your orders, and enjoy our services.</p>
        <a href="viewBooks.jsp" class="btn-view-books">View Available Books ></a>
    </div>

    <div class="content">
        <div class="section featured-promotions">
            <h3>Featured Promotions</h3>
            <div class="item">
                <img src="images/logo.png" alt="Promotion 1">
                <p>Get 20% off on Effective Java books! Limited time offer.</p>
            </div>
            <div class="item">
                <img src="images/logo.png" alt="Promotion 2">
                <p>Buy 2, Get 1 Free on C++ Primer books. Shop now!</p>
            </div>
        </div>

        <div class="section new-arrivals">
            <h3>New Arrivals</h3>
            <div class="item">
                <img src="images/logo.png" alt="New Arrival 1">
                <p>Check out the latest addition to our collection.</p>
            </div>
            <div class="item">
                <img src="images/logo.png" alt="New Arrival 2">
                <p>Explore the newest books available in our store.</p>
            </div>
        </div>

        <div class="section testimonial-carousel">
            <h3>What Our Customers Say</h3>
            <div class="carousel">
                <div class="carousel-item">
                    <img src="images/CC1.jpg" alt="Customer 1">
                    <p>"This bookstore is amazing! I found all the books I was looking for and more."</p>
                </div>
                <div class="carousel-item">
                    <img src="images/CC3.jpg" alt="Customer 2">
                    <p>"Fantastic selection and great prices. I'll definitely be back!"</p>
                </div>
                <div class="carousel-item">
                    <img src="images/CC4.jpg" alt="Customer 3">
                    <p>"The customer service here is top-notch. Highly recommended!"</p>
                </div>
                <div class="carousel-item">
                    <img src="images/CC5.jpg" alt="Customer 4">
                    <p>"I love the user-friendly design of this website. Makes shopping a breeze!"</p>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2024 MK Bookstore. All rights reserved.</p>
    </footer>
</body>
</html>
