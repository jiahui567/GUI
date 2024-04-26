/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;
import java.security.MessageDigest;
import java.util.*;
import entity.*;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import java.lang.System.Logger.Level;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Logger;


/**
 *
 * @author User
 */
public class updateStaffPassword extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateStaffPassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStaffPassword at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();
            Users staff = (Users) session.getAttribute("staff");
            String userPassword = staff.getPassword(); 
            int userID = staff.getUserId();
        
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
                        session.setAttribute("staff", userDetail);
                        RequestDispatcher rd = request.getRequestDispatcher("Staff/setting.jsp");
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
