<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @charset "UTF-8";
        body {
            font-family: 'Poppins', sans-serif;
            background-image: url('./images/b21.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
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

        .container {
            width: 100%;
            max-width: 420px;
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

        h2 {
            margin-bottom: 30px;
            color: #fff;
            font-size: 28px;
        }

        .input-group {
            width: 100%;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            position: relative;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            color: #007bff;
            font-size: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 15px 15px 15px 50px;
            border: 2px solid rgba(255, 255, 255, 0.6);
            border-radius: 40px;
            font-size: 18px;
            color: #fff;
            background: transparent;
            transition: border-color 0.3s ease-in-out;
        }

        .input-group input::placeholder {
            color: #ccc;
        }

        .input-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(255, 114, 0, 0.5);
            outline: none;
        }

        button {
            width: 50%;
            padding: 15px;
            background-color: #ffffff;
            border: none;
            border-radius: 40px;
            color: black;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            font-weight: 600;
        }

        button:hover {
            background-color: #007bff;
        }

        p.error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container" id="login-container">
        <form action="LoginServlet" method="post">
            <h2>Admin Login</h2>
            <% if (request.getAttribute("error") != null) { %>
                <p class="error-message"><%= request.getAttribute("error") %></p>
            <% } %>
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
