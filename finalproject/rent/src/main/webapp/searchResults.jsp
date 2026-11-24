<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.org.rent.model.Car"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Results</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.card { transition: 0.3s; }
.card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.15); }
.btn-book { background-color: #e67e22; color: white; border: none; }
.btn-book:hover { background-color: #cf6a15; }
</style>
</head>
<body>
<div class="container my-5">
    <h2 class="text-center mb-4">Search Results</h2>
    <div class="row g-4">
        <%
            List<Car> cars = (List<Car>) request.getAttribute("cars");
            if (cars == null || cars.isEmpty()) {
        %>
            <div class="alert alert-warning text-center w-100">No cars found matching your criteria.</div>
        <%
            } else {
                for (Car car : cars) {
        %>
        <div class="col-md-4">
            <div class="card">
                <img src="<%= request.getContextPath() %>/<%= car.getImage() %>" class="card-img-top" alt="<%= car.getName() %>" style="height:200px; object-fit:cover;">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= car.getName() %></h5>
                    <p class="card-text">Brand: <%= car.getBrand() %></p>
                    <p class="card-text">Type: <%= car.getType() %></p>
                    <p class="card-text">₹<%= car.getPricePerDay() %> / day</p>

                    <!-- POST form for booking -->
                    <form action="<%= request.getContextPath() %>/BookingServlet" method="post">
                        <input type="hidden" name="carId" value="<%= car.getId() %>">
                        <input type="hidden" name="price" value="<%= car.getPricePerDay() %>">
                        <button type="submit" class="btn btn-book w-100">Book Now</button>
                    </form>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
