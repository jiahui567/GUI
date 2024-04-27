<%-- 
    Document   : adminNavBar
    Created on : 27 Mar 2024, 6:33:19 PM
    Author     : User
--%>
<jsp:useBean id="staff" scope="session" class="entity.Users"/>  
<%@page import="entity.Users" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <nav>
        <div class="logo-name">
            <div class="logo-image">
               <img src="images/logo.png" alt="" href="dashboard.jsp">
            </div>

            <a class="logo_name" href="dashboard.jsp">Admin Portal</a>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="dashboard.jsp">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dashboard</span>
                </a></li>
                <li>
                    <a href="<%= request.getContextPath()%>/getEmployee">
                    <!--<a href="editstaff.jsp">-->
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name" >Staff</span>
                </a></li>
                <li><a href="report.jsp">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Report</span>
                </a></li>
                <li><a href="<%= request.getContextPath()%>/getProduct">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Product </span>
                </a></li>
                <li><a href="orderstatus.jsp">
                    <i class="uil uil-share"></i>
                    <span class="link-name">Order Status</span>
                </a></li>
                <li><a href="<%= request.getContextPath()%>/getFeedbacklog">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">FeedBack</span>
                </a></li>
                <li><a href="setting.jsp">
                    <i class="uil uil-setting"></i>
                    <span class="link-name">Setting</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="<%= request.getContextPath()%>/logout">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>
    </body>
</html>
<style>
    a{
        text-decoration: none !important;
    }
</style>
