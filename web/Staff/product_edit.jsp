<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!----======== CSS ======== -->
        <link rel="stylesheet" href="new.css">

        <!----===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <title>Edit Staff</title>
    </head>
    <body>
        <%int productId =  Integer.parseInt(request.getParameter("productId"));%>
        <%String productName = (String) request.getParameter("productName");%>
        <%double price = Double.parseDouble(request.getParameter("price"));%>
        <%int STOCK_COUNT = Integer.parseInt(request.getParameter("STOCK_COUNT"));%>
        <%String description = (String) request.getParameter("description");%>
        <%@ include file="adminNavBar.jsp" %>
        <form action="<%= request.getContextPath()%>/editProduct?" method="post"">
            <div style=" padding-left: 300px; padding-top: 20px;" >
                <div class="formbold-input-flex">
                    <div class="formbold-input-flex-left">
                        <label class="formbold-form-label">Product Name : </label>
                        <input class="formbold-form-input" type="text" name="productName" value="<%=productName%>" size="40" placeholder="Enter your Product Name"/><br />
                    </div>
                    <div class="formbold-input-flex-right">
                        <label class="formbold-form-label">Price:</label>
                        <input class="formbold-form-input" type="text" name="price" value="<%=price%>" size="40" placeholder="Enter your price"/><br />
                    </div>
                </div>
                <div class="formbold-input-flex">
                    <div class="formbold-input-flex-left">
                        <label class="formbold-form-label">Stock Count : </label>
                        <input class="formbold-form-input" type="number" name="STOCK_COUNT" value="<%=STOCK_COUNT%>" placeholder="Enter the Stock"/><br />
                    </div>
                    <div class="formbold-input-flex-right">   
                        <label>Description:</label>
                        <input class="formbold-form-label"type="text" name="description" value="<%=description%>" size="40" placeholder="Enter the Description"/><br />
                        <input class="formbold-form-input" type="hidden" name="productId" value="<%= productId%>"/>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">
            <input type="submit" value="Submit"/>
        </div>
        <img src="fish-on-bicycle.jpg" alt="Fish and Bicyle">  
        <img style=" width:300px;height:316px;"src="fishandbicycle2.jpg" alt="Fish and Bicyle">  
        <img style=" width:300px;height:316px;"src="2k703xb_1.jpg" alt="Fish and Bicyle"> 
        <img style=" width:300px;height:316px;"src="fishbike.jpg" alt="Fish and Bicyle"> 
    </form>
</body>
</html>
<style>
    body{
        min-height: 100vh;
        background-color: var(--primary-color);
    }
    form  {
        /*        display: table;*/
        /*        padding-left: 300px;*/
        padding-top: 40px;
        margin-left: 200px;
    }
    .formbold-input-flex-left{
        margin-left:200px;
    }
    .formbold-input-flex-right{
        margin-right:200px;
    }
    .formbold-input-flex {
        display: flex;
        gap: 20px;
        margin-bottom: 15px;
    }
    .formbold-input-flex > div {
        width: 50%;
    }
</style>

<script>
    const body = document.querySelector("body"),
            modeToggle = body.querySelector(".mode-toggle");
    sidebar = body.querySelector("nav");
    sidebarToggle = body.querySelector(".sidebar-toggle");

    let getMode = localStorage.getItem("mode");
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
    }

    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }

    modeToggle.addEventListener("click", () => {
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
        } else {
            localStorage.setItem("mode", "light");
        }
    });

    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    })
</script>