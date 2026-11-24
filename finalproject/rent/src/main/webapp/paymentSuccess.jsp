<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Success</title>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5">
  <div class="card p-4 shadow-lg mx-auto text-center" style="max-width:500px;">
    <h2 class="text-success">Payment Successful!</h2>
    
    <a href="Homepage.jsp" class="btn btn-primary mt-3">Back to Home</a>
  </div>
</div>

</body>
</html>
