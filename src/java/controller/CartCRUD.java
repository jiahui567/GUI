/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Cart;
import entity.CartItem;
import entity.Products;
import entity.Users;
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
import java.util.List;

/**
 *
 * @author Isaacweng
 */
public class CartCRUD extends HttpServlet {

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
        String function = request.getParameter("function");
        switch (function) {
            case "editQuantity":
                String action = request.getParameter("action");
                System.out.println(action);
                if (action.equals("minus") || action.equals("inc")) {
                    updateCart(request);
                } else if (action.equals("update")) {
                    update(request);
                }
                getCartItem(request,response);
                break;
            case "add":
                addToCart(request);
                response.sendRedirect(request.getContextPath()+"/ProductCRUD?action=get");
                break;
            case "delete":
                deleteCartItem(request);
                getCartItem(request,response);
                break;
            case "get":
                getCartItem(request,response);
                break;

        }
    }

    private void update(HttpServletRequest request)
            throws ServletException, IOException {
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        System.out.println(qty);
        HttpSession session = request.getSession();
        try {
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class, cartitem);
            itemDetail.setQuantity(qty);
            em.merge(itemDetail);
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void updateCart(HttpServletRequest request)
            throws ServletException, IOException {
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        try {
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class, cartitem);
            if (action.equals("minus")) {
                itemDetail.decreaseQuantity();
            } else if (action.equals("inc")) {
                itemDetail.increaseQuantity();
            }
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Customer/cart.jsp");
//        dispatcher.include(request, response);  
    }

    private void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productID = Integer.parseInt(request.getParameter("product"));
        Products prod = em.find(Products.class, productID);
        Users customer = (Users) session.getAttribute("customer");
        Query query = em.createNamedQuery("Cart.findByUserId");
        query.setParameter("userId", customer);
        Cart cart = (Cart) query.getSingleResult();
        try {
            utx.begin();
            CartItem cartItem = new CartItem();
            cartItem.setQuantity(quantity);
            cartItem.setProductid(prod);
            cartItem.setCartId(cart);
            em.persist(cartItem);
            utx.commit();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void getCartItem(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Users customer = (Users) session.getAttribute("customer");
        Query query = em.createNamedQuery("Cart.findByUserId");
        query.setParameter("userId", customer);
        Cart cart = (Cart) query.getSingleResult();
        query = em.createNamedQuery("CartItem.findByCartId");
        query.setParameter("cartId", cart);
        List<CartItem> cartItem = query.getResultList();
        session.setAttribute("cart", cartItem);
        response.sendRedirect("Customer/cart.jsp#start");
    }

    private void deleteCartItem(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        CartItem cartItem = em.find(CartItem.class, id);
        if (cartItem != null) {
            try {
                utx.begin();
                CartItem entity = em.merge(cartItem);
                em.remove(entity);
                utx.commit();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
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
=======
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Cart;
import entity.CartItem;
import entity.Products;
import entity.Users;
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
import java.util.List;

/**
 *
 * @author Isaacweng
 */
public class CartCRUD extends HttpServlet {

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
        String function = request.getParameter("function");
        switch (function) {
            case "editQuantity":
                String action = request.getParameter("action");
                System.out.println(action);
                if (action.equals("minus") || action.equals("inc")) {
                    updateCart(request);
                } else if (action.equals("update")) {
                    update(request);
                }
                getCartItem(request,response);
                break;
            case "add":
                addToCart(request);
                response.sendRedirect(request.getContextPath()+"/ProductCRUD?action=get");
                break;
            case "delete":
                deleteCartItem(request);
                getCartItem(request,response);
                break;
            case "get":
                getCartItem(request,response);
                break;

        }
    }

    private void update(HttpServletRequest request)
            throws ServletException, IOException {
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        System.out.println(qty);
        HttpSession session = request.getSession();
        try {
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class, cartitem);
            itemDetail.setQuantity(qty);
            em.merge(itemDetail);
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void updateCart(HttpServletRequest request)
            throws ServletException, IOException {
        int cartitem = Integer.parseInt(request.getParameter("cartItem"));
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        try {
            utx.begin();
            CartItem itemDetail = em.find(CartItem.class, cartitem);
            if (action.equals("minus")) {
                itemDetail.decreaseQuantity();
            } else if (action.equals("inc")) {
                itemDetail.increaseQuantity();
            }
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Customer/cart.jsp");
//        dispatcher.include(request, response);  
    }

    private void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productID = Integer.parseInt(request.getParameter("product"));
        Products prod = em.find(Products.class, productID);
        Users customer = (Users) session.getAttribute("customer");
        Query query = em.createNamedQuery("Cart.findByUserId");
        query.setParameter("userId", customer);
        Cart cart = (Cart) query.getSingleResult();
        try {
            utx.begin();
            CartItem cartItem = new CartItem();
            cartItem.setQuantity(quantity);
            cartItem.setProductid(prod);
            cartItem.setCartId(cart);
            em.persist(cartItem);
            utx.commit();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void getCartItem(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Users customer = (Users) session.getAttribute("customer");
        Query query = em.createNamedQuery("Cart.findByUserId");
        query.setParameter("userId", customer);
        Cart cart = (Cart) query.getSingleResult();
        query = em.createNamedQuery("CartItem.findByCartId");
        query.setParameter("cartId", cart);
        List<CartItem> cartItem = query.getResultList();
        session.setAttribute("cart", cartItem);
        response.sendRedirect("Customer/cart.jsp#start");
    }

    private void deleteCartItem(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        CartItem cartItem = em.find(CartItem.class, id);
        if (cartItem != null) {
            try {
                utx.begin();
                CartItem entity = em.merge(cartItem);
                em.remove(entity);
                utx.commit();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
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
