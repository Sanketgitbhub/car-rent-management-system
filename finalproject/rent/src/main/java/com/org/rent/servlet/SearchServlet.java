package com.org.rent.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.org.rent.model.Car;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String brand = request.getParameter("brand");
        String type = request.getParameter("type");
        String priceRange = request.getParameter("priceRange");

        double minPrice = 0;
        double maxPrice = 999999999;

        if ("under20".equals(priceRange)) { maxPrice = 20000; }
        else if ("20to50".equals(priceRange)) { minPrice = 20000; maxPrice = 50000; }
        else if ("above50".equals(priceRange)) { minPrice = 50000; }

        List<Car> cars = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM car_inventory WHERE price_per_day BETWEEN ? AND ?");

        if (brand != null && !brand.isEmpty()) sql.append(" AND LOWER(brand) = ?");
        if (type != null && !type.isEmpty()) sql.append(" AND LOWER(type) = ?");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement ps = con.prepareStatement(sql.toString())) {

                int idx = 1;
                ps.setDouble(idx++, minPrice);
                ps.setDouble(idx++, maxPrice);

                if (brand != null && !brand.isEmpty()) ps.setString(idx++, brand.toLowerCase());
                if (type != null && !type.isEmpty()) ps.setString(idx++, type.toLowerCase());

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Car car = new Car();
                    car.setId(rs.getInt("id"));
                    car.setName(rs.getString("name"));
                    car.setBrand(rs.getString("brand"));
                    car.setType(rs.getString("type"));
                    car.setPricePerDay(rs.getDouble("price_per_day"));
                    car.setImage(rs.getString("image"));
                    cars.add(car);
                }
            }

            request.setAttribute("cars", cars);
            request.getRequestDispatcher("searchResults.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
