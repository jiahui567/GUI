/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.*;
import entity.UserType;
import entity.Users;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Isaacweng
 */
public class Filter extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    
    
   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        String action = request.getParameter("action");
        
        if(action.equals("Role")){
            
            int role = Integer.parseInt(request.getParameter("Role"));
            
            if(role == 0){
                Query query = em.createNamedQuery("Users.findAll");
                List<Users> users = query.getResultList();
                if(users != null){
                    session.setAttribute("adminList",users);
                }
                response.sendRedirect(request.getContextPath()+"/Staff/editstaff.jsp");
            }else{
                UserType user2 = new UserType(role);
                Query query = em.createNamedQuery("Users.findByUserType").setParameter("typeId", user2);
                List<Users> users = query.getResultList();
                session.setAttribute("adminList",users);
                response.sendRedirect(request.getContextPath()+"/Staff/editstaff.jsp?Role="+user2.getTypeId());
            }
        }else if(action.equals("Product")){
 
            int product = Integer.parseInt(request.getParameter("Product"));
            if(product == 0){
                Query query = em.createNamedQuery("Products.findAll");
                List<Products> products = query.getResultList();
                session.setAttribute("productList",products);
                response.sendRedirect(request.getContextPath()+"/Staff/productAdmin.jsp");
            }else{
                Category category = new Category(product);
                Query query = em.createNamedQuery("Products.findByCategory").setParameter("categoryId", category);
                List<Products> products = query.getResultList();
                session.setAttribute("productList",products);
                response.sendRedirect(request.getContextPath()+"/Staff/productAdmin.jsp");
            }
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
