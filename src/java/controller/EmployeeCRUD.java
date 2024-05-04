/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.UserType;
import entity.Users;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import jakarta.transaction.UserTransaction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Isaacweng
 */
public class EmployeeCRUD extends HttpServlet {

    @Resource
    UserTransaction utx;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action.equals("add")) {
            addEmployee(request);
            getEmployee(request);
            response.sendRedirect("Staff/editstaff.jsp");
        } else if (action.equals("edit")) {
            editEmployee(request);
            getEmployee(request);
            response.sendRedirect("Staff/editstaff.jsp");
        } else if (action.equals("delete")) {
            deleteEmployee(request);
            getEmployee(request);
            response.sendRedirect("Staff/editstaff.jsp");
        } else if (action.equals("get")) {
            getEmployee(request);
            response.sendRedirect("Staff/editstaff.jsp");
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
    private void getEmployee(HttpServletRequest request) {
        Query query = em.createNativeQuery("SELECT * FROM USERS", Users.class);
        List<Users> userlist = query.getResultList();
        HttpSession session = request.getSession();
        session.setAttribute("adminList", userlist);
        ServletConfig config = getServletConfig();
        String title = config.getInitParameter("addTitle");
        session.setAttribute("title",title);
    }

    private void deleteEmployee(HttpServletRequest request) {
        int userId = Integer.parseInt(request.getParameter("userID"));

        Users userDetail = em.find(Users.class, userId);
        if (userDetail != null) {
            try {
                utx.begin();
                Users entity = em.merge(userDetail);
                em.remove(entity);
                utx.commit();

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    private void editEmployee(HttpServletRequest request) {
        String name = request.getParameter("fullname");
        int age = Integer.parseInt(request.getParameter("age"));
        String phone = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        int id = Integer.parseInt(request.getParameter("id"));

        Users userDetail = em.find(Users.class, id);
        try {
            if (userDetail != null) {
                userDetail.setFullname(name);
                userDetail.setAge(age);
                userDetail.setEmail(email);
                userDetail.setContactNumber(phone);
                utx.begin();
                em.merge(userDetail);
                utx.commit();
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }

    private void addEmployee(HttpServletRequest request) {

        try {
            utx.begin();
            em.joinTransaction();
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            int age = Integer.parseInt(request.getParameter("age"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
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
            UserType userCategory = new UserType(category);
            Users newUser = new Users(name, age, gender, null , email, phone, username, encryption, userCategory);
            save(newUser);
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        System.out.println("create successfully");
        request.setAttribute("status", "success");

    }

    @Transactional
    public void save(Users user) {
        em.persist(user);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
