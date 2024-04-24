/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.*;
import java.util.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class login extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    private static int count = 1;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        PreparedStatement pstmt = null;
        String databaseURL = "jdbc:derby://localhost:1527/assignment14";
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        MessageDigest digest;
        String encodedPassword = "";
        try {
            digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(pwd.getBytes(StandardCharsets.UTF_8));
            encodedPassword = Base64.getEncoder().encodeToString(hash);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        try {
            Connection connection = DriverManager.getConnection(databaseURL);
            PreparedStatement stm = connection.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ? ");
            stm.setString(1,username);
            stm.setString(2,encodedPassword);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int usertype = Integer.parseInt(rs.getString("type_ID"));
                if(usertype==3){
                    Query query = em.createNamedQuery("Users.findAccount");
                    query.setParameter("username",username);
                    query.setParameter("password",encodedPassword);
                    List<Users> user = query.getResultList();
                    Users customer = user.get(0);
                    session.setAttribute("customer",customer);
                    response.sendRedirect(request.getContextPath()+"/Customer/home.jsp ");
                }else if(usertype==1||usertype==2){
                    Query query = em.createNamedQuery("Orders.findAll");
                    List<Orders> order = query.getResultList();
                    Query query2 = em.createNamedQuery("Feedbacklog.countAll");
                    int feedbackCount = Integer.parseInt(query2.getSingleResult().toString());
                    session.setAttribute("feedbackcount",feedbackCount);
                    Query query3 = em.createNamedQuery("Orders.countAll");
                    int orderCount = Integer.parseInt(query3.getSingleResult().toString());
                    Query query4 = em.createNamedQuery("Users.countAll");
                    int userCount = Integer.parseInt(query4.getSingleResult().toString());
                    session.setAttribute("userCount",userCount);
                    session.setAttribute("feedbackCount",orderCount);
                    session.setAttribute("orderCount",orderCount);
                    session.setAttribute("OrderRecord",order);
                    response.sendRedirect(request.getContextPath()+"/Staff/dashboard.jsp");
                    
                }
                System.out.println("LoginSuccess");
            }else{
                dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.include(request,response);
                System.out.println(count);
                count++;
                if (count>=5){
                    response.sendRedirect("error.jsp");
                } 
            }   
           
           
        } catch (SQLException ex) {
            out.println("close database");
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
    }
}
