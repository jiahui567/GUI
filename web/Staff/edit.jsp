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

        <%String UserId = (String) request.getParameter("UserId");%>
        <%String FullName = (String) request.getParameter("FullName");%>
        <%String Age = (String)request.getParameter("Age");%>
        <%String PhoneNumber = (String) request.getParameter("ContactNumber");%>
        <%String Email = (String) request.getParameter("Email");%>
        <%@ include file="adminNavBar.jsp" %>
        <form action="<%= request.getContextPath()%>/addEmployee" method="post"">
            <div style=" padding-left: 300px; padding-top: 20px;" >

                <label>Username:</label>
                <input type="text" name="username" value="<%=UserId%>" size="40" placeholder="Enter your username"/><br />
                <label>Full Name:</label>
                <input type="text" name="last" value="<%=FullName%>" size="40" placeholder="Enter your Full Name"/><br />
                <label>Age:</label>
                <input type="number" name="age" value="<%=Age%>" placeholder="Enter your age"/><br />
                <label>Phone Number:</label>
                <input type="text" name="phonenumber" value="<%=PhoneNumber%>" size="40" placeholder="Enter your Phone Number"/><br />
                <label>Email:</label>
                <input type="text" name="email" value="<%=Email%>" size="40"placeholder="Enter your Email"/><br />

            </div>
        </div>

        <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">
            <input type="submit" value="Create"/>
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