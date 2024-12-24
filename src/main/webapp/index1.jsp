<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 2rem;
        }
        .hidden {
            display: none;
        }
        .btn {
            display: inline-block;
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
            color: #fff;
            background-color: #ff6f61;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn:hover {
            background-color: #e65c50;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div id="loginSection">
        <h2>Login</h2>
        <a href="#" id="loginButton" class="btn">Login</a>
    </div>
    
    <div id="protectedSection" class="hidden">
        <h2>Protected Content</h2>
        <p>Welcome to the protected area!</p>
        <a href="logout.jsp" class="btn">Logout</a>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            if (sessionStorage.getItem('loggedIn') === 'true') {
                document.getElementById('loginSection').classList.add('hidden');
                document.getElementById('protectedSection').classList.remove('hidden');
            } else {
                document.getElementById('loginSection').classList.remove('hidden');
                document.getElementById('protectedSection').classList.add('hidden');
            }
            
            document.getElementById('loginButton').addEventListener('click', function() {
                sessionStorage.setItem('loggedIn', 'true');
                location.reload();
            });
        });
    </script>
</body>
</html>
