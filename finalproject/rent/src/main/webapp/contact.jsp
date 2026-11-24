<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            /* TODO: Add your dark abstract background image URL here */
            background-image: url('https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNzEyODZ8MHwxfGFsbHx8fHx8fHx8fDE3MTUyMDUyNDZ8&ixlib=rb-4.0.3&q=80&w=1080');
            background-color: #1a1a1a; /* Fallback dark color */
            background-size: cover;
            background-position: center;
            font-family: 'Poppins', sans-serif;
        }

        /* ----- Navbar ----- */
        /* (Your existing navbar styles are fine) */

        /* ----- Contact Section ----- */
        .contact-section {
            padding: 5rem 1rem; /* Add padding for spacing */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 56px); /* Full height minus navbar */
        }

        .contact-form-container {
            max-width: 1000px;
            width: 100%;
            background: #fff; /* White background for the form side */
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            overflow: hidden; /* Clips the inner columns to the rounded border */
        }

        /* ----- Left Info Column ----- */
        .contact-info-col {
            background-color: #f05a28; /* Approx. orange-red from image */
            
            /* TODO: Add your faint car background image URL here */
            background-image: url('https://images.unsplash.com/photo-1542362567-b07e54358753?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3wzNzEyODZ8MHwxfGFsbHx8fHx8fHx8fDE3MTUyMDUzMzR8&ixlib=rb-4.0.3&q=80&w=1080');
            background-blend-mode: overlay; /* Blends image with color */
            background-size: cover;
            background-position: center;
            
            padding: 50px 40px;
            color: #fff;
            
            /* On mobile, this column will be on top */
        }

        .contact-info-col h2 {
            font-weight: 700;
            margin-bottom: 20px;
        }

        .contact-info-col p {
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .contact-info-details {
            margin-top: 30px;
        }

        .contact-info-details .info-item {
            display: flex;
            align-items: flex-start; /* Align icon with first line of text */
            margin-bottom: 20px;
            font-size: 0.95rem;
            font-weight: 500;
        }

        .contact-info-details .info-item i {
            font-size: 1.3rem;
            margin-right: 15px;
            width: 20px;
            text-align: center;
            margin-top: 3px;
        }

        /* ----- Right Form Column ----- */
        .contact-form-col {
            padding: 50px 40px;
        }

        /* Custom Form Group styling */
        .custom-form-group {
            position: relative;
            margin-bottom: 35px; /* Space between fields */
        }

        .custom-form-group .form-control {
            border: none; /* Remove all borders */
            border-bottom: 2px solid #ddd; /* Add only bottom border */
            border-radius: 0; /* Remove border-radius */
            padding: 10px 0; /* Adjust padding */
            background: transparent; /* No background */
            box-shadow: none; /* Remove focus shadow */
            transition: border-color 0.3s;
        }

        .custom-form-group .form-control:focus {
            border-color: #f05a28; /* Orange-red border on focus */
            box-shadow: none;
        }

        .custom-form-group .form-control::placeholder {
            color: #999;
            font-weight: 400;
        }
        
        /* Special styling for the mobile field group */
        .mobile-group {
            display: flex;
            border-bottom: 2px solid #ddd;
            transition: border-color 0.3s;
        }
        
        .mobile-group:focus-within {
            border-color: #f05a28; /* Highlight bottom border for whole group */
        }

        .mobile-group .country-code {
            border: none;
            background: transparent;
            padding: 10px 0;
            font-size: 1rem;
            color: #555;
            font-weight: 500;
            flex-shrink: 0;
            padding-right: 10px;
            -webkit-appearance: none; /* Removes default select arrow */
            -moz-appearance: none;
            appearance: none;
        }
        
        .mobile-group .country-code:focus {
            outline: none;
        }

        .mobile-group .form-control {
            border: none;
            padding-left: 10px;
            flex-grow: 1; /* Input takes remaining space */
        }

        /* Textarea style */
        textarea.form-control {
            height: 100px; /* Adjust height as needed */
        }

        /* Button Style */
        .btn-send-message {
            background-color: #f05a28;
            color: #fff;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 30px; /* Pill shape */
            border: none;
            transition: background-color 0.3s, box-shadow 0.3s;
            display: inline-block; /* Match button in image */
        }

        .btn-send-message:hover {
            background-color: #d94f21; /* Darker orange */
            color: #fff;
            box-shadow: 0 5px 15px rgba(240, 90, 40, 0.4);
        }
        
        /* Stack columns on mobile */
        @media (max-width: 991.98px) {
            .contact-info-col {
                /* On mobile, info col gets top rounded corners */
                border-radius: 15px 15px 0 0;
            }
            .contact-form-col {
                 /* On mobile, form col gets bottom rounded corners */
                border-radius: 0 0 15px 15px;
            }
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-warning" href="Homepage.jsp">Rental X</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item mx-2"><a class="nav-link text-white" href="Homepage.jsp#hero">Home</a></li>
                    <li class="nav-item mx-2"><a class="nav-link text-white" href="Homepage.jsp#about">About</a></li>
                    <li class="nav-item mx-2"><a class="nav-link text-white" href="Homepage.jsp#search">Search</a></li>
                    <li class="nav-item mx-2"><a class="nav-link text-white" href="Vehicle.jsp">Vehicle</a></li>
                    <li class="nav-item mx-2"><a class="nav-link text-warning active" href="contact.jsp">Contact</a></li>
                </ul>
                <div class="d-flex">
                    <a href="login.html" class="btn btn-outline-warning me-2">Login</a>
                    <a href="register.jsp" class="btn btn-warning text-dark">Register</a>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="contact-section">
        <div class="container">
            <div class="contact-form-container">
                <div class="row g-0">
                    
                    <div class="col-lg-5 contact-info-col">
                        <h2>Get in Touch</h2>
                        <p>
                            Ready to rent a car in Pune Whether you're 
                            exploring the city, traveling for business, or planning a 
                            getaway, Reantal X is here to make your journey easy 
                            and enjoyable.
                        </p>
                        <p>
                            Rental X – Best Car Rental Service in Pune. 
                            Drive your preferred vehicle with confidence. Enjoy 
                            affordable rates, flexible bookings, and unmatched 
                            customer service.
                        </p>

                        <div class="contact-info-details">
                            <div class="info-item">
                                <i class="bi bi-telephone-fill"></i>
                                <span>+91 9895 041 111</span>
                            </div>
                            <div class="info-item">
                                <i class="bi bi-whatsapp"></i>
                                <span>+91 9895 265 111</span>
                            </div>
                            <div class="info-item">
                                <i class="bi bi-envelope-fill"></i>
                                <span>rentalx.com</span>
                            </div>
                            <div class="info-item">
                                <i class="bi bi-geo-alt-fill"></i>
                                <span>PUNE , INDIA</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 contact-form-col">
                        
                        <% 
                            String message = request.getParameter("msg");
                            if(message != null) { 
                        %>
                            <div class="alert alert-success text-center"><%= message %></div>
                        <% } %>

                        <form action="<%=request.getContextPath()%>/ContactServlet" method="post">
                            
                            <div class="custom-form-group">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Your Full Name" required>
                            </div>

                            <div class="custom-form-group">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
                            </div>

                            <div class="custom-form-group">
                                <div class="mobile-group">
                                    <select class="country-code" name="country_code">
                                        <option value="+91" selected>India (+91)</option>
                                        <option value="+1">USA (+1)</option>
                                        <option value="+44">UK (+44)</option>
                                    </select>
                                    <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Mobile No" required>
                                </div>
                            </div>
                            
                            <div class="custom-form-group">
                                <textarea class="form-control" id="subject" name="subject" rows="4" placeholder="Subject" required></textarea>
                            </div>

                            <button type="submit" class="btn btn-send-message">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>