<%-- 
    Document   : feedback
    Created on : 1 Apr 2024, 3:41:51 PM
    Author     : User
--%>
<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feed Back</title>
        <link rel="stylesheet" href="new.css">

      <!----===== Iconscout CSS ===== -->
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
<%
    List<Feedbacklog> logList = (List) session.getAttribute("logList");
%>
    <body>
    <%@ include file="adminNavBar.jsp" %>
    
    <section class="dashboard " >

        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            <!--<img src="images/profile.jpg" alt="">-->
        </div>       
        
        <% for(Feedbacklog log : logList){%>
        <div style="display:flex;flex-direction:column;border-radius:15px;padding:5px;margin-bottom:10px;border:1px solid;border-color:lightgrey;margin-top:5%">
            <div style="display:flex;flex-direction:row;align-items:center;justify-content:space-between">
                <div style="display:flex;flex-direction:column;padding:10px;width:100%">
                        <div style="display:flex;flex-direction:row;padding:10px;width:100%;justify-content: space-between">
                            <div style="font-weight:bold;align-self:flex-start;font-size:16px">
                                <img src="editing.jpg" alt="alt" width="30px"  style="border-radius: 50%"/> <span>@<%= log.getUserId().getFullname()%>&nbsp;</span>
                            </div>
                            <div style="font-weight:bold;align-self:flex-start;font-size:16px">
                                <%= log.getTime()%>
                            </div>
                        </div>
                        
                        <div style="color:#000000;border-top:1px solid;border-right-style:0px;margin-top:5px;margin-bottom:5px;width:100%;color:lightgrey"/>
                        <div style="font-size: 12px;line-height: 1.5;font-weight: bold;color: #000000;padding:10px"><%= log.getComment()%></div>
                    </div>
                </div>

            </div>
        </div>
                    <%}%>
    </body>
    <script>
        const body = document.querySelector("body"),
      modeToggle = body.querySelector(".mode-toggle");
      sidebar = body.querySelector("nav");
      sidebarToggle = body.querySelector(".sidebar-toggle");

let getMode = localStorage.getItem("mode");
if(getMode && getMode ==="dark"){
    body.classList.toggle("dark");
}

let getStatus = localStorage.getItem("status");
if(getStatus && getStatus ==="close"){
    sidebar.classList.toggle("close");
}

modeToggle.addEventListener("click", () =>{
    body.classList.toggle("dark");
    if(body.classList.contains("dark")){
        localStorage.setItem("mode", "dark");
    }else{
        localStorage.setItem("mode", "light");
    }
});

sidebarToggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
    if(sidebar.classList.contains("close")){
        localStorage.setItem("status", "close");
    }else{
        localStorage.setItem("status", "open");
    }
})
    </script>
</html>

