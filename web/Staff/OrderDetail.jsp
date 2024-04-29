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
      <% List<OrderItem> itemList = (List) session.getAttribute("orderItemList");%>
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
        <div class="product_title">
            <h1>Order Detail: <%=request.getParameter("orderId")%></h1>
        </div>
        <table border-color="#CCC" class="staff-content" style="width:100%;margin-top:9%">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Price</th>
                
            </tr>
            <% for(OrderItem item:itemList){%>
            <tr>
                <td><%=item.getProductid().getProductId()%></td>
                <td><%=item.getProductid().getProductName()%></td>
                <td><%=item.getQuantity()%></td>
                <td><%=item.getPrice()%></td>
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