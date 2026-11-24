<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up - </title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* ------------------------------------- */
        /* 1. BACKGROUND AND OVERLAY STYLES      */
        /* ------------------------------------- */
        body {
            /* Using a high-res image placeholder resembling the car theme */
            background:url(img/imgi_4_login_bg.9b366799.jpg) no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center; /* Center content vertically */
            align-items: center; /* Center content horizontally */
            position: relative;
        }

        /* Overlay to darken the background image and improve readability */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            /* Gradient for a softer transition from dark (top) to slightly lighter (bottom) */
            background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.2));
            z-index: -1;
        }
        
        /* ------------------------------------- */
        /* 2. LOGO/BRAND STYLES                  */
        /* ------------------------------------- */
        .brand-logo {
            position: absolute;
            top: 20px;
            left: 50px;
            font-size: 1.2rem;
            color: #fff;
            font-weight: 700;
            z-index: 10;
        }
        .brand-logo .logo-text {
            color: #5d50ab; /* Mimicking the blue/purple accent */
            font-weight: 900;
            letter-spacing: 1px;
        }

        /* ------------------------------------- */
        /* 3. CARD AND FORM STYLES               */
        /* ------------------------------------- */
        .signup-card {
            background-color: #fff;
            border-radius: 20px; /* Highly rounded corners */
            padding: 40px 50px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15); /* Soft, deep shadow */
            width: 100%;
            max-width: 500px; /* Fixed width for desktop view */
        }
        @media (max-width: 768px) {
            .signup-card {
                margin: 40px 20px;
                padding: 30px 20px;
                max-width: 90%; /* Responsive width for mobile */
            }
        }
        
        .card-title {
            font-size: 2.2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .card-subtitle {
            color: #6c757d;
            font-size: 0.95rem;
            margin-bottom: 25px;
        }

        /* Input field styling to match the light gray background in the image */
        .form-control {
            background-color: #f0f3f6; 
            border: 1px solid #e0e0e0;
            border-radius: 8px; /* Slightly rounded inputs */
            padding: 12px 15px;
            height: auto;
            font-size: 1rem;
        }
        .form-control:focus {
            background-color: #fff;
            border-color: #4b3a8e; /* Focus color matches button */
            box-shadow: 0 0 0 0.2rem rgba(75, 58, 142, 0.25);
        }

        /* Custom label style to match the image's use of an asterisk */
        .form-label {
            font-size: 0.9rem;
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
        }
        .form-label::after {
            content: "*";
            color: #dc3545; /* Red asterisk */
            margin-left: 2px;
        }


        /* ------------------------------------- */
        /* 4. BUTTON STYLES                      */
        /* ------------------------------------- */
        .btn-register {
            background-color: #4b3a8e; /* Deep purple color from the image */
            border-color: #4b3a8e;
            color: white;
            padding: 12px 0;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background-color 0.2s;
        }
        .btn-register:hover {
            background-color: #3a2e70; /* Slightly darker on hover */
            border-color: #3a2e70;
            color: white;
        }
        .btn-register:active {
            background-color: #2b2255 !important;
            border-color: #2b2255 !important;
        }

    </style>
</head>
<body>

<!-- Custom Logo Placeholder -->
<div class="brand-logo">
   Rental<span class="logo-text">X</span>
    <div style="font-size: 0.7rem; font-weight: 400; opacity: 0.8; margin-top: -5px;">• SELF DRIVE CARS</div>
</div>

<div class="signup-card">
    <div class="text-center">
        <h1 class="card-title">Sign up</h1>
        <p class="card-subtitle">
            If you don't have an account register <br> 
            You can <a href="loginjsp.jsp" class="text-decoration-none" style="color: #4b3a8e; font-weight: 600;">Login here!</a>
        </p>
    </div>

    <!-- Server-side Message Display Block -->
    <%
        String message = (String) request.getAttribute("message");
        String alertClass = (String) request.getAttribute("alertClass");
        if (message != null && !message.isEmpty()) {
    %>
            <div class="alert <%= alertClass != null ? alertClass : "alert-info" %>" role="alert">
                <%= message %>
            </div>
    <%
        }
    %>
    <!-- End Server-side Message Display -->

    <form action="RegisterServlet" method="post">
        
        <!-- Name Field -->
        <div class="mb-4">
            <label for="inputName" class="form-label">Name</label>
            <input type="text" name="name" class="form-control" id="inputName" placeholder="Full Name" required>
        </div>

        <!-- Email Field -->
        <div class="mb-4">
            <label for="inputEmail" class="form-label">Email</label>
            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="you@example.com" required>
        </div>

        <!-- Password Field -->
        <div class="mb-5">
            <label for="inputPassword" class="form-label">Password</label>
            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Minimum 8 characters" required>
        </div>

        <!-- Submit Button (Styled to look like the "Send OTP" button) -->
        <button type="submit" class="btn btn-register w-100">
            Register
        </button>
    </form>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
