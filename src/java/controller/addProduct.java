/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;

@MultipartConfig
public class addProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String description = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        int stock = Integer.parseInt(request.getParameter("stockCount"));
        Part filePart = request.getPart("imageFile");
        InputStream fileContent = filePart.getInputStream();
        
        String databaseURL = "jdbc:derby://localhost:1527/assignment14";
        PrintWriter out = response.getWriter();
        
        
        try{
            Connection conn = DriverManager.getConnection(databaseURL);
            String query = "INSERT INTO PRODUCTS ( category_ID, product_name, price, stock_count, description, image) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = conn.prepareStatement(query);
            stm.setInt(1,1);
            stm.setString(2, productName);
            stm.setDouble(3, price);
            stm.setInt(4, stock);
            stm.setString(5,description);
            stm.setBinaryStream(6,fileContent);
            int rows = stm.executeUpdate();
            if(rows>0){
                System.out.println("upload success!!!!!");
                response.sendRedirect("productAdmin.jsp");

            }else{
                System.out.println("fail noob shit");
            }


        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
}
