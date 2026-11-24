package com.org.rent.servlet;

import java.io.IOException;
import java.util.List;

import com.org.rent.dao.CarDao;
import com.org.rent.model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleServlet")
public class VehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all cars from DAO
        CarDao dao = new CarDao();
        List<Car> carList = dao.getAllCars();

        // Set as request attribute
        request.setAttribute("carList", carList);

        // Forward to JSP
        request.getRequestDispatcher("vehicle.jsp").forward(request, response);
    }
}
