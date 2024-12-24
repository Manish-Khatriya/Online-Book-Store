<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <title>Login and Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body, input {
            font-family: "Poppins", sans-serif;
        }
        .container {
            position: relative;
            width: 100%;
            background-color: #fff;
            min-height: 100vh;
            overflow: hidden;
        }
        .forms-container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }
        .signin-signup {
            position: absolute;
            top: 50%;
            transform: translate(-50%, -50%);
            left: 75%;
            width: 50%;
            transition: 1s 0.7s ease-in-out;
            display: grid;
            grid-template-columns: 1fr;
            z-index: 5;
        }
        form {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0rem 5rem;
            transition: all 0.2s 0.7s;
            overflow: hidden;
            grid-column: 1 / 2;
            grid-row: 1 / 2;
        }
        form.sign-up-form {
            opacity: 0;
            z-index: 1;
        }
        form.sign-in-form {
            z-index: 2;
        }
        .title {
            font-size: 2.2rem;
            color: #444;
            margin-bottom: 10px;
        }
        .input-field {
            max-width: 380px;
            width: 100%;
            background-color: #f0f0f0;
            margin: 10px 0;
            height: 55px;
            border-radius: 55px;
            display: grid;
            grid-template-columns: 15% 85%;
            padding: 0 0.4rem;
            position: relative;
        }
        .input-field i {
            text-align: center;
            line-height: 55px;
            color: #acacac;
            transition: 0.2s;
            font-size: 1.1rem;
        }
        .input-field input {
            background: none;
            outline: none;
            border: none;
            line-height: 1;
            font-weight: 600;
            font-size: 1.1rem;
            color: #333;
        }
        .input-field input::placeholder {
            color: #aaa;
            font-weight: 500;
        }
        .social-text {
            padding: 0.7rem 0;
            font-size: 1rem;
        }
        .social-media {
            display: flex;
            justify-content: center;
        }
        .btn {
            width: 150px;
            background-color: #5995fd;
            border: none;
            outline: none;
            height: 49px;
            border-radius: 49px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 600;
            margin: 10px 0;
            cursor: pointer;
            transition: 0.5s;
        }
        .btn:hover {
            background-color: #4d84e2;
        }
        .panels-container {
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
        }
        .container:before {
            content: "";
            position: absolute;
            height: 2000px;
            width: 2000px;
            top: -10%;
            right: 48%;
            transform: translateY(-50%);
            background-image: linear-gradient(-45deg, #4481eb 0%, #04befe 100%);
            transition: 1.8s ease-in-out;
            border-radius: 50%;
            z-index: 6;
        }
        .image {
            width: 100%;
            transition: transform 1.1s ease-in-out;
            transition-delay: 0.4s;
        }
        .panel {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: space-around;
            text-align: center;
            z-index: 6;
        }
        .left-panel {
            pointer-events: all;
            padding: 3rem 17% 2rem 12%;
        }
        .right-panel {
            pointer-events: none;
            padding: 4rem 25% 2rem 12%;
        }
        .panel .content {
            color: #fff;
            transition: transform 0.9s ease-in-out;
            transition-delay: 0.6s;
        }
        .panel h3 {
            font-weight: 600;
            line-height: 1;
            font-size: 1.5rem;
        }
        .panel p {
            font-size: 0.95rem;
            padding: 0.7rem 0;
        }
        .btn.transparent {
            margin: 0;
            background: none;
            border: 2px solid #fff;
            width: 130px;
            height: 41px;
            font-weight: 600;
            font-size: 0.8rem;
        }
        .right-panel .image, .right-panel .content {
            transform: translateX(800px);
        }
        .container.sign-up-mode:before {
            transform: translate(100%, -50%);
            right: 52%;
        }
        .container.sign-up-mode .left-panel .image, .container.sign-up-mode .left-panel .content {
            transform: translateX(-800px);
        }
        .container.sign-up-mode .signin-signup {
            left: 25%;
        }
        .container.sign-up-mode form.sign-up-form {
            opacity: 1;
            z-index: 2;
        }
        .container.sign-up-mode form.sign-in-form {
            opacity: 0;
            z-index: 1;
        }
        .container.sign-up-mode .right-panel .image, .container.sign-up-mode .right-panel .content {
            transform: translateX(0%);
        }
        .container.sign-up-mode .left-panel {
            pointer-events: none;
        }
        .container.sign-up-mode .right-panel {
            pointer-events: all;
        }
        @media (max-width: 870px) {
            .container {
                min-height: 800px;
                height: 100vh;
            }
            .signin-signup {
                width: 100%;
                top: 95%;
                transform: translate(-50%, -100%);
                transition: 1s 0.8s ease-in-out;
            }
            .signin-signup, .container.sign-up-mode .signin-signup {
                left: 50%;
            }
            .container.sign-up-mode .left-panel {
                display: none;
            }
            .container.sign-up-mode .right-panel {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .panel .content {
                transform: translateX(0);
            }
            .container.sign-up-mode:before {
                transform: translateY(-50%);
                right: 50%;
            }
        }
        p.error, p.success {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <!-- Sign In Form -->
                <form action="SingupServlet" method="post" class="sign-in-form">
                    <h2 class="title">Sign In</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <input type="hidden" name="action" value="login">
                    <button type="submit" class="btn">Login</button>
                    <p class="social-text">Or Sign in with social platforms</p>
                    <div class="social-media">
                        <!-- Sign In Button Placeholder -->
                        <div id="gSignInButton1"></div>
                    </div>
                    <p class="error">
                        <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
                    </p>
                    <p class="success">
                        <%= request.getParameter("success") != null ? request.getParameter("success") : "" %>
                    </p>
                </form>
                <!-- Sign Up Form -->
                <form action="SingupServlet" method="post" class="sign-up-form">
                    <h2 class="title">Sign Up</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="username" placeholder="Username" required>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>
                    <input type="hidden" name="action" value="register">
                    <button type="submit" class="btn">Sign Up</button>
                    <p class="social-text">Or Sign up with social platforms</p>
                    <div class="social-media">
                        <!-- Sign Up Button Placeholder -->
                        <div id="gSignInButton2"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New Here?</h3>
                    <p>Sign up and join us for a new experience.</p>
                    <button class="btn transparent" id="sign-up-btn">Sign Up</button>
                </div>
                <img src="./images/image1.png" class="image" alt="log">
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>One of us?</h3>
                    <p>If you already have an account, login to your account here.</p>
                    <button class="btn transparent" id="sign-in-btn">Sign In</button>
                </div>
                <img src="./images/image1.1.png" class="image" alt="register">
            </div>
        </div>
    </div>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script>
        const signInButton = document.getElementById('sign-in-btn');
        const signUpButton = document.getElementById('sign-up-btn');
        const container = document.querySelector('.container');

        signUpButton.addEventListener('click', () => {
            container.classList.add('sign-up-mode');
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove('sign-up-mode');
        });

        function onSignIn(response) {
            const id_token = response.credential;

            // Send the ID token to your server
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '/tokensignin');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onload = function () {
                console.log('Signed in as: ' + xhr.responseText);
            };
            xhr.send(JSON.stringify({ token: id_token }));
        }

        window.onload = function() {
            google.accounts.id.initialize({
                client_id: 'YOUR_CLIENT_ID',
                callback: onSignIn
            });
            google.accounts.id.renderButton(
                document.getElementById('gSignInButton1'),
                { theme: 'outline', size: 'large' }
            );
            google.accounts.id.renderButton(
                document.getElementById('gSignInButton2'),
                { theme: 'outline', size: 'large' }
            );
        }
    </script>
</body>
</html>
