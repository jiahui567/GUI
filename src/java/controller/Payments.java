/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.*;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Random;

/**
 *
 * @author User_01
 */
public class Payments extends HttpServlet {

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
            out.println("<title>Servlet Payments</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Payments at " + request.getContextPath() + "</h1>");
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
        try {
            Users user = (Users) session.getAttribute("customer");
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            double totalamount = Double.parseDouble(request.getParameter("totalAmount"));
            PaymentMethod paymentmethod = em.find(PaymentMethod.class, Integer.parseInt(request.getParameter("paymentMethod")));
            Cart cart = em.find(Cart.class, cartId);
            List<CartItem> cartItem = cart.getCartItemList();
            utx.begin();
            Orders order = new Orders(em.find(OrderStatus.class, 1), user, request.getParameter("address"));
            em.persist(order);
            em.flush();
            for (CartItem item : cartItem) {
                OrderItem orderItem = new OrderItem(item.getQuantity(), order, em.find(Products.class, item.getProductid().getProductId()));
                em.persist(orderItem);
            }
            em.flush();
            Payment userPayment = new Payment(totalamount, order, paymentmethod);
            em.persist(userPayment);
            em.flush();
            for (CartItem item : cartItem) {
                CartItem remove = em.find(CartItem.class,item.getCartItemid());
               em.remove(remove);
            }
            if (totalamount >= 1000) {
            Random random = new Random();

            String promoteCode = random.ints(97, 123)
            .limit(10)
            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
            .toString();
            
            if(request.getParameter("coupon")!= null){
                Promotion usedPromotion = em.find(Promotion.class,Integer.parseInt(request.getParameter("coupon")));
                usedPromotion.setStatus("Used");
                em.merge(usedPromotion);
                em.flush();
            }
            
            Promotion userPromotion = new Promotion(promoteCode,user,80,800,"Unused");
            em.persist(userPromotion);
            }else if(totalamount >= 500){
            Random random = new Random();

            String promoteCode = random.ints(97, 123)
            .limit(10)
            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
            .toString();
            Promotion userPromotion = new Promotion(promoteCode,user,40,400,"Unused");
            em.persist(userPromotion);
            }
            utx.commit();
            session.setAttribute("coupon",null);
            session.setAttribute("couponValid",null);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        response.sendRedirect("Customer/home.jsp");
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
