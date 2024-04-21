/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class addEmployee extends HttpServlet {

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
            out.println("<title>Servlet addEmployee</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addEmployee at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PreparedStatement pstmt = null;
            String databaseURL = "jdbc:derby://localhost:1527/assignment14";
            RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            int category = Integer.parseInt(request.getParameter("category"));
            String password = "default";
            String encryption = "";
            try {
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                 encryption = Base64.getEncoder().encodeToString(hash);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try{
                Connection connection = DriverManager.getConnection(databaseURL);
                String sql = "INSERT INTO users(type_id,username,password,fullname,email,contact_number) VALUES (?,?,?,?,?,?)";
                pstmt = connection.prepareStatement(sql);
                pstmt.setInt(1, category);
                pstmt.setString(2,username);
                pstmt.setString(3,encryption);
                pstmt.setString(4,name);
                pstmt.setString(5,email);
                pstmt.setString(6,phone);


                int rows = pstmt.executeUpdate();
                if(rows>0){
                    System.out.println("create successfully");
                    request.setAttribute("status","success");
                    response.sendRedirect("Staff/editstaff.jsp");
                }
                else{
                    request.setAttribute("status","failed");
                    dispatcher = request.getRequestDispatcher("Customer/signup.jsp");
                    dispatcher.include(request,response);
                }
                
            }catch(SQLException ex){
                ex.printStackTrace();
            }
    }

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
