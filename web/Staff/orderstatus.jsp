<!DOCTYPE html>
<%@page import="entity.*" %>
<%@page import="java.util.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Status</title>
    <!-- CSS -->
    <link rel="stylesheet" href="new.css">

      <!----===== Iconscout CSS ===== -->
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <style>
          .selected-status{
              color:black;
              box-shadow:0px 0px 5px 5px greenyellow ;
              border:1px solid grey;
          }
          button {
              margin-left:30px;
              margin-right: 30px; 
          }
      </style>
      <% List<Orders> orderList = (List) session.getAttribute("orderList");%>
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
  
        <table border-color="#CCC" class="staff-content" style="width:100%;margin-top:9%">
            <tr>
                <th>Order ID</th>
                <th>USER ID</th>
                <th>Order Status</th>
                <th>Details</th>
            </tr>
            <% for(Orders order:orderList){%>
            <tr>
                <td><%=order.getOrderId()%></td>
                <td><%=order.getUserId().getUserId()%></td>
                <td>
                <% if(order.getStatus().getStatusId() == 1){%>
                <button class="selected-status">Pending</button>
                <%} else {%>
                <button><a href="<%= request.getContextPath()%>/changeOrderStatus?Id=<%=order.getOrderId()%>&status=1">Pending</a></button>
                <%}%>
                <% if(order.getStatus().getStatusId() == 2){%>
                <button class="selected-status">Shipping</button>
                <%} else {%>
                <button><a href="<%= request.getContextPath()%>/changeOrderStatus?Id=<%=order.getOrderId()%>&status=2">Shipping</a></button>
                <%}%>
                <% if(order.getStatus().getStatusId() == 3){%>
                <button class="selected-status">Delivery</button>
                <%} else {%>
                <button><a href="<%= request.getContextPath()%>/changeOrderStatus?Id=<%=order.getOrderId()%>&status=3">Delivery</a></button>
                <%}%>
                </td>
                <td><button><a href="<%= request.getContextPath()%>/OrderDetail?Id=<%=order.getOrderId()%>">Show Details</a></button></td>
            </tr>
            <%}%>
        </table>
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