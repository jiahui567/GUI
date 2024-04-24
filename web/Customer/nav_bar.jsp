<%-- 
    Document   : nav_bar
    Created on : 9 Mar 2024, 1:16:49 PM
    Author     : User
--%>
<jsp:useBean id="customer" scope="session" class="entity.Users"/>  
<%@page import="entity.Users" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
            <div class="container">
                <a class="navbar-brand" href="home.jsp"><img src="images/hankea.png" style="width:4.5rem"></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                            <li class="nav-item ">
                                    <a class="nav-link" href="home.jsp">Home</a>
                            </li>
                            <li id="shop"><a class="nav-link" href="product.jsp">Shop</a></li>
                            <li id="aboutus"><a class="nav-link" href="aboutUs.jsp">About us</a></li>
                            <li id="service"><a class="nav-link" href="service.jsp">Services</a></li>
                            <li id="contact"><a class="nav-link" href="contactUs.jsp">Contact us</a></li>
                    </ul>

                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li class="dropdown">
                            <a onclick="myFunction()" class="dropbtn"><img src="images/user.png" style="width:22px"></a>
                            <div id="myDropdown" class="dropdown-content">
                                <% String name = customer.getFullname();%>
                                <% if (name == null) {%>
                                <a href="<%= request.getContextPath()%>/index.jsp">Login</a>
                                <%}else{%>
                                <a href="profile.jsp">View Profile</a>
                                <a href="<%= request.getContextPath()%>/logout">Logout</a>
                                <%}%>
                            </div>
                        </li>
                        <li>
                            <% if (name == null) {%>
                            <a class="nav-link" href="<%= request.getContextPath()%>/index.jsp"><img src="images/cart.png" style="width:22px"></a>
                            <%} else {%>
                            <a class="nav-link" href="cart.jsp"><img src="images/cart.png" style="width:22px"></a>
                            <%}%>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <script>
            /* When the user clicks on the button, 
            toggle between hiding and showing the dropdown content */
            function myFunction() {
              document.getElementById("myDropdown").classList.toggle("show");
            }

            // Close the dropdown if the user clicks outside of it
            window.onclick = function(event) {
              if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                  var openDropdown = dropdowns[i];
                  if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                  }
                }
              }
            }
        </script>
    </body>
    
</html>

<style>
.dropbtn {
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}
</style>
