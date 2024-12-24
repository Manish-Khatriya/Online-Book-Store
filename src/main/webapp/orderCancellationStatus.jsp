<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Cancellation Status</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            max-width: 600px;
            width: 100%;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #ff7200;
            margin-bottom: 20px;
        }
        .message {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 30px;
        }
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            font-size: 16px;
            resize: vertical;
        }
        button {
            background-color: #ff7200;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #e65c00;
        }
        a {
            display: inline-block;
            background-color: #e0e0e0;
            color: #333;
            text-decoration: none;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 10px;
        }
        a:hover {
            background-color: #cccccc;
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 24px;
            }
            .message {
                font-size: 16px;
            }
            textarea, button, a {
                font-size: 14px;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order Cancellation</h1>
        
        <!-- Ask user for cancellation reason -->
        <p class="message">Please let us know why you are canceling your order. Your feedback is important to us.</p>
        <form id="cancellationForm">
            <textarea id="cancellationReason" name="cancellationReason" placeholder="Enter your reason here..."></textarea>
            <button type="button" onclick="handleSubmit()">Submit Reason</button>
        </form>
        
        <!-- Display success message -->
        <p class="message" id="responseMessage" style="display: none;">Thank you for your feedback. Your order has been canceled successfully.</p>

        <div class="btn-container">
            <a href="myorderdetails.jsp">Back to My Orders</a>
        </div>
    </div>
    
    <script>
        function handleSubmit() {
            var reason = document.getElementById('cancellationReason').value.trim();
            
            if (reason === "") {
                alert("Please provide a reason for canceling your order.");
                return; // Do not proceed further
            }
            
            // Display the success message and redirect after 20 seconds
            document.getElementById('responseMessage').style.display = 'block';
            setTimeout(function() {
                window.location.href = "myorderdetails.jsp";
            }, 20000); // Redirect after 20 seconds
        }
    </script>
</body>
</html>
