<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Car | Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-sm p-4">
        <h4 class="text-danger mb-3">Are you sure you want to delete this car?</h4>
        <form action="<%=request.getContextPath()%>/DeleteCarServlet" method="get">
            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
            <button type="submit" class="btn btn-danger">Yes, Delete</button>
            <a href="productCatalog.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
