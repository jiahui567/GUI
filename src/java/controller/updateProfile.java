/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
@MultipartConfig
public class updateProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet profile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet profile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override 
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
            int userid = 9;
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            

            Part filePart = request.getPart("profilePic");
            InputStream fileContent = filePart.getInputStream();
            String databaseURL = "jdbc:derby://localhost:1527/assignment14";
            
            
                Connection conn;
        try {
            conn = DriverManager.getConnection(databaseURL);
            String query = "UPDATE USERS SET FULLNAME=?, EMAIL = ?, ADDRESS = ?, CONTACT_NUMBER = ?, PROFILE_PIC = ? WHERE USER_ID = ?";
            PreparedStatement stm = conn.prepareStatement(query);
            stm.setString(1,fullname);
            stm.setString(2,email);
            stm.setString(3,address);
            stm.setString(4,contact);
            stm.setBinaryStream(5,fileContent);
            stm.setInt(6,userid);
            int row = stm.executeUpdate();
            if(row>0){
                System.out.println("successfully edit profile");
            } 
        }catch (SQLException ex) {
            Logger.getLogger(updateProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
                
                        
                
         

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
