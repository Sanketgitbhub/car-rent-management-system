package com.org.rent.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.org.rent.model.Car;

public class CarDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb"; // Update DB
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String SELECT_ALL_CARS = "SELECT * FROM cars"; // Table 'cars'

    public CarDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load driver
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                String type = rs.getString("type");
                double price = rs.getDouble("price_per_day");
                String image = rs.getString("image");

                cars.add(new Car(id, name, brand, type, price, image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }
}
