package com.org.rent.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateCarServlet")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
                 maxFileSize = 1024*1024*10,
                 maxRequestSize = 1024*1024*50)
public class UpdateCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/rentdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String type = request.getParameter("type");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Get old image
            String oldImage = null;
            PreparedStatement ps1 = conn.prepareStatement("SELECT image FROM cars WHERE id=?");
            ps1.setInt(1, id);
            ResultSet rs = ps1.executeQuery();
            if(rs.next()){
                oldImage = rs.getString("image");
            }

            // Update query
            PreparedStatement ps2;
            if(fileName != null && !fileName.isEmpty()){
                // Upload new image
                String uploadPath = getServletContext().getRealPath("") + "uploads";
                File uploadDir = new File(uploadPath);
                if(!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + fileName);

                ps2 = conn.prepareStatement(
                    "UPDATE cars SET name=?, brand=?, type=?, price_per_day=?, image=? WHERE id=?"
                );
                ps2.setString(1, name);
                ps2.setString(2, brand);
                ps2.setString(3, type);
                ps2.setDouble(4, price);
                ps2.setString(5, fileName);
                ps2.setInt(6, id);
            } else {
                ps2 = conn.prepareStatement(
                    "UPDATE cars SET name=?, brand=?, type=?, price_per_day=? WHERE id=?"
                );
                ps2.setString(1, name);
                ps2.setString(2, brand);
                ps2.setString(3, type);
                ps2.setDouble(4, price);
                ps2.setInt(5, id);
            }

            int rows = ps2.executeUpdate();

            // Delete old image
            if(rows > 0 && fileName != null && !fileName.isEmpty() && oldImage != null && !oldImage.isEmpty()){
                File oldFile = new File(getServletContext().getRealPath("") + "uploads" + File.separator + oldImage);
                if(oldFile.exists()) oldFile.delete();
            }

            conn.close();
            response.sendRedirect(request.getContextPath() + "/ProductCatalogServlet?msg=updated");


        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red'>Error: "+e.getMessage()+"</h3>");
        }
    }
}
