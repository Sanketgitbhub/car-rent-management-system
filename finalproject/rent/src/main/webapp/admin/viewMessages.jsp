<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Messages | Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<style>
body{font-family:'Poppins',sans-serif;background:#f4f6f9;margin:0;}
.sidebar{width:250px;height:100vh;background:#212529;position:fixed;top:0;left:0;color:#fff;}
.sidebar h4{text-align:center;padding:20px 0;background-color:#343a40;margin-bottom:0;}
.sidebar a{display:block;padding:12px 20px;color:#adb5bd;text-decoration:none;font-size:15px;transition:0.2s;}
.sidebar a:hover,.sidebar a.active{background-color:#495057;color:#fff;}
.sidebar a i{margin-right:10px;}
.content{margin-left:250px;padding:30px;}
table{background:#fff;border-radius:10px;box-shadow:0 3px 10px rgba(0,0,0,0.1);}
th,td{text-align:center;}
</style>
</head>
<body>

<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="addCar.jsp"><i class="bi bi-plus-square"></i> Add Car</a>
    <a href="productCatalog.jsp"><i class="bi bi-car-front"></i> Product Catalog</a>
    <a href="viewMessages.jsp" class="active"><i class="bi bi-envelope"></i> Contact Messages</a>
    <hr class="text-secondary">
</div>

<div class="content">
    <h3 class="mb-4">Contact Messages</h3>
    <table class="table table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Subject</th>
            </tr>
        </thead>
        <tbody>
        <%
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentdb","root","1234");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM contact_messages");
                while(rs.next()){
        %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("mobile")%></td>
                <td><%=rs.getString("subject")%></td>
            </tr>
        <%
                }
                conn.close();
            }catch(Exception e){ e.printStackTrace(); }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
