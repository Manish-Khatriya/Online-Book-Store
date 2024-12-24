<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Online Bookstore</title>
    <link rel="apple-touch-icon" sizes="180x180" href="./images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon-16x16.png">
    <link rel="manifest" href="./favicons/site.webmanifest">
    <link rel="stylesheet" href="styles.css">
    <!-- Font Awesome CDN for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        
        main {
            padding: 20px;
        }
        
        section.about, section.admin-details {
            background-color: #fff;
            margin: 20px auto;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            position: relative; /* Add relative positioning for the social-links */
        }
        
        section h2 {
            color: #ff7200;
            font-size: 2em;
            border-bottom: 2px solid #ff7200;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .admin-profile {
            display: flex;
            flex-direction: column; /* Stack image and text vertically */
            align-items: center; /* Center horizontally */
            width: 100%;
        }
        
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid #ff7200;
            margin-bottom: 20px; /* Space between image and text */
        }
        
        .admin-info {
            text-align: left; /* Align text to the left */
            position: relative; /* Add relative positioning for the social-links */
        }
        
        .admin-info h3 {
            color: #ff7200;
            font-size: 1.8em;
            margin-top: 0;
            text-align: center; 
            padding-right: 5px; /* Space for the LinkedIn logo */
            position: relative; /* Add relative positioning for the LinkedIn logo */
        }
        
        .social-links {
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 10px;
        }
        
        .social-links i {
            font-size: 30px; /* Adjust size if needed */
            color: #333;
        }
        
        .social-links a {
            display: inline-block;
            margin: 0 5px; /* Space between icons */
        }
        
        .social-links a:hover i {
            color: #ff7200; 
        }
        
        .expert-skills {
            color: #333;  
            border-radius: 5px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 20px;
        }
        
        a {
            color: #333; 
            text-decoration: none;
            font-weight: bold;
        }
        
        a:hover {
            color: #ff7200;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <main>
        <section class="admin-details">
            <div class="admin-profile">
                <img src="images/Newimage.jpeg" alt="Admin Profile Image" class="profile-image">
                <div class="admin-info">
                    <h3>Manish Khatriya</h3>
                    <div class="social-links">
                        <a href="https://www.linkedin.com/in/manish-khatriya-ab8763249/" target="_blank" title="LinkedIn Profile">
                            <i class="fab fa-linkedin"></i>
                        </a>
                    </div>
                    <p><strong>B.Tech in Computer Science and Information Technology</strong></p>
                    <p><strong>College:</strong> IPS Academy Indore</p>
                    <p><strong>Skills:</strong> Java, JavaScript, Python, HTML, CSS, C, C#, C++, MySQL, Bootstrap, DSA (Java), OOP's, Problem Solving</p>
                    <p class="expert-skills">Expert in Java, Data Structures and Algorithms in Java, HTML, CSS, MySQL</p>
                    <p>
                        Manish Khatriya is an experienced engineer with a strong background in software development and web technologies. Passionate about leveraging technology to solve problems, Manish is dedicated to continuous learning and improving skills.
                    </p>
                    <p>
                        With a B.Tech in Computer Science and Information Technology, Manish has developed expertise in various programming languages and technologies. Manish is committed to creating innovative solutions and contributing to the tech community.
                    </p>
                    <p>
                        <strong>Portfolio:</strong> <a href="#" target="_blank">View Portfolio</a>
                    </p>
                    <p>
                        <strong>Resume:</strong> <a href="#" target="_blank">View Resume</a>
                    </p>
                </div>
            </div>
        </section>
    </main>
    
</body>
</html>
