<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .offer-text {
            text-align: center;
            font-size: 36px;
            color: #222;
            font-weight: 700;
            margin-top: 40px;
            margin-bottom: 30px;
        }

        .offer-card {
            border: 1px solid #ddd;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            background-color: #fff;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .offer-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .offer-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
        }

        .offer-body {
            padding: 15px;
            text-align: center;
            flex-grow: 1;
        }

        .offer-body h5 {
            font-weight: 600;
            margin-bottom: 10px;
            color: #333;
        }

        .offer-body p {
            color: #444;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .offer-body .btn {
            background-color: #e67e22;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease;
            margin-top: 10px;
            width: 100%;
        }

        .offer-body .btn:hover {
            background-color: #cf6a15;
        }

        /* Fix navbar-toggler icon visibility */
        .navbar-dark .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba%28255,255,255,0.8%29' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }
    </style>
</head>

<body>

<!-- Navbar -->
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
                <li class="nav-item mx-2"><a class="nav-link text-warning active" href="Vehicle.jsp">Vehicle</a></li>
                <li class="nav-item mx-2"><a class="nav-link text-white" href="contact.jsp#contact">Contact</a></li>
            </ul>
            <div class="d-flex">
                <a href="login.html" class="btn btn-outline-warning me-2">Login</a>
                <a href="register.jsp" class="btn btn-warning text-dark">Register</a>
            </div>
        </div>
    </div>
</nav>

<!-- Vehicle Listing Section -->
<section>
    <div class="container">
        <div class="offer-text">Our Best Offers</div>

        <div class="row g-4">
            <%
                String url = "jdbc:mysql://localhost:3306/rentdb";
                String user = "root";
                String password = "1234";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM cars");

                    while(rs.next()) {
                        int carId = rs.getInt("id");
                        String name = rs.getString("name");
                        String brand = rs.getString("brand");
                        String type = rs.getString("type");
                        double price = rs.getDouble("price_per_day");
                        String image = rs.getString("image");
            %>
            <div class="col-sm-6 col-md-4 col-lg-3 d-flex">
                <div class="offer-card w-100">
                    <img src="<%= request.getContextPath() %>/uploads/<%= image %>" alt="<%= name %>">

                    <div class="offer-body">
                        <h5><%= name %></h5>
                        <p>Brand: <%= brand %></p>
                        <p>Type: <%= type %></p>
                        <p>₹<%= price %> / day</p>
                       <a href="<%= request.getContextPath() %>/bookingForm.jsp?id=<%= carId %>" class="btn btn-sm btn-orange">Book Now</a>

                    </div>
                </div>
            </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<div class='alert alert-danger mt-3 text-center'>Error: " + e.getMessage() + "</div>");
                }
            %>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
