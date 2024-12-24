<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Store</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;400;600;900&display=swap">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            scroll-behavior: smooth;
        }
        body {
            line-height: 1.6;
            background-color: #f4f4f9;
        }
        


    header {
    width: 100%;
    height: 55px;
    background-color:#333;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 1%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
}

.navbar{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    font-size:14px;
}
.navbar-brand {
    display: flex;
    justify-content: flex-start; /* Ensures the logo is aligned to the start (left) */
    align-items: center; /* Vertically center the logo */
    margin-left: 0; /* Remove any left margin */
    padding-left: 0; /* Remove any left padding */
}

.navbar-brand img {
    /* border: 1.2px solid rgb(11, 173, 202); */
    width: 60px;
    height: 35px;
    margin-right: 10px; /* Adjust as needed */
}

.navbar-toggler {
    display: none;
    background-color: #fff;
    border: none;
    cursor: pointer;
}

.navbar-toggler-icon {
    font-size: 1.5rem;
    color: #191d2b;
}

.navbar-collapse {
    display: flex;
    align-items: center;
    justify-content: flex-end; /* Aligns the nav items to the right */
    width: 100%;
}

.navbar-nav {
    list-style: none;
    display: flex;
    align-items: center;
    gap: 14px;
    justify-content: flex-end; /* Aligns the nav items to the right */
    margin-right: 920px; /* Ensure items are pushed to the right */
    width: auto;
}
.nav-item {
    position: relative;
}

.nav-link {
    color: #fff;
    text-decoration: none;
    padding: 5px 9px;
    border-radius: 12px;
    transition: color 0.3s ease, border-bottom 0.3s ease;
}

.nav-link:hover,
.nav-link.active {
    color: #ffff80;
    border-bottom: 2px #ffff80 solid;
    padding-bottom: 3px;
}

@media (max-width: 991px) {
    .navbar-collapse {
        display: none;
        flex-direction: column;
        background: #191d2b;
        position: absolute;
        top: 80px;
        left: 0;
        width: 100%;
        height: auto;
        z-index: 1000;
        padding: 1rem 0;
        transition: max-height 0.3s ease;
    }
    .navbar-collapse.active {
        display: flex;
        padding-bottom: 10px;
    }
    .navbar-nav {
        flex-direction: column;
        gap: 5px;
    }
    .navbar-toggler {
        display: block;
        padding-bottom: 10px;
    }
}


        .home {
            width: 100%;
            height: 100vh;
            background: url('./images/b34.jpg') no-repeat center/cover;
            padding: 3rem 14%;
            display: flex;
            flex-direction: column;
            align-items: left;
            justify-content: center;
            color: #fff;
            box-shadow: rgba(0, 0, 0, 0.1);
        }
        .home h1 {
            font-size: 3.4rem;
            text-transform: capitalize;
            color:#fff;
            padding-top: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);/*text Shadow*/
            text-align: left;
        }
        .home p {
            max-width: 800px;
            padding: 1.5rem 0 5rem;
            text-align: left;
        }
        .home .button {
            padding-right:900px;
            margin-top: 4.5rem;
            text-align: left;
        }
        .home .button a {
            font-size: 1.1rem;
            text-transform: capitalize;
            color: #fff;
            background: #ff7200;
            padding: 1rem 3rem;
            border-radius: 40px;
            cursor: pointer;
        }
        .home .button a:hover {
            background: #101323;
        }
        .home .social {
            padding-top: 3rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        .home .social i {
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            text-align: center;
            background: #fff;
            color: #ff7200;
            font-size: 1.6rem;
            cursor: pointer;
            transition: 0.4s;
        }
        .home .social i:hover {
            color: #fff;
            background: #101323;
        }
        @media (max-width: 1250px) {
            .header,
            .home {
                padding: 0.5rem 10%;
            }
        }
        @media (max-width: 991px) {
            .header .navbar .navLinks {
                position: absolute;
                left: 0;
                top: 5rem;
                width: 100%;
                height: 0;
                background: #fff;
                text-align: left;
                transition: 0.4s ease-in-out;
                overflow: hidden;
            }
            .header .navbar .navLinks.active {
                height: 280px;
            }
            .header .navbar .navLinks a {
                color: #101323;
                padding-bottom: 10px;
                display: block;
            }
            #menuBtn {
                display: block;
            }
        }
        @media (max-width: 790px) {
            .home h1 {
                font-size: 2.4rem;
            }
        }
        @media (max-width: 560px) {
            .home h1 {
                font-size: 1.7rem;
            }
            .home p {
                width: 100%;
            }
        }
        @media (max-width: 400px) {
            .home h1 {
                font-size: 1.4rem;
            }
            .header .navbar .profile {
                display: none;
            }
        }
        section {
            padding: 2rem 14%;
            text-align: center;
        }
        section h1 {
            text-transform: capitalize;
            font-size: 3.2rem;
            color: #101323;
            margin-top: 2rem;
        }
        section h1 span {
            color: #ff7200;
        }
        section p.text {
            color: #101323;
            padding: 0 5rem;
        }
        .about {
            width: 100%;
            background: url('./images/aboutbg.jpg') no-repeat center/cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
        }
        .about .about-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            border: 3px solid #ff7200;
            border-radius: 20px;
            padding: 2.5rem;
            margin-top: 2rem;
        }
        .about-row .about-col {
            text-align: justify;
        }
        .about-row .about-col p {
            font-size: 1.2rem;
            text-indent: 20px;
            padding-bottom: 2.7rem;
        }
        .about-row .about-col .button a {
            background: #ff7200;
            color: #fff;
            padding: 1rem 3rem;
            text-transform: capitalize;
            border-radius: 40px;
            cursor: pointer;
        }
        .about-row .about-col .button a:hover {
            background: #101323;
        }
        .about-row .about-col img {
            width: 100%;
            height: 24rem;
        }
        @media (max-width: 991px) {
            .about {
                height: auto;
            }
            .about .about-row {
                grid-template-columns: 1fr;
            }
            section p.text {
                padding: 0;
            }
        }
        @media (max-width: 560px) {
            .about .about-row {
                padding: 1rem;
            }
            .about-row .about-col img {
                height: auto;
            }
        }
        .library {
            padding: 2rem 0;
        }
        .library p.text {
            padding: 0 10%;
        }
        .library .library-row {
            margin-top: 2rem;
            background: rgb(80, 80, 255);
            width: 100%;
            height: 80vh;
            padding: 0 14%;
        }
        .library .library-row img {
            width: 100%;
            height: 100%;
        }
        .library .button {
            margin-top: 3.5rem;
            text-align: center;
        }
        .library .button a {
            font-size: 1rem;
            text-transform: capitalize;
            color: #fff;
            background: #ff7200;
            padding: 1rem 3rem;
            border-radius: 40px;
            cursor: pointer;
        }
        .library .button a:hover {
            background: #101323;
        }
        @media (max-width: 991px) {
            .library .library-row {
                height: auto;
                padding: 0;
            }
            .library p.text {
                padding: 0 1%;
            }
        }
        .book .book-row {
            display: flex;
            align-items: center;
            gap: 3rem;
            margin: 3rem 0;
        }
        .book-row .col-1 {
            flex: 1 1 10rem;
            box-shadow: 0 5px 0 rgba(0, 0, 0, 0.5);
        }
        .book-row .col-1 img {
        border-radius: 20px;
        }
        .book-row .col-2 {
            flex: 2 1 20rem;
            text-align: justify;
        }
        .book-row .col-2 p {
            padding: 1rem 0;
            font-size: 1.2rem;
            text-indent: 20px;
        }
        .book-row .col-2 .button a {
            background: #ff7200;
            color: #fff;
            padding: 1rem 3rem;
            text-transform: capitalize;
            border-radius: 40px;
            cursor: pointer;
        }
        .book-row .col-2 .button a:hover {
            background: #101323;
        }
        @media (max-width: 991px) {
            .book .book-row {
                flex-direction: column;
                padding: 0;
            }
            .book-row .col-1 img {
                height: auto;
            }
        }
          .contact {
            padding: 5rem 0;
            background: rgb(80, 80, 255);
            text-align: center;
            color: #fff;
        }

        .contact h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            color:#fff;
        }

        .contact h1 span {
            color: #ff7200;
        }

        .contact p.text {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            color: #ddd;
        }

        .contact-row {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .contact-row img {
            width: 100%;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .contact-form form {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 600px;
        }

        .inputBox {
            position: relative;
            margin-bottom: 1.5rem;
            width: 100%;
        }

        .inputBox input,
        .inputBox textarea {
            width: 100%;
            padding: 1rem;
            font-size: 1rem;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            resize: none;
        }

        .inputBox span {
            position: absolute;
            top: 1rem;
            left: 1rem;
            padding: 0 0.25rem;
            font-size: 1rem;
            color: #999;
            pointer-events: none;
            transition: 0.3s;
        }

        .inputBox input:focus + span,
        .inputBox input:valid + span,
        .inputBox textarea:focus + span,
        .inputBox textarea:valid + span {
            top: -0.5rem;
            left: 1rem;
            background: #fff;
            color: #ff7200;
            font-size: 0.85rem;
            padding: 0 0.25rem;
        }

        .inputBox input[type="submit"] {
            background: #ff7200;
            color: #fff;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s;
        }

        .inputBox input[type="submit"]:hover {
            background: #e66b00;
        }

        @media (max-width: 991px) {
            .contact-row,
            .contact-form {
                flex-direction: column;
            }

            .contact-row img {
                margin-bottom: 2rem;
            }
        }
        .services {
            background: url('./images/book2.jpg') no-repeat center/cover;
            color: #fff;
        }

        .services-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
            margin-top: 2rem;
            padding: 2rem 0;
        }

        .services-row .services-col {
            text-align: center;
            padding: 2.5rem 1.5rem;
            border: 1.2px solid #ff7200;
            border-radius: 20px;
        }

        .services-row .services-col i {
            font-size: 4.5rem;
            color: #ff7200;
            margin: 1.2rem 0;
        }

        .services-row .services-col h3 ,p{
            font-size: 1.4rem;
            text-transform: capitalize;
            padding: 0.7rem 0;
            color: black;
        }

        @media (max-width: 700px) {
            .services-row {
                grid-template-columns: 1fr;
            }
        }
        .footer-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            padding: 2rem 14%;
            background: #191d2b;
            color: #fff;
            text-align: center;
        }

        .footer-row .col h4 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .footer-row .col p,
        .footer-row .col ul {
            font-size: 1rem;
            line-height: 1.5;
            color:#fff;
        }

        .footer-row .col ul {
            list-style: none;
            padding: 0;
        }

        .footer-row .col ul li {
            margin-bottom: 0.5rem;
        }

        .footer-row .col ul li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-row .col ul li a:hover {
            color: #ff7200;
        }

        .footer-row .icons a {
            text-align:center;
            color: yellow;
            font-size: 1.5rem;
            margin-right: 1rem;
            transition: color 0.3s ease;
        }

        .footer-row .icons a:hover {
            color: #ff7200;
        }

        .footer.text p{
            text-align: center;
            padding: 1rem 0a
            color: #fff;
            font-size: 1rem;
        }

        @media (max-width: 991px) {
            .footer-row {
                padding: 2rem 5%;
            }
        }

        @media (max-width: 560px) {
            .footer-row {
                padding: 2rem 2%;
            }
        }
        
        
    </style>
    <script type="text/javascript">
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
</head>
<body onload="funload()" >
<header>
    <nav class="navbar navbar-expand-sm bg-dark">
        <a class="navbar-brand">
            <img src="./images/logo.png" alt="Google Logo">
        </a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login_register.jsp">Login/Register</a></li>
                <li class="nav-item"><a class="nav-link" href="adminlogin.jsp">Admin_Login</a></li>
                <li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>
</header>

    

    <section class="home" id="home">
        <h1>Welcome to the <span> MK Book Store</span> </h1>
        <p><b>Discover a world of books and immerse yourself in a wide selection of genres. Find your next read today!</b></p>
        <div class="button">
                <a href="login_register.jsp">Read More</a>
            </div>
        <div class="social">
            <a href="https://facebook.com/bookstore"><i class="bx bxl-facebook"></i></a>
            <a href="https://twitter.com/bookstore"><i class="bx bxl-twitter"></i></a>
            <a href="https://www.instagram.com/gurjar__manish27__/"><i class="bx bxl-instagram"></i></a>
            <a href="https://www.linkedin.com/in/manish-khatriya-ab8763249/"><i class="bx bxl-linkedin"></i></a>
        </div>
    </section>

    <section class="about" id="about">
        <h1>About <span>Us</span></h1>
        <p class="text">At Memorial Book Store, we are passionate about books and committed to providing the best reading experience for our customers.</p>
        <div class="about-row">
            <div class="about-col">
                <img src="./images/about1.png" alt="About Us Image">
            </div>
            <div class="about-col">
                <p>We offer a diverse collection of books across various genres, ensuring that there's something for everyone. Whether you're looking for the latest bestsellers, classic literature, or niche genres, we have it all. Our mission is to promote reading and make books accessible to everyone. Join us in our journey to cultivate a love for reading and explore the world through books.</p>
                <div class="button">
                    <a href="About.jsp">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <section class="library" id="library">
        <h1>Our <span>Library</span></h1>
        <p class="text">Explore our extensive library and find the perfect book for your next read. We have a wide range of genres to choose from, catering to all kinds of readers.</p>
        <div class="library-row">
            <img src="./images/L5.jpg" alt="Library Image">
        </div>
        <div class="button">
            <a href="#">Visit Library</a>
        </div>
    </section>

    <section class="book" id="book">
    <h1>Featured <span>Books</span></h1>
    
    <!-- Book 1 -->
    <div class="book-row">
        <div class="col-1">
            <img src="./images/b40.jpg" alt="Book 1 Image" height="250px">
        </div>
        <div class="col-2">
            <p>"The Echoes of Eternity" is a gripping tale of love, loss, and redemption set against the backdrop of a mystical world where ancient secrets lie buried. Follow the journey of a young protagonist as they unravel the mysteries of their lineage and discover a power that could change the fate of their world.</p>
            <div class="button">
                <a href="About.jsp">Read More</a>
            </div>
        </div>
    </div>
    
    <!-- Book 2 -->
    <div class="book-row">
        <div class="col-1">
            <img src="./images/book-2.jpg" alt="Book 2 Image" height="250px">
        </div>
        <div class="col-2">
            <p>"Whispers in the Wind" explores the delicate balance between nature and human ambition. This thought-provoking novel delves into the life of a small-town botanist who stumbles upon a groundbreaking discovery that could alter the course of ecological history. As forces conspire to claim his work, he must decide between fame and the greater good.</p>
            <div class="button">
                <a href="About.jsp">Read More</a>
            </div>
        </div>
    </div>
</section>

  <section class="contact" id="contact">
        <h1>Contact <span>Us</span></h1>
        <p class="text">We'd love to hear from you! Fill out the form below to get in touch with us.</p>
        <div class="contact-form">
            <form id="contactForm" action="index.jsp">
                <div class="inputBox">
                    <input type="text" required="required">
                    <span>Name</span>
                </div>
                <div class="inputBox">
                    <input type="email" required="required">
                    <span>Email</span>
                </div>
                <div class="inputBox">
                    <textarea required="required"></textarea>
                    <span>Message</span>
                </div>
                <div class="inputBox">
                    <input type="submit" value="Send">
                </div>
            </form>
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
    </section>
    <section class="services" id="services">
        <h1>Our <span>Services</span></h1>
        <div class="services-row">
            <div class="services-col">
                <i class="bx bxs-book"></i>
                <h3>Wide Range of Books</h3>
                <p>Explore our extensive collection of books across various genres and categories.</p>
            </div>
            <div class="services-col">
                <i class="bx bx-book-reader"></i>
                <h3>Reading Areas</h3>
                <p>Enjoy a comfortable reading experience in our specially designed reading areas.</p>
            </div>
            <div class="services-col">
                <i class="bx bx-search-alt"></i>
                <h3>Book Search</h3>
                <p>Find the book you are looking for with our easy-to-use search system.</p>
            </div>
        </div>
    </section>

     <footer>
        <div class="footer-row">
            <div class="col">
                <h4>About Us</h4>
                <p>MK Bookstore is where stories come alive, offering a curated selection of books that inspire and captivate every reader. Discover your next adventure with us.</p>
            </div>
            <div class="col">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="#">Library</a></li>
                    <li><a href="login_register.jsp">Books</a></li>
                    <li><a href="Contact.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="col">
                <h4>Follow Us</h4>
                <div class="icons">
                    <a href="https://facebook.com/bookstore"><i class="bx bxl-facebook"></i></a>
                    <a href="https://twitter.com/bookstore"><i class="bx bxl-twitter"></i></a>
                    <a href="https://www.instagram.com/gurjar__manish27__/"><i class="bx bxl-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/manish-khatriya-ab8763249/"><i class="bx bxl-linkedin"></i></a>
                </div>
            </div>
        </div>
         <pre><p class="text">                                                                                           © 2024 MK Book Store. All Rights Reserved.</p></pre>
        
    </footer>

    <script>
        function showMenu() {
            document.getElementById('navLinks').style.right = "0";
        }
        function hideMenu() {
            document.getElementById('navLinks').style.right = "-200px";
        }
    
	// Preloder script
	var tmp = document.getElementById("loding");
	function funload() {
	  loding.style.display = "none";
	}
	document.getElementById('contactForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const url = new URL(window.location.href);
        url.searchParams.set('submitted', 'true');
        window.location.href = url.href;
    });
  </script>

    
</body>
</html>
