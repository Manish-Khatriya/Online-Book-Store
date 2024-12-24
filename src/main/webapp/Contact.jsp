<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - MKBooks</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
/* Reset some default styles */
body, h1, h2, p, a, input, textarea, button {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body setup */
body {
    font-family: 'Poppins', sans-serif;
    background-image: url('./images/2.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    color: #fff;
    position: relative;
    overflow: hidden;
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1;
}

.contact-container {
    width: 100%;
    max-width: 700px;
    padding: 30px;
    background: rgba(255, 255, 255, 0.1);
    border: 2px solid rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
    border-radius: 12px;
    z-index: 2;
    position: relative;
    text-align: center;
    margin: 20px;
}

.contact-header h1 {
    font-size: 32px;
    margin-bottom: 10px;
    color: #fff;
}

.contact-details {
    font-size: 18px;
    line-height: 1.6;
    color: #fff;
    margin-bottom: 20px;
}

.contact-details a {
    color: #ff7200;
    text-decoration: none;
}

.contact-details a:hover {
    text-decoration: underline;
}

/* Contact form styling */
.contact-form {
    text-align: left;
}

.contact-form label {
    font-size: 16px;
    color: #fff;
    display: block;
    margin-bottom: 5px;
}

.contact-form input,
.contact-form textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 2px solid rgba(255, 255, 255, 0.6);
    border-radius: 5px;
    background: transparent;
    color: #fff;
}

.contact-form input::placeholder,
.contact-form textarea::placeholder {
    color: #ccc;
}

.contact-form input:focus,
.contact-form textarea:focus {
    border-color: #ff7200;
    box-shadow: 0 0 10px rgba(255, 114, 0, 0.5);
    outline: none;
}

.contact-form button {
    background-color: #ff7200;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease-in-out;
}

.contact-form button:hover {
    background-color: #e06600;
}

/* Confirmation message */
.confirmation-message {
    margin-top: 20px;
    font-size: 18px;
    color: #fff; /* Green color for success */
}

/* Social media icons */
.social-media-icons {
    margin-top: 10px;
}

.social-media-icons a {
    margin: 0 10px;
    color: #ff7200;
    font-size: 24px;
    text-decoration: underline;
}

.social-media-icons a:hover {
    color: #fff;
}

/* Media Queries for Responsiveness */
@media (max-width: 768px) {
    .contact-container {
        padding: 20px;
    }
    .contact-header h1 {
        font-size: 28px;
    }
    .contact-form button {
        width: 100%;
    }
}

    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="contact-container">
        <div class="contact-header">
            <h1>Contact Us</h1>
        </div>
        <div class="contact-details">
            <p><strong>Phone Number:</strong> +91 9691259048</p>
            <p><strong>Email Address:</strong> <a href="mailto:contact@gmghotel.com">MkBooks@gmail.com</a></p>
            <p><strong>Stay connected with us on social media:</strong></p>
            <div class="social-media-icons">
                <a href="https://www.linkedin.com/in/manish-khatriya-ab8763249/" target="_blank">LinkedIn</a>
                <a href="https://www.instagram.com/gurjar__manish27__/" target="_blank">Instagram</a>
            </div>
        </div>

        <div class="contact-form">
            <h2>Send Us a Message</h2>
            <form id="contactForm" action="contact.jsp" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Your Name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Your Email" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4" placeholder="Your Message" required></textarea>

                <button type="submit">Send Message</button>
            </form>
            <!-- Display confirmation message -->
            <%
                if ("true".equals(request.getParameter("submitted"))) {
            %>
            <div class="confirmation-message">
                Thank you for your message! We will get back to you soon.
            </div>
            <%
                }
            %>
        </div>
    </div>
    <script>
        document.getElementById('contactForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const url = new URL(window.location.href);
            url.searchParams.set('submitted', 'true');
            window.location.href = url.href;
        });
    </script>
</body>
</html>
