package com.org.rent.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.rent.model.Car;  // We'll create this model class below

@WebServlet("/ProductCatalogServlet")
public class ProductCatalogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Car> cars = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT * FROM cars";
            PreparedStatement ps = conn.prepareStatement(sql);
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

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Store car list in request and forward to JSP
        request.setAttribute("carsList", cars);
        request.getRequestDispatcher("admin/productCatalog.jsp").forward(request, response);
    }
}
