<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentdb", "root", "1234"); 
        ps = conn.prepareStatement("SELECT id, name, email FROM users ORDER BY id DESC");
        rs = ps.executeQuery();
    } catch (Exception e) {
        /* out.println("<div class='alert alert-danger'>Database Error: " + e.getMessage() + "</div>"); */
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard </title>

    <!-- ✅ Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ✅ Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background: #212529;
            position: fixed;
            top: 0;
            left: 0;
            color: #fff;
        }

        .sidebar h4 {
            text-align: center;
            padding: 20px 0;
            background-color: #343a40;
            margin-bottom: 0;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #adb5bd;
            text-decoration: none;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #495057;
            color: #fff;
        }

        .content {
            margin-left: 250px;
            padding: 30px;
        }

        .topbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <!-- ✅ Sidebar -->
    <div class="sidebar">
        <h4>Admin Panel</h4>
        <a href="dashboard.jsp" class="active"><i class="bi bi-speedometer2"></i> Dashboard</a>
        <a href="addCar.jsp"><i class="bi bi-plus-square"></i> Add Car</a>
        <a href="productCatalog.jsp"><i class="bi bi-car-front"></i> Product Catalog</a>
        <a href="viewMessages.jsp"><i class="bi bi-envelope"></i> Contact Messages</a>
        <hr class="text-secondary">
    </div>

    <!-- ✅ Main content -->
    <div class="content">
        <div class="topbar">
            <h5>Welcome, Admin</h5>
        </div>

        <div class="container mt-4">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card p-4 text-center">
                        <i class="bi bi-plus-square fs-1 text-primary"></i>
                        <h5 class="mt-3">Add New Car</h5>
                        <p class="text-muted">Add new cars to your catalog easily.</p>
                        <a href="addCar.jsp" class="btn btn-outline-primary btn-sm">Go</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card p-4 text-center">
                        <i class="bi bi-car-front fs-1 text-success"></i>
                        <h5 class="mt-3">Manage Catalog</h5>
                        <p class="text-muted">Edit, view, or remove car listings.</p>
                        <a href="productCatalog.jsp" class="btn btn-outline-success btn-sm">Go</a>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card p-4 text-center">
                        <i class="bi bi-envelope fs-1 text-warning"></i>
                        <h5 class="mt-3">View Messages</h5>
                        <p class="text-muted">Check customer inquiries and feedback.</p>
                        <a href="viewMessages.jsp" class="btn btn-outline-warning btn-sm">Go</a>
                    </div>
                </div>
            </div>

            <!-- ✅ User Section -->
            <div class="mt-5">
                <h4 class="mb-3">Registered Users</h4>
                <div class="card p-3">
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (rs != null) {
                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("email") %></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
%>
