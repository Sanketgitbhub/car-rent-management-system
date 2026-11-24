package com.org.rent.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.getWriter().println("<h3 style='color:red;text-align:center;margin-top:50px;'>Error: Car ID is missing!</h3>");
            return;
        }

        int id = Integer.parseInt(idParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Fetch the image name before deleting
            String imageName = null;
            PreparedStatement ps1 = conn.prepareStatement("SELECT image FROM cars WHERE id=?");
            ps1.setInt(1, id);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                imageName = rs.getString("image");
            }
            rs.close();
            ps1.close();

            // Delete the car from database
            PreparedStatement ps2 = conn.prepareStatement("DELETE FROM cars WHERE id=?");
            ps2.setInt(1, id);
            int rows = ps2.executeUpdate();
            ps2.close();
            conn.close();

            // Delete image from uploads folder if exists
            if (rows > 0 && imageName != null && !imageName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + imageName;
                File file = new File(uploadPath);
                if (file.exists()) file.delete();
            }

            // Redirect back to product catalog
            response.sendRedirect(request.getContextPath() + "/ProductCatalogServlet?msg=deleted");


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
