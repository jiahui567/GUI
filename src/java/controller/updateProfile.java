/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import entity.*;
import java.util.*;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
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
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
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
         String action = request.getParameter("action");
        if(action.equals("password")){
            doPostPassword(request,response);
        }else if(action.equals("profile")){
            doPostProfile(request,response);
        }else{
            System.out.println("do something idk error in profile page");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void doPostPassword (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
            Users customer = (Users) session.getAttribute("customer");
            String userPassword = customer.getPassword(); 
            int userID = customer.getUserId();
        
            String password = request.getParameter("password");
            String newPassword = request.getParameter("newpassword");
            String confirmPassword = request.getParameter("confirmpassword");
            MessageDigest digest;
            String encodedPassword = "";
            String encodedPassword2 = "";
            try {
                digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(newPassword.getBytes(StandardCharsets.UTF_8));
                encodedPassword = Base64.getEncoder().encodeToString(hash);
                byte[] hash2 = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                encodedPassword2 = Base64.getEncoder().encodeToString(hash2);
            } catch (NoSuchAlgorithmException ex) {
                System.out.println(ex.getMessage());
            }
        
            if(encodedPassword2.equals(userPassword)){
                try{
                    Query query = em.createNamedQuery("Users.findByUserId");
                    query.setParameter("userId",userID);
                    List<Users> user = query.getResultList();
                    Users userDetail=user.get(0);
                    
                    if(userDetail!=null){
                        userDetail.setPassword(encodedPassword);
                        utx.begin();
                        em.merge(userDetail);
                        utx.commit();
                        session.setAttribute("customer", userDetail);
                        RequestDispatcher rd = request.getRequestDispatcher("Customer/profile.jsp");
                        rd.forward(request, response);
                    }
                    
                }catch(Exception ex){
                    System.out.println("error at finding user");
                }
            }else{
                String error = "Password not match. Please enter correct password.";
                request.setAttribute("passworderror",error);
                response.sendRedirect(request.getContextPath()+"/Staff/setting.jsp#settings");
            }
    }
    
    protected void doPostProfile (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            String action = request.getParameter("action");
            Part filePart = request.getPart("profilePic");
            InputStream fileContent = filePart.getInputStream();
            byte[] photoByte = fileContent.readAllBytes();
            HttpSession session = request.getSession();
            Users customer = (Users) session.getAttribute("customer");
            int userID = customer.getUserId();
            
            try{
                Query query = em.createNamedQuery("Users.findByUserId");
                query.setParameter("userId",userID);
                List<Users> user = query.getResultList();
                Users userDetail = user.get(0);
                if(userDetail!=null){
                    userDetail.setFullname(fullname);
                    userDetail.setAddress(address);
                    userDetail.setEmail(email);
                    userDetail.setContactNumber(contact);
                    userDetail.setProfilePic(photoByte);
                    utx.begin();
                    em.merge(userDetail);
                    utx.commit();
                    session.setAttribute("customer", userDetail);
                    RequestDispatcher rd = request.getRequestDispatcher("Customer/profile.jsp");
                    rd.forward(request, response);
                }
            }catch(Exception ex){
                System.out.println(ex.getMessage());
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
