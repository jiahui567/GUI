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
        <div class="formbold-form-title">
        <h2 class="">Staff</h2>
      </div>
        <%String UserId = (String) request.getParameter("UserId");%>
        <%String FullName = (String) request.getParameter("FullName");%>
        <%String Age = (String)request.getParameter("Age");%>
        <%String PhoneNumber = (String) request.getParameter("ContactNumber");%>
        <%String Email = (String) request.getParameter("Email");%>
        <%@ include file="adminNavBar.jsp" %>
        <form action="<%= request.getContextPath()%>/EmployeeCRUD?action=edit" method="post"">

            <div class="formbold-input-flex">
                <div class="formbold-input-flex-left">
                    <label class="formbold-form-label">Username:</label>
                    <input class="formbold-form-input" type="text" name="username" value="<%=UserId%>" size="40" placeholder="Enter your username"/><br />
                </div>    
                <div class="formbold-input-flex-right">
                    <label class="formbold-form-label">Full Name:</label>
                    <input class="formbold-form-input" type="text" name="fullname" value="<%=FullName%>" size="40" placeholder="Enter your Full Name"/><br />
                </div>
            </div>
            <div class="formbold-input-flex">
                <div class="formbold-input-flex-left">
                    <label class="formbold-form-label">Age:</label> 
                    <input class="formbold-form-input" type="number" name="age" value="<%=Age%>" placeholder="Enter your age"/><br />
                </div>
                <div class="formbold-input-flex-right">   
                    <label class="formbold-form-label">Phone Number:</label>
                    <input class="formbold-form-input" type="text" name="phonenumber" value="<%=PhoneNumber%>" size="40" placeholder="Enter your Phone Number"/><br />
                </div>
            </div>

            <div class="formbold-input-flex">
                <div class="formbold-input-flex-left">
                    <label class="formbold-form-label">Gender</label>
                    <select name="Gender" id="Gender" onchange="this.form.submit()">
                        <option value="1">
                            Male
                        </option>
                        <option value="2">
                            Female
                        </option>
                    </select>
                </div>
                <div class="formbold-input-flex-right">
                    <label class="formbold-form-label">Email:</label>
                    <input class="formbold-form-input" type="text" name="email" value="<%=Email%>" size="40"placeholder="Enter your Email"/><br />
                    <input type="hidden" name="id" value="<%=UserId%>"/>
                </div>
            </div>


            <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">

            </div>
          
            
               
       
             <div style="margin-top:20px;justify-content: space-evenly; width: 500px">
                <input class="formbold-btn" type="submit" value="Submit"/>
                <button class="formbold-btn">Cancel</button>
            </div>
                 
<!--            <img src="fish-on-bicycle.jpg" alt="Fish and Bicyle">  
            <img style=" width:300px;height:316px;"src="fishandbicycle2.jpg" alt="Fish and Bicyle">  
            <img style=" width:300px;height:316px;"src="2k703xb_1.jpg" alt="Fish and Bicyle"> 
            <img style=" width:300px;height:316px;"src="fishbike.jpg" alt="Fish and Bicyle"> -->
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
    .formbold-form-input {
        text-align: center;
        width: 100%;
        padding: 13px 22px;
        border-radius: 5px;
        border: 1px solid #dde3ec;
        background: #ffffff;
        font-weight: 500;
        font-size: 16px;
        color: #536387;
        outline: none;
        resize: none;
    }
    .formbold-form-label {
        color: #536387;
        font-size: 14px;
        line-height: 24px;
        display: block;
        margin-bottom: 10px;
    }
 .formbold-btn {
    font-size: 16px;
    border-radius: 5px;
    padding: 14px 25px;
    border: none;
    font-weight: 500;
    cursor: pointer;
    margin-top: 25px;
    margin-left: 500px;
  }
  .formbold-btn:hover {
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
  }
  .formbold-form-title {
    margin-bottom: 30px;
  }
  .formbold-form-title h2 {
    font-weight: 600;
    font-size: 28px;
    line-height: 34px;
    color: #07074d;
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