<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Cars</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.search-section { background-color: #333; }
.btn-orange { background-color: #ff6600; color: white; border: none; }
.btn-orange:hover { background-color: #e65c00; }
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
                <li class="nav-item mx-2"><a class="nav-link text-white" href="Homepage.jsp#search">Services</a></li>
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

<section class="search-section py-5">
    <div class="container text-center text-white">
        <h2 class="fw-bold">Search Your Best Cars</h2>
        <p class="mb-4">Find your perfect car quickly!</p>

        <form action="SearchServlet" method="get">
            <div class="row justify-content-center g-3">
                <div class="col-md-2 col-6">
                    <select class="form-select" name="brand">
                        <option value="">Any Brand</option>
                        <option value="Toyota">Toyota</option>
                        <option value="BMW">BMW</option>
                        <option value="Mercedes">Mercedes</option>
                        <option value="Maruti">Maruti</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <select class="form-select" name="type">
                        <option value="">Any Type</option>
                        <option value="SUV">SUV</option>
                        <option value="Sedan">Sedan</option>
                        <option value="Hatchback">Hatchback</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <select class="form-select" name="priceRange">
                        <option value="">Price</option>
                        <option value="under20">Under ₹20,000</option>
                        <option value="20to50">₹20,000-₹50,000</option>
                        <option value="above50">Above ₹50,000</option>
                    </select>
                </div>

                <div class="col-md-2 col-6">
                    <button type="submit" class="btn btn-orange w-100">Search Now</button>
                </div>
            </div>
        </form>
    </div>
</section>

</body>
</html>
