<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Car | Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<style>
body {font-family:'Poppins',sans-serif;background:#f4f6f9;margin:0;}
.sidebar{width:250px;height:100vh;background:#212529;position:fixed;top:0;left:0;color:#fff;}
.sidebar h4{text-align:center;padding:20px 0;background-color:#343a40;margin-bottom:0;}
.sidebar a{display:block;padding:12px 20px;color:#adb5bd;text-decoration:none;font-size:15px;transition:0.2s;}
.sidebar a:hover,.sidebar a.active{background-color:#495057;color:#fff;}
.sidebar a i{margin-right:10px;}
.content{margin-left:250px;padding:30px;}
.card{border:none;border-radius:12px;box-shadow:0 3px 10px rgba(0,0,0,0.1);}
.btn-primary{border-radius:8px;}
</style>
</head>
<body>

<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="addCar.jsp" class="active"><i class="bi bi-plus-square"></i> Add Car</a>
    <a href="productCatalog.jsp"><i class="bi bi-car-front"></i> Product Catalog</a>
    <a href="viewMessages.jsp"><i class="bi bi-envelope"></i> Contact Messages</a>
    <hr class="text-secondary">
    
</div>

<div class="content">
    <h3 class="mb-4">Add New Car</h3>
    <div class="card p-4 col-md-6">
       <form action="<%=request.getContextPath()%>/AddCarServlet" method="post" enctype="multipart/form-data">

            <div class="mb-3">
                <label class="form-label">Car Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Car Brand</label>
                <input type="text" class="form-control" name="brand" placeholder="Enter car brand" required>
            </div>
            
           <div class="mb-3">
                <label class="form-label">Car Type</label>
                <select class="form-select" name="type" required>
                <option value="" disabled selected>Select Type</option>
                <option value="Sedan">Sedan</option>
                <option value="Hatchback">Hatchback</option>
                <option value="SUV">SUV</option>
                <option value="Coupe">Coupe</option>
                <option value="Convertible">Convertible</option>
              </select>
          </div>
           
            
            <div class="mb-3">
                <label class="form-label">Price</label>
                <input type="number" class="form-control" name="price" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Image</label>
                <input type="file" class="form-control" name="image" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Add Car</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
