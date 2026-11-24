<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

    <style>
        .hero {
            position: relative;
            background: #fff;
            overflow: hidden;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .hero-content {
            z-index: 2;
        }

        .hero h1 {
            font-size: 48px;
            font-weight: 700;
            color: #222;
        }

        .hero h1 span {
            color: #ff4c1e;
            /* orange */
        }

        .hero p {
            color: #555;
            margin-top: 15px;
            margin-bottom: 25px;
        }

        .btn-orange {
            background: #ff4c1e;
            color: #fff;
            padding: 12px 25px;
            border: none;
            font-weight: 600;
        }

        .btn-orange:hover {
            background: #e63e12;
            color: #fff;
        }

        .btn-dark {
            padding: 12px 25px;
            font-weight: 600;
        }

        .hero {
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            overflow: hidden;
        }

        .hero-image {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100%;
        }

        .hero-image img {
            max-height: 100vh;
            width: auto;
            object-fit: contain;
        }

        /*about img*/

        .about-title {
            font-weight: bold;
            font-size: 32px;
        }

        .about-title span {
            color: #ff4d00;
        }

        .btn-orange {
            background-color: #ff4d00;
            color: #fff;
            padding: 10px 25px;
            border-radius: 5px;
            border: none;
            transition: 0.3s ease;
        }

        /*---------------------Search------------------*/

        .search-section {
            background-color: #333;
        }

        /*------------------------offer---------------*/
        .offer-text {
            width: 100%;
            float: left;
            font-size: 40px;
            color: #3b3b3b;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            padding-bottom: 0px;
        }

        .offer-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            background-color: #fff;
        }

        .offer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .offer-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .offer-body {
            padding: 15px;
            text-align: center;
        }

        .offer-body h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .offer-body p {
            color: #e67e22;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .offer-body .btn {
            background-color: #e67e22;
            color: #fff;
            border: none;
            transition: background-color 0.3s;
        }

        .offer-body .btn:hover {
            background-color: #cf6a15;
        }

        /*------------------------choose us---------------*/
        .choose-section {
            background-color: #363636;
            padding: 80px 0;
        }

        .choose-section .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .choose-section .section-title h2 {
            font-weight: 700;
            color: white;
        }

        .choose_text {
            color: #fff;
        }

        .choose-card {
            text-align: center;
            background-color: white;
            padding: 30px 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
            height: 100%;
        }

        .choose-card:hover {
            background-color: #e67e22;
            color: #fff;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .choose-card i {
            font-size: 40px;
            color: #e67e22;
            margin-bottom: 15px;
            transition: color 0.3s;
        }

        .choose-card:hover i {
            color: #fff;
        }

        .choose-card h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .choose-card p {
            font-size: 15px;
            color: #555;
            margin-bottom: 0;
        }

        .choose-card:hover p {
            color: #fff;
        }

        footer {
            background-color: #222;
            color: #fff;
            padding: 60px 0 30px;
        }

        footer h5 {
            font-weight: 600;
            margin-bottom: 20px;
        }

        footer p,
        footer a {
            font-size: 15px;
            color: #ccc;
            text-decoration: none;
        }

        footer a:hover {
            color: #e67e22;
        }

        .footer-social a {
            color: #fff;
            font-size: 20px;
            margin-right: 15px;
            transition: color 0.3s;
        }

        .footer-social a:hover {
            color: #e67e22;
        }

        .footer-bottom {
            border-top: 1px solid #444;
            margin-top: 40px;
            padding-top: 15px;
            text-align: center;
            font-size: 14px;
            color: #aaa;
        }

        .footer-logo {
            font-size: 24px;
            font-weight: bold;
            color: #e67e22;
            margin-bottom: 15px;
            display: inline-block;
        }
    </style>
</head>

<body>

<%
    HttpSession userSession = request.getSession(false);
    String userName = null;
    if (userSession != null) {
        userName = (String) userSession.getAttribute("userName");
    }
%>


<%
    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/rentdb"; // Assuming a local MySQL database, adjust if needed
    String user = "root"; // Default MySQL user, adjust if needed
    String password = "1234";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    String dbStatus = "";

    try {
        // Load the MySQL JDBC Driver
        // NOTE: You must have the MySQL Connector/J JAR file in your project's classpath (e.g., in WEB-INF/lib)
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish the connection
        con = DriverManager.getConnection(url, user, password);
        dbStatus = "";

        // You can use the connection 'con' to fetch dynamic data and display it in the HTML sections below.
        // For example, to fetch cars for the "Our best offers" section:
        /*
        // Example to get the count of cars (just an example, not used for display here)
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM cars");
        if(rs.next()) {
            // int carCount = rs.getInt("total");
            // System.out.println("Total cars: " + carCount);
        }
        */

    } catch (SQLException e) {
        dbStatus = "Database Connection FAILED: " + e.getMessage();
        // Log the error for debugging
        // System.err.println(dbStatus);
    } catch (ClassNotFoundException e) {
        dbStatus = "JDBC Driver Not Found! Ensure the MySQL Connector/J JAR is in WEB-INF/lib. Error: " + e.getMessage();
        // System.err.println(dbStatus);
    } finally {
        // We generally close resources right after use, but for a global status, we print it here
    }
%>

    <%-- <div class="container-fluid text-center p-2 text-white bg-secondary">
        <%= dbStatus %>
    </div> --%>
    
    <nav class="navbar navbar-expand-lg bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">Rental X</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item  mx-2">
                        <a class="nav-link active text-white" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link text-white" href="#">About</a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link text-white" href="searchCars.jsp">Search </a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link text-white" href="Vehicle.jsp">Vehicle</a>
                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link text-white" href="contact.jsp">Contact</a>
                    </li>


                </ul>


                 <div class="d-flex align-items-center">
                <% if (userName != null) { %>
                    <span class="text-warning fw-semibold me-3">
                        Welcome, <%= userName %>!
                    </span>
                <% } else { %>
                    <a href="loginjsp.jsp" class="btn btn-outline-warning me-2">Login</a>
                    <a href="register.jsp" class="btn btn-warning text-dark">Register</a>
                <% } %>
                </div>
            </div>
        </div>
    </nav>


    <section class="hero container-fluid">
        <div class="container-fluid">
            <div class="row align-items-center">


                <div class="col-md-6 hero-content">
                    <h1>Car Rent <br><span>For You</span></h1>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority.</p>
                    <a href="login.html" class="btn btn-orange me-3">Read More</a>
                    <button class="btn btn-dark">Contact Us</button>
                </div>


                <div class="col-md-6 hero-image text-end p-0">
                    <img src="img/imgi_14_banner-bg.png" alt="Car">
                </div>

            </div>
        </div>
    </section>


    <section class="about py-5">
        <div class="container">
            <div class="row align-items-center">


                <div class="col-md-6 text-center">
                    <img src="img/imgi_3_about-img.png" alt="Jeep" class="img-fluid">
                </div>


                <div class="col-md-6">
                    <h2 class="about-title">ABOUT <span>US</span></h2>
                    <p>
                        going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing
                        hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat
                        predefined.
                        going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing
                        hidden
                        in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined.
                    </p>
                    <button class="btn btn-orange">Read More</button>
                </div>

            </div>
        </div>
    </section>
    
    <!-- <section class="search-section py-5">
        <div class="container text-center text-white">

            <h2 class="fw-bold">Search Your Best Cars</h2>
            <p class="mb-4">Using 'Content here, content here', making it look like readable</p>


            <div class="row justify-content-center g-3">
                <div class="col-md-2 col-6">
                    <select class="form-select">
                        <option selected>Any Brand</option>
                        <option value="1">Toyota</option>
                        <option value="2">BMW</option>
                        <option value="3">Mercedes</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <select class="form-select">
                        <option selected>Any type</option>
                        <option value="1">SUV</option>
                        <option value="2">Sedan</option>
                        <option value="3">Hatchback</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <select class="form-select">
                        <option selected>Price</option>
                        <option value="1">Under ₹20,000</option>
                        <option value="2">₹20,000-₹50,000</option>
                        <option value="3">Above ₹50,000</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <button class="btn btn-orange w-100">Search Now</button>
                </div>
            </div>
        </div>
    </section>
     -->
   <!--  <section>
        <div class="cotainer">
            <div class="offer-text mt-5">
                <h2>Our best offers</h2>
            </div>
        </div>

        <div class="row g-4">


            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Audi A4/imgi_17_a4-exterior-right-front-three-quarter-2.jpg" alt="Offer 1">
                    <div class="offer-body">
                        <h5>BMW X5</h5>
                        <p>Start per day $120</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/BMW X5/imgi_96_x5-exterior-right-front-three-quarter-5.jpg" alt="Offer 2">
                    <div class="offer-body">
                        <h5>Audi A4</h5>
                        <p>Start per day $100</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Maruti Grand Vitara/imgi_236_grand-vitara-exterior-right-front-three-quarter-4.jpg"
                        alt="Offer 3">
                    <div class="offer-body">
                        <h5>Maruti</h5>
                        <p>Start per day $150</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>


            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Toyota Land Cruiser/imgi_171_land-cruiser-exterior-right-front-three-quarter-2.jpg"
                        alt="Offer 4">
                    <div class="offer-body">
                        <h5>land cruiser</h5>
                        <p>Start per day $200</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Tesla Model Y/imgi_185_model-y-exterior-right-front-three-quarter-4.jpg"
                        alt="Offer 3">
                    <div class="offer-body">
                        <h5>Tesla Y</h5>
                        <p>Start per day $150</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Mahindra Scorpio N/imgi_30_scorpio-n-exterior-right-front-three-quarter-77.webp"
                        alt="Offer 3">
                    <div class="offer-body">
                        <h5>Scorpio N</h5>
                        <p>Start per day $150</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/Land Rover Range Rover/imgi_184_range-rover-exterior-right-front-three-quarter-46.jpg"
                        alt="Offer 3">
                    <div class="offer-body">
                        <h5>land Rover</h5>
                        <p>Start per day $150</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="offer-card">
                    <img src="img/crysta.jpg" alt="Offer 3">
                    <div class="offer-body">
                        <h5>crysta</h5>
                        <p>Start per day $150</p>
                        <a href="#" class="btn btn-sm">Book Now</a>
                    </div>
                </div>
            </div>

        </div>
        </div>


    </section> -->

    <section class="choose-section">
        <div class="container">

            <div class="section-title">
                <h2>Why Choose Us</h2>
                <p class="choose_text">We provide quality, reliability, and satisfaction with every ride</p>
            </div>


            <div class="row g-4">


                <div class="col-md-6 col-lg-3">
                    <div class="choose-card">
                        <i class="fa-solid fa-car-side "></i>
                        <h5>Wide Range of Vehicles</h5>
                        <p>We have cars for every need — from economy to luxury.</p>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3">
                    <div class="choose-card">
                        <i class="fa-solid fa-dollar-sign"></i>
                        <h5>Affordable Prices</h5>
                        <p>Get the best deals with transparent pricing and no hidden costs.</p>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3">
                    <div class="choose-card">
                        <i class="fa-solid fa-headset"></i>
                        <h5>24/7 Support</h5>
                        <p>Our support team is always ready to help you anytime, anywhere.</p>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3">
                    <div class="choose-card">
                        <i class="fa-solid fa-shield-halved"></i>
                        <h5>Trusted & Secure</h5>
                        <p>We ensure safe and secure service for all our customers.</p>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">


                <div class="col-md-6 col-lg-3 mb-4">
                    <p>We provide reliable and affordable vehicle rental services for your every journey. Drive your
                        dream car today!</p>
                </div>


                <div class="col-md-6 col-lg-3 mb-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Offers</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>


                <div class="col-md-6 col-lg-3 mb-4">
                    <h5>Support</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Help Center</a></li>
                    </ul>
                </div>


                <div class="col-md-6 col-lg-3 mb-4">
                    <h5>Contact Us</h5>
                    <p><i class="fa-solid fa-location-dot me-2"></i>123 Main Street, Mumbai, India</p>
                    <p><i class="fa-solid fa-phone me-2"></i>+91 12345678</p>
                    <p><i class="fa-solid fa-envelope me-2"></i>info@rental.com</p>
                    <div class="footer-social mt-3">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                </div>

            </div>


            <div class="footer-bottom">
                © 2025 Rental X. All Rights Reserved.
            </div>
        </div>
    </footer>


    <%
    // Close resources at the end of the page execution
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        // Log resource closing error
        // System.err.println("Error closing resources: " + e.getMessage());
    }
    %>
    
    

<div class="position-fixed top-0 end-0 p-3" style="z-index: 2000">
  <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert">
    <div class="d-flex">
      <div class="toast-body fw-semibold">Message sent successfully!</div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
    </div>
  </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous">
    
    const params = new URLSearchParams(window.location.search);
    if (params.get('success') === 'true') {
      const toastEl = document.getElementById('successToast');
      const toast = new bootstrap.Toast(toastEl);
      toast.show();
    }
    </script>
        
       
        
        
        
</body>

</html>