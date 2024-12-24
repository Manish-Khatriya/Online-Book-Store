<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Site Settings - Admin Dashboard</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #ecf0f1;
        }

        .settings-container {
            width: 100%;
            max-width: 600px;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .settings-container h3 {
            margin-top: 0;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .settings-container label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .settings-container input[type="text"], 
        .settings-container input[type="email"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            cursor: not-allowed;
        }

        .settings-container textarea {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            cursor: not-allowed;
            resize: vertical;
        }

        .settings-container input[readonly] {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <div class="settings-container">
        <h3>Site Settings</h3>
        <form>
            <div class="form-group">
                <label for="siteURL">Site URL</label>
                <input type="text" id="siteURL" value="http://localhost:8070/online-bookstore/" readonly>
            </div>
            <div class="form-group">
                <label for="siteEmail">Contact Email</label>
                <input type="email" id="siteEmail" value="manishkhatriya5@gmail.com" readonly>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="text" id="phoneNumber" value="+91 9691259048" readonly>
            </div>
            <div class="form-group">
                <label for="siteDescription">Site Description</label>
                <textarea id="siteDescription" rows="4" readonly>
Welcome to Online Bookstore, your one-stop shop for all your reading needs. Browse through our extensive collection of books, enjoy great discounts, and find your next great read.
                </textarea>
            </div>
        </form>
    </div>
</body>
</html>
