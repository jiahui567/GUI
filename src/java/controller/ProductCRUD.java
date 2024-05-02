/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Category;
import entity.Products;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.transaction.UserTransaction;
import java.io.InputStream;
import java.util.List;

/**
 *
 * @author User_01
 */
@MultipartConfig
public class ProductCRUD extends HttpServlet {
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
        String userType = (String) session.getAttribute("userType");
        String action = request.getParameter("action");
        if(userType.equals("staff")){
            switch (action) {
                case "add":
                    addProduct(request);
                    getProduct(request);
                    response.sendRedirect("Staff/productAdmin.jsp");
                    break;
                case "edit":
                    editProduct(request);
                    getProduct(request);
                    response.sendRedirect("Staff/productAdmin.jsp");
                    break;
                case "delete":
                    deleteProduct(request);
                    getProduct(request);
                    response.sendRedirect("Staff/productAdmin.jsp");
                    break;
                case "get":
                    getProduct(request);
                    response.sendRedirect("Staff/productAdmin.jsp");
                    break;
                default:
                    break;
            }
        }else{
            custGetProduct(request);
            response.sendRedirect(request.getContextPath()+"/Customer/product.jsp");
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
    
    
    private void addProduct(HttpServletRequest request) throws IOException, ServletException{
    
        String productName = request.getParameter("productName");
        int category = Integer.parseInt(request.getParameter("category"));
        String description = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        int stock = Integer.parseInt(request.getParameter("stockCount"));
        Part filePart = request.getPart("imageFile");
        InputStream fileContent = filePart.getInputStream();
        byte[] photoByte = fileContent.readAllBytes();
        Category cat = new Category();
        try{
            
            Products product = new Products();
            if(category == 99){
            utx.begin();
            cat.setCatName(request.getParameter("newCategory"));
            cat.setDescription(request.getParameter("newCategoryDesc"));
            em.persist(cat);
            utx.commit();
            }else{
            cat = new Category(category);
            }
            
            product.setProductName(productName);
            product.setCategoryId(cat);
            product.setDescription(description);
            product.setPrice(price);
            product.setStockCount(stock);
            product.setImage(photoByte);
            utx.begin();
            em.persist(product);
            System.out.println("Success add product");
            request.setAttribute("status","success");
            utx.commit();
            
            //create image for the product
//            utx.begin();
//            ImageTable image = new ImageTable();
//            image.setImage(photoByte);
//            image.setProductId(product);
//            em.persist(image);
//            utx.commit();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }

    }

    private void editProduct(HttpServletRequest request){
    String productName = request.getParameter("productName");
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("price"));
        int STOCK_COUNT = Integer.parseInt(request.getParameter("STOCK_COUNT"));
        String description = request.getParameter("description");
        int category = Integer.parseInt(request.getParameter("category"));
//          String IMAGE = request.getParameter(Image);
        Products productDetails = em.find(Products.class,productId);
        HttpSession session = request.getSession();
        try {
            if(productDetails!=null){
                    productDetails.setProductName(productName);
                    productDetails.setStockCount(STOCK_COUNT);
                    productDetails.setPrice(price);
                    productDetails.setDescription(description);
                    Category type = new Category(category);
                    productDetails.setCategoryId(type);
                
                    utx.begin();
                    em.merge(productDetails);
                    utx.commit();
                }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    
    }

    private void deleteProduct(HttpServletRequest request){
            int productId = Integer.parseInt(request.getParameter("productId"));
            Products prodDetail = em.find(Products.class,productId);
            if(prodDetail != null){
                try{
                    utx.begin();
                    Products entity = em.merge(prodDetail);
                    em.remove(entity);
                    utx.commit();
                    System.out.println("siccess");
                }catch(Exception ex){
                    System.out.println(ex.getMessage());
                }
            }
    }

    private void getProduct(HttpServletRequest request){
        HttpSession session = request.getSession();
        try{
            Query query = em.createNamedQuery("Products.findAll");
            List<Products> prod = query.getResultList();
            session.setAttribute("productList",prod);
            
            query = em.createNamedQuery("Category.findAll");
            List<find_Category> category = query.getResultList();
            session.setAttribute("categoryList",category);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
    }
    
    private void custGetProduct(HttpServletRequest request){
            HttpSession session = request.getSession();
            Query query = em.createNamedQuery("Products.findAll");
            List<Products> prod = query.getResultList();
            session.setAttribute("productList",prod);
    }
}
