<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Rental Booking |  Rentals</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: url('https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&w=1350&q=80') 
                    no-repeat center center/cover;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }

    /* dark overlay for better text visibility */
    body::before {
        content: "";
        position: absolute;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(0,0,0,0.4);
        z-index: 0;
    }

    .booking-card {
        position: relative;
        z-index: 1;
        background-color: #ffffff;
        border-radius: 1rem;
        overflow: hidden;
    }

    .car-header {
        background: linear-gradient(90deg, #0d6efd, #007bff);
        color: white;
        padding: 1.5rem;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }

    .car-header img {
        width: 150px;
        height: 100px;
        border-radius: 10px;
        object-fit: cover;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        margin-right: 1.5rem;
    }

    .form-control:focus, .form-select:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    }

    .btn-success {
        transition: transform 0.2s ease-in-out;
        font-weight: bold;
    }

    .btn-success:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 10px rgba(0,0,0,0.15);
    }

    h4.border-bottom {
        border-color: #0d6efd !important;
    }
</style>
</head>
<body>

<div class="container my-5">
  <div class="card booking-card shadow-lg mx-auto" style="max-width:800px;">
    <%
        String id = request.getParameter("id");
        String name = "Unknown Car", brand = "Unknown Brand", type = "", image = "default.jpg";
        double price = 0.0;

        if (id != null && !id.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentdb", "root", "1234");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM cars WHERE id=?");
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    name = rs.getString("name");
                    brand = rs.getString("brand");
                    type = rs.getString("type");
                    price = rs.getDouble("price_per_day");
                    image = rs.getString("image");
                }
                conn.close();
            } catch(Exception e){
                out.println("<div class='alert alert-danger mb-0'>Database Error: " + e.getMessage() + "</div>");
            }
        }
    %>

    <!-- Car Header -->
    <div class="car-header">
        <img src="<%=request.getContextPath()%>/uploads/<%=image%>"
             onerror="this.onerror=null; this.src='https://placehold.co/150x100/0d6efd/ffffff?text=Car+Image';"
             alt="<%=name%>">
        <div>
            <h3 class="mb-1 text-white fw-bold"><i class="bi bi-car-front-fill"></i> <%= name %></h3>
            <p class="mb-0">Brand: <%= brand %> | Type: <%= type %></p>
             <p class="mb-0 fs-5 fw-semibold">Price per Day: Rs<%= String.format("%.2f", price) %></p>
        </div>
    </div>

    <!-- Booking Form -->
    <div class="card-body p-4 p-md-5">
        <h4 class="mb-4 text-primary fw-semibold border-bottom pb-2"><i class="bi bi-person-badge-fill"></i> Traveler & Trip Information</h4>

        <form action="BookingServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="carId" value="<%= id %>">
            <input type="hidden" name="price" value="<%= price %>">

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-person-fill"></i> Full Name</label>
                    <input type="text" name="customerName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-envelope-fill"></i> Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-telephone-fill"></i> Phone</label>
                    <input type="tel" name="phone" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-people-fill"></i> No. of Persons</label>
                    <input type="number" name="numPeople" min="1" value="1" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-calendar-date-fill"></i> Start Date</label>
                    <input type="date" name="startDate" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-calendar-date-fill"></i> End Date</label>
                    <input type="date" name="endDate" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-geo-alt-fill"></i> Pickup Location</label>
                    <select name="pickupLocation" class="form-select" required>
                        <option value="" disabled selected>Select Pickup Location</option>
                        <option value="DELHI">DELHI</option>
                        <option value="NAGPUR">NAGPUR</option>
                        <option value="NAGAR">NAGAR</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-semibold"><i class="bi bi-geo-alt-fill"></i> Drop Location</label>
                    <select name="dropLocation" class="form-select" required>
                        <option value="" disabled selected>Select Drop Location</option>
                        <option value="PUNE">PUNE</option>
                        <option value="NASHIK">NASHIK</option>
                        <option value="MUMBAI">MUMBAI</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn btn-success btn-lg w-100 shadow">
                <i class="bi bi-credit-card-fill"></i> Proceed to Payment
            </button>
        </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
