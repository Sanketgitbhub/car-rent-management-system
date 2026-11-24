<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.NumberFormat" %> 
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Catalog | Admin Panel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: #f4f6f9;
    margin: 0;
    overflow-x: hidden;
}

/* SIDEBAR */
.sidebar {
    width: 250px;
    height: 100vh;
    background: #212529;
    position: fixed;
    top: 0;
    left: 0;
    color: #fff;
    transition: all 0.3s ease;
    z-index: 1050;
}
.sidebar h4 {
    text-align: center;
    padding: 20px 0;
    background-color: #343a40;
    margin-bottom: 0;
    font-weight: 600;
}
.sidebar a {
    display: block;
    padding: 12px 20px;
    color: #adb5bd;
    text-decoration: none;
    font-size: 15px;
    transition: 0.2s;
}
.sidebar a:hover,
.sidebar a.active {
    background-color: #0d6efd;
    color: #fff;
}
.sidebar a i {
    margin-right: 10px;
}

/* TOGGLE BUTTON FOR MOBILE */
#sidebarToggle {
    display: none;
    position: fixed;
    top: 15px;
    left: 15px;
    background: #0d6efd;
    color: #fff;
    border: none;
    border-radius: 6px;
    padding: 8px 12px;
    z-index: 1100;
}

/* CONTENT */
.content {
    margin-left: 250px;
    padding: 30px;
    transition: margin-left 0.3s ease;
}
.card {
    border: none;
    border-radius: 14px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    overflow: hidden;
}
.card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 30px rgba(0,0,0,0.12);
}
.card img {
    height: 220px;
    object-fit: cover;
}
.card-title {
    font-weight: 600;
    color: #212529;
}
.card-brand {
    font-size: 0.9rem;
    color: #6c757d;
    margin-bottom: 1rem;
}
.card-price {
    color: #198754;
    font-weight: 700;
    font-size: 1.3rem;
}
.card-price-label {
    font-weight: 400;
    font-size: 0.9rem;
    color: #6c757d;
}
.btn-sm {
    border-radius: 8px;
}

/* RESPONSIVENESS */
@media (max-width: 992px) {
    .content {
        margin-left: 0;
        padding: 20px;
    }
    .sidebar {
        left: -250px;
    }
    .sidebar.active {
        left: 0;
    }
    #sidebarToggle {
        display: block;
    }
}
</style>
</head>
<body>

<!-- Sidebar Toggle Button -->
<button id="sidebarToggle"><i class="bi bi-list"></i></button>

<%
String msg = request.getParameter("msg");
if (msg != null) {
    String alertType = "info";
    String alertText = "";

    switch (msg) {
        case "added":
            alertType = "success";
            alertText = "Car added successfully!";
            break;
        case "updated":
            alertType = "primary";
            alertText = "Car details updated successfully!";
            break;
        case "deleted":
            alertType = "danger";
            alertText = "Car deleted successfully!";
            break;
        default:
            alertType = "secondary";
            alertText = "Operation completed.";
    }
%>
    <div class="alert alert-<%=alertType%> alert-dismissible fade show mt-3 text-center" role="alert"
         style="max-width: 600px; margin: 0 auto;">
        <%=alertText%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
}
%>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <h4>Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="addCar.jsp"><i class="bi bi-plus-square"></i> Add Car</a>
    <a href="productCatalog.jsp" class="active"><i class="bi bi-car-front"></i> Product Catalog</a>
    <a href="viewMessages.jsp"><i class="bi bi-envelope"></i> Contact Messages</a>
    <hr class="text-secondary">
</div>

<!-- Main Content -->
<div class="content">
    <h2 class="text-center mb-4">Available Cars</h2>
    <div class="row g-4">
        <%
        String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
        String jdbcUsername = "root";
        String jdbcPassword = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM cars");

            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                String type = rs.getString("type");
                double price = rs.getDouble("price_per_day");
                String image = rs.getString("image");

                String formattedPrice = currencyFormatter.format(price);
        %>

        <!-- Responsive Card -->
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
            <div class="card h-100">
                <img src="<%=request.getContextPath()%>/uploads/<%=image%>" class="card-img-top" alt="<%=name%>">
                <div class="card-body d-flex flex-column">
                    <div>
                        <h5 class="card-title"><%=name%></h5>
                        <p class="card-brand"><%=brand%></p>
                        <ul class="list-group list-group-flush mb-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                Type:
                                <span class="badge bg-primary rounded-pill"><%=type%></span>
                            </li>
                        </ul>
                    </div>
                    <div class="mt-auto">
                        <div class="mb-3">
                            <span class="card-price">1000Rs.</span>
                            <span class="card-price-label">/ day</span>
                        </div>
                        <div class="d-flex gap-2">
                            <a href="<%=request.getContextPath()%>/admin/updateCar.jsp?id=<%=id%>"
                               class="btn btn-sm btn-outline-warning flex-fill">
                               <i class="bi bi-pencil-square"></i> Update
                            </a>
                            <a href="<%=request.getContextPath()%>/DeleteCarServlet?id=<%=id%>"
                               class="btn btn-sm btn-outline-danger flex-fill"
                               onclick="return confirm('Are you sure you want to delete <%=name%>?');">
                               <i class="bi bi-trash"></i> Delete
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.getElementById('sidebarToggle').addEventListener('click', function() {
    document.getElementById('sidebar').classList.toggle('active');
});
</script>
</body>
</html>
