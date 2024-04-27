<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<%@page import="entity.Orders" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="new.css">
     
    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin</title>
</head>
<body>
    <%@ include file="adminNavBar.jsp"%>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div>
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <!--<img src="images/profile.jpg" alt="">-->
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total Sales</span>
                        <% int orderCount = (int)session.getAttribute("orderCount");%>
                        <span class="number"><%= orderCount%></span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Feed Backs</span>
                        <% int feedbackCount = (int)session.getAttribute("feedbackCount");%>
                        <span class="number"><%= feedbackCount%></span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-share"></i>
                        <span class="text">Total User</span>
                        <% int userCount = (int) session.getAttribute("userCount");%>
                        <span class="number"><%= userCount%></span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>

                <div class="activity-data">
                   
                    <div class="data names">                      
                        <span class="data-title">Order ID</span> 
                        <% List<Orders> OrderRecord = (List) session.getAttribute("OrderRecord");%>

                        <% for(Orders order:OrderRecord){%> 
                        <span><%=order.getOrderId()%></span>  
                        <% 
                            }
                        %>
                    </div>
                    <div class="data email">
                        <span class="data-title">Item Count</span>
                        <% for(Orders order:OrderRecord){%> 
                        <span><%=order.getItemCount()%></span>  
                        <% 
                            }
                        %>
                    </div>
                    <div class="data joined">
                        <span class="data-title">Cart ID</span>
                        <% for(Orders order:OrderRecord){%> 
                        <span><%=order.getCartId().getCartCount()%></span>  
                        <% 
                            }
                        %>
                    </div>
                    <div class="data type">
                        <span class="data-title">Status</span>
                        <% for(Orders order:OrderRecord){%> 
                        <span><%=order.getStatus().getStatusType()%></span>  
                        <% 
                            }
                        %>
                    </div>
                    <div class="data status">
                        <span class="data-title">User</span>
                        <% for(Orders order:OrderRecord){%> 
                        <span><%=order.getUserId().getFullname()%></span>  
                        <% 
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
</html>

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