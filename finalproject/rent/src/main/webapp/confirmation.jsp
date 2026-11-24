<!DOCTYPE html>
<html>
<head>
<title>Booking Confirmed</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container text-center my-5">
  <div class="card shadow-lg p-5 mx-auto" style="max-width:600px;">
    <h3 class="text-success mb-3">✅ Payment Successful!</h3>
    <p>Your booking (ID: <%= request.getParameter("bookingId") %>) has been confirmed.</p>
    <a href="Homepage.jsp" class="btn btn-primary mt-3">Return to Home</a>
  </div>
</div>

</body>
</html>
