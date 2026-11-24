package com.org.rent.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddCarServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_CAR_SQL =
        "INSERT INTO cars (name, brand, type, price_per_day, image) VALUES (?, ?, ?, ?, ?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String type = request.getParameter("type");
        double price = Double.parseDouble(request.getParameter("price"));

        Part filePart = request.getPart("image");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName(); // unique filename

        // Save image to uploads folder inside your project
        String uploadPath = getServletContext().getRealPath("/uploads");

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        filePart.write(uploadPath + File.separator + fileName);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            PreparedStatement ps = conn.prepareStatement(INSERT_CAR_SQL);
            ps.setString(1, name);
            ps.setString(2, brand);
            ps.setString(3, type);
            ps.setDouble(4, price);
            ps.setString(5, fileName);

            ps.executeUpdate();
            ps.close();
            conn.close();

            // ✅ Redirect to Vehicle.jsp instead of productCatalog.jsp
            response.sendRedirect(request.getContextPath() + "/Vehicle.jsp?msg=success");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
