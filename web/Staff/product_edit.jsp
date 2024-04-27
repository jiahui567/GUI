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

                <label>Product Name : </label>
                <input type="text" name="productName" value="<%=productName%>" size="40" placeholder="Enter your Product Name"/><br />
                <label>Price:</label>
                <input type="text" name="price" value="<%=price%>" size="40" placeholder="Enter your price"/><br />
                <label>Stock Count : </label>
                <input type="number" name="STOCK_COUNT" value="<%=STOCK_COUNT%>" placeholder="Enter the Stock"/><br />
                <label>Description:</label>
                <input type="text" name="description" value="<%=description%>" size="40" placeholder="Enter the Description"/><br />
                <input type="hidden" name="productId" value="<%= productId%>"/>
            </div>
        </div>

        <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">
            <input type="submit" value="Submit"/>
        </div>

    </form>
</body>
</html>
<style>
    input{
        margin-top: 10;
    }
    body{
        min-height: 100vh;
        background-color: var(--primary-color);
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