package com.org.rent.servlet;

import java.io.*;
import java.sql.*;
import java.net.URLEncoder;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int carId = Integer.parseInt(request.getParameter("carId"));
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double price = Double.parseDouble(request.getParameter("price"));

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // ✅ Fetch car name for display on payment page
            String carName = "";
            PreparedStatement psCar = conn.prepareStatement("SELECT name FROM cars WHERE id=?");
            psCar.setInt(1, carId);
            ResultSet rsCar = psCar.executeQuery();
            if (rsCar.next()) {
                carName = rsCar.getString("name");
            }
            rsCar.close();
            psCar.close();

            // ✅ Insert booking record
            String sql = "INSERT INTO bookings (car_id, customer_name, email, phone, start_date, end_date, price, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, carId);
            ps.setString(2, customerName);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, startDate);
            ps.setString(6, endDate);
            ps.setDouble(7, price);
            ps.setString(8, "Pending");
            ps.executeUpdate();

            // ✅ Get booking ID
            rs = ps.getGeneratedKeys();
            int bookingId = 0;
            if (rs.next()) bookingId = rs.getInt(1);

            // ✅ Redirect to payment page with all required details
            String redirectURL = "payment.jsp?bookingId=" + bookingId
                    + "&carName=" + URLEncoder.encode(carName, "UTF-8")
                    + "&customerName=" + URLEncoder.encode(customerName, "UTF-8")
                    + "&email=" + URLEncoder.encode(email, "UTF-8")
                    + "&price=" + URLEncoder.encode(String.valueOf(price), "UTF-8");

            response.sendRedirect(redirectURL);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        } finally {
            // ✅ Close resources safely
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
