<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String idParam = request.getParameter("id");
    if(idParam == null || idParam.isEmpty()){
        out.println("<h3 style='color:red; text-align:center;margin-top:50px;'>Error: Car ID is missing! Please go back to Product Catalog.</h3>");
        return; // Stop execution if ID is missing
    }

    int id = Integer.parseInt(idParam);
    String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    String jdbcUsername = "root";
    String jdbcPassword = "1234";

    String name = "", brand = "", type = "", image = "";
    double price = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM cars WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            name = rs.getString("name");
            brand = rs.getString("brand");
            type = rs.getString("type");
            price = rs.getDouble("price_per_day");
            image = rs.getString("image");
        } else {
            out.println("<h3 style='color:red; text-align:center;margin-top:50px;'>Error: Car not found!</h3>");
            return;
        }
        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e){ 
        out.println("<h3 style='color:red; text-align:center;margin-top:50px;'>Database Error: " + e.getMessage() + "</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Car | Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{font-family:'Poppins',sans-serif;background:#f4f6f9;margin:0;}
.sidebar{width:250px;height:100vh;background:#212529;position:fixed;top:0;left:0;color:#fff;}
.sidebar h4{text-align:center;padding:20px 0;background-color:#343a40;margin-bottom:0;}
.sidebar a{display:block;padding:12px 20px;color:#adb5bd;text-decoration:none;font-size:15px;transition:0.2s;}
.sidebar a:hover,.sidebar a.active{background-color:#495057;color:#fff;}
.sidebar a i{margin-right:10px;}
.content{margin-left:250px;padding:30px;}
.form-control, .form-select{border-radius:6px;}
</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="addCar.jsp"><i class="bi bi-plus-square"></i> Add Car</a>
    <a href="productCatalog.jsp" class="active"><i class="bi bi-car-front"></i> Product Catalog</a>
    <a href="viewMessages.jsp"><i class="bi bi-envelope"></i> Contact Messages</a>
    <hr class="text-secondary">
    
</div>

<div class="content">
    <h2 class="mb-4 text-center">Edit Car</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="<%=request.getContextPath()%>/UpdateCarServlet" method="post" enctype="multipart/form-data" class="bg-white p-4 rounded shadow-sm">

                <input type="hidden" name="id" value="<%=id%>">

                <div class="mb-3">
                    <label class="form-label">Car Name</label>
                    <input type="text" class="form-control" name="name" value="<%=name%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Brand</label>
                    <input type="text" class="form-control" name="brand" value="<%=brand%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Type</label>
                    <select class="form-select" name="type" required>
                        <option value="Sedan" <%= "Sedan".equals(type)?"selected":"" %>>Sedan</option>
                        <option value="Hatchback" <%= "Hatchback".equals(type)?"selected":"" %>>Hatchback</option>
                        <option value="SUV" <%= "SUV".equals(type)?"selected":"" %>>SUV</option>
                        <option value="Coupe" <%= "Coupe".equals(type)?"selected":"" %>>Coupe</option>
                        <option value="Convertible" <%= "Convertible".equals(type)?"selected":"" %>>Convertible</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price per Day</label>
                    <input type="number" class="form-control" name="price" value="<%=price%>" step="0.01" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Current Image</label><br>
                    <img src="<%=request.getContextPath()%>/uploads/<%=image%>" alt="<%=name%>" style="height:150px; object-fit:cover; border-radius:8px;">
                </div>

                <div class="mb-3">
                    <label class="form-label">Change Image (Optional)</label>
                    <input type="file" class="form-control" name="image">
                </div>

               <div class="d-grid">
                 <button type="submit" class="btn btn-primary btn-block">
                 <i class="bi bi-save"></i> Update Car
                 </button>
              </div>

					
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
