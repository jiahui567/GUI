
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
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.UserTransaction;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author naiyen
 */
public class reportGenerate extends HttpServlet {
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
        HttpSession session = request.getSession();
        try{
            Query query = em.createNativeQuery("SELECT SUM(ORDER_ITEM.quantity) AS total,ORDER_ITEM.PRODUCT_ID, sum(ORDER_ITEM.PRICE) as revenue,PRODUCTS.PRODUCT_NAME\n" +
                "FROM ORDER_ITEM \n" +
                "JOIN PRODUCTS ON PRODUCTS.PRODUCT_ID = ORDER_ITEM.PRODUCT_ID JOIN PAYMENT ON PAYMENT.ORDER_ID = ORDER_ITEM.ORDER_ID\n" +
                "WHERE YEAR(PAYMENT.PAYMENT_DATE) = YEAR(CURRENT_DATE) AND MONTH(PAYMENT.PAYMENT_DATE) = MONTH(CURRENT_DATE)\n" +
                "GROUP BY ORDER_ITEM.PRODUCT_ID,PRODUCTS.PRODUCT_NAME\n" +
                "ORDER BY total DESC \n" +
                "FETCH FIRST 10 ROWS ONLY"
            );
            List<Object[]> prod = query.getResultList();
            List<Products> salesMonth = new ArrayList<>();
            for(Object[] row:prod){
                int sum = (int) row[0];
                int id = (int) row[1];
                double revenue = (double) row[2];
                String name = (String) row[3];
                Products topProd = new Products();
                topProd.setStockCount(sum);
                topProd.setProductId(id);
                topProd.setPrice(revenue);
                topProd.setProductName(name);
                salesMonth.add(topProd);
            }
            session.setAttribute("sales",salesMonth);
            response.sendRedirect(request.getContextPath()+"/Staff/report.jsp");
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
