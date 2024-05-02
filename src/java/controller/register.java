/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;
import java.io.IOException;
import java.io.PrintWriter;
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

public class register extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password_2 = request.getParameter("password_2");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String ageS = request.getParameter("age");
            int age = Integer.parseInt(ageS);
            String phone =request.getParameter("phone");
            MessageDigest digest;
            String encryption = "";
//            int error = 0;
//            String mail_regex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
//            String phone_regex = "[\\d]{3}-{0,1}[\\d]{7,8}";
//            if(!email.matches(mail_regex)){
//                String errorMessage = "Invalid email format";
//                request.setAttribute("email",errorMessage);
//                error++;
//            }
//            if(!phone.matches(phone_regex)){
//                String errorMessage = "Invalid phone number";
//                request.setAttribute("phone",errorMessage);
//                error++;
//            }
//            
//            if(password.trim().length()<8){
//                String errorMessage = "At least 8 character for password";
//                request.setAttribute("password",errorMessage);
//                error++;
//            }else{
//                if(password_2.trim().length() < 0){
//                    String errorMessage = "Please confirm your password";
//                    request.setAttribute("password_2", errorMessage);
//                    error++;
//                }else{
//                    if(!password.equals(password_2)){
//                        String errorMessage = "Password does not match";
//                        request.setAttribute("password_2", errorMessage);
//                        error++;
//                    }
//                }
//            }
            
            try {
                digest = MessageDigest.getInstance("SHA-256");
                byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                encryption = Base64.getEncoder().encodeToString(hash);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            PrintWriter out = response.getWriter();
                    
            PreparedStatement pstmt = null;
            String databaseURL = "jdbc:derby://localhost:1527/assignment14";
            RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
            
            try{
                Connection connection = DriverManager.getConnection(databaseURL);
                String sql = "INSERT INTO users(type_id,username,password,fullname,email,address,gender,age,contact_number) VALUES (?,?,?,?,?,?,?,?,?)";
                pstmt = connection.prepareStatement(sql);
                pstmt.setInt(1, 3);
                pstmt.setString(2,username);
                pstmt.setString(3,encryption);
                pstmt.setString(4,name);
                pstmt.setString(5,email);
                pstmt.setString(6,address);
                pstmt.setString(7,gender);
                pstmt.setInt(8,age);
                pstmt.setString(9,phone);


                int rows = pstmt.executeUpdate();
                if(rows>0){
                    System.out.println("create successfully");
                    request.setAttribute("status","success");
                    pstmt = connection.prepareStatement("SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ? ");
                    pstmt.setString(1,username);
                    pstmt.setString(2,encryption);
                    ResultSet rs = pstmt.executeQuery();
                    rs.next();
                    int userid = rs.getInt("USER_ID");
                    pstmt = connection.prepareStatement("INSERT INTO cart(user_id) VALUES (?)");
                    pstmt.setInt(1,userid);
                    pstmt.executeUpdate();
                    response.sendRedirect(request.getContextPath()+"/index.jsp");
                }
                else{
                    request.setAttribute("status","failed");
                    dispatcher = request.getRequestDispatcher("Customer/signup.jsp");
                    dispatcher.include(request,response);
                }
                
            }catch(SQLException ex){
                ex.printStackTrace();
                out.println("fail data");
            }
    }
}
