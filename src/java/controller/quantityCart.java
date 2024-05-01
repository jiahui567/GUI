/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.*;
import jakarta.annotation.Resource;
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
import jakarta.transaction.UserTransaction;
import java.util.List;

/**
 *
 * @author User
 */
public class quantityCart extends HttpServlet {
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
        if(action.equals("minus")||action.equals("inc")){
            updateCart(request,response);
        }else if(action.equals("update")){
            update(request,response);
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
    private void update(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        HttpSession session = request.getSession();
        try{
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class,cartitem);
            itemDetail.setQuantity(qty);
            utx.commit();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        response.sendRedirect("Customer/cart.jsp");
        
    }
                
    private void updateCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        try{
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class,cartitem);
            if(action.equals("minus")){
                itemDetail.decreaseQuantity();
            }else if(action.equals("inc")){
                itemDetail.increaseQuantity();
            }
            utx.commit();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        response.sendRedirect("Customer/cart.jsp");
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Customer/cart.jsp");
//        dispatcher.include(request, response);  
    }
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
        processRequest(request, response);
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
