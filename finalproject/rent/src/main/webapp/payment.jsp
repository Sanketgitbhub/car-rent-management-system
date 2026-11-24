<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Rental Payment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
    .payment-card { border-radius: 1rem; overflow: hidden; }
    .header { background-color: #0d6efd; color: white; padding: 1.5rem; display: flex; align-items: center; }
    .form-control:focus, .form-select:focus { border-color: #0d6efd; box-shadow: 0 0 0 0.25rem rgba(13,110,253,0.25); }
    .btn-primary { transition: transform 0.2s ease-in-out; font-weight: bold; }
    .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    
    
    
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
<body class="d-flex align-items-center justify-content-center min-vh-100">

<%
    String carName = request.getParameter("carName");
    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    String price = request.getParameter("price");
%>

<div class="container my-5">
  <div class="card payment-card shadow-lg mx-auto" style="max-width:800px;">

    <!-- Header -->
    <div class="header">
        <i class="bi bi-credit-card-2-front fs-1 me-3"></i>
        <div>
            <h3 class="mb-1 fw-bold text-white">Secure Payment</h3>
            <p class="mb-0">Complete your booking for <strong><%= (carName != null ? carName : "Selected Car") %></strong></p>
        </div>
    </div>

    <!-- Payment Form -->
    <div class="card-body p-4 p-md-5">
        <h4 class="mb-4 text-primary fw-semibold border-bottom pb-2"><i class="bi bi-lock-fill"></i> Payment Information</h4>

        <form action="PaymentServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="carName" value="<%= carName %>">
            <input type="hidden" name="customerName" value="<%= customerName %>">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="price" value="<%= price %>">

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-person-badge-fill"></i> Name on Card</label>
                    <input type="text" name="cardName" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-credit-card-fill"></i> Card Number</label>
                    <input type="text" name="cardNumber" maxlength="16" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-calendar-event-fill"></i> Expiry Date</label>
                    <input type="month" name="expiryDate" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label"><i class="bi bi-shield-lock-fill"></i> CVV</label>
                    <input type="password" name="cvv" maxlength="3" class="form-control" required>
                </div>
            </div>

            <div class="border rounded p-3 mb-4 bg-light">
                <p class="mb-1 fw-semibold text-secondary">Amount to Pay:</p>
                <h3 class="text-success mb-0">₹<%= (price != null ? price : "0.00") %></h3>
            </div>

            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="terms" required>
                <label class="form-check-label" for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
            </div>

            <button type="submit" class="btn btn-primary btn-lg w-100 shadow">
                <i class="bi bi-lock-fill"></i> Pay Securely Now
            </button>
        </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
