<%@page import="java.util.*"%>
<%@page import="entity.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= session.getAttribute("title")%></title>
        <!-- CSS -->
        <link rel="stylesheet" href="new.css">

        <!----===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-left: 30vw;
            }

            /* Modal Content */
            .modal-content {
                position:fixed;
                display:flex;
                flex-direction:column;
                width:600px;
                pointer-events:auto;
                background-color:#fff;
                background-clip:padding-box;
                border:1px solid rgba(0,0,0,.2);
                border-radius:.3rem;
                outline:0;
                padding:20px;
            }

            .formbold-form-title {
                margin-bottom: 30px;
                margin-left: 90px;
            }
            .formbold-form-title h2 {
                font-weight: 600;
                font-size: 28px;
                line-height: 34px;
                color: #07074d;
            }
        </style>
    </head>
    <%
        List<Users> admin = (List) session.getAttribute("adminList");
    %>
    <body>
        <%@ include file="adminNavBar.jsp" %>

        <section class="dashboard " >

            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>

                <form method="post" action="<%= request.getContextPath()%>/Search?search=staff">
                    <i class="uil uil-search"></i>
                    <input type="text" name="value" placeholder="Search here..." onchange="this.form.submit()">
                </form>

                <div class="option-role">
                    <form action="<%= request.getContextPath()%>/Filter?action=Role" method="post">
                        <select name="Role" id="Role" onchange="this.form.submit()">
                            <option disabled selected>Filter</option>
                            <option value="0">All</option>
                            <option value="1">Manager</option>
                            <option value="2">Staff</option>
                        </select>
                    </form>
                </div> 

                <!--<img src="images/profile.jpg" alt="">-->
            </div>
            <div class="product_title">
                <h2>Staff</h2>
            </div>
            <button style="margin-top:7%;margin-bottom: 5px;float:right" id="addStaffModalBtn" ><i class="uil uil-plus"></i>Add Employee</button>

            <table border-color="#CCC" class="staff-content" style="width:100%">
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Contact Number</th>
                    <th>Gender</th>
                    <th>Role</th>
                </tr>
                <% for (Users adminUser : admin) {%>
                <tr>
                    <td><%= adminUser.getUserId()%></td>   
                    <td><%= adminUser.getFullname()%></td>
                    <td><%= adminUser.getEmail()%></td>
                    <td><%= adminUser.getAge()%></td>
                    <td><%= adminUser.getContactNumber()%></td>
                    <td><%= adminUser.getGender()%></td>
                    <td><%= adminUser.getTypeId().getTypeName()%></td>
                    <td> <button/><a href="<%= request.getContextPath()%>/EmployeeCRUD?action=delete&userID=<%=adminUser.getUserId()%>">Delete</a></td>
                    <td> <button/><a class="uil uil-edit" href="edit.jsp?action=update&UserId=<%=adminUser.getUserId()%>&FullName=<%=adminUser.getFullname()%>&Age=<%=adminUser.getAge()%>&ContactNumber=<%=adminUser.getContactNumber()%>&Email=<%=adminUser.getEmail()%>" id="edit">Edit</a></td> 

                </tr>
                <%}%>
            </table>
            <!--edit staff modal-->
            <div id="editStaffModal" class="modal">
                <div class="modal-content">
                    <span id="closeStaffModal" style="align-self:flex-end;font-size: 48px;display:flex;text-align: right">&times;</span>
                    <form action="<%= request.getContextPath()%>/ProductCRUD?action=edit" method="post">
                        <div style="display: flex ;flex-direction: column" >
                            <div style="display:flex;flex-direction: row">
                                <div class="input-box">
                                    <span class="details">Full Name:</span>
                                    <input name="name" type="text" placeholder="Enter your name" required>
                                </div>

                                <div class="input-box">
                                    <span class="details">Username:</span>
                                    <input name="username" type="text" placeholder="Enter your username" required>
                                </div>

                            </div>
                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Age:</span>
                                    <input name="age" type="number" placeholder="Enter your age" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">Phone Number:</span>
                                    <input name="phone" type="text" placeholder="Enter your number" required>
                                </div>

                            </div>
                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Password:</span>
                                    <input name="password" type="password" placeholder="Enter your password" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">Confirm Password:</span>
                                    <input name="password2" type="password" placeholder="Confirm your password" required>
                                </div>
                            </div>
                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Email:</span>
                                    <input name="email" type="text" placeholder="Enter your email" required>
                                </div>
                                <div>
                                    <span>Category:</span>
                                    <select>
                                        <option value="1">Admin</option>
                                        <option value="2">Staff</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">
                            <input type="submit" value="Create"/>
                        </div>

                    </form>
                </div>
            </div>

            <!--create new employee modal-->
            <div id="addStaffModal" class="modal">
                <div class="modal-content">
                    <span id="addStaffModalClose" style="align-self:flex-end;font-size: 48px;display:flex;text-align: right">&times;</span>
                    <form action="<%= request.getContextPath()%>/EmployeeCRUD?action=add" method="post">
                        <div style="display: flex ;flex-direction: column" >
                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Full Name:</span>
                                    <input name="name" type="text" placeholder="Enter your name" required>
                                </div>

                                <div class="input-box">
                                    <span class="details">Username:</span>
                                    <input name="username" type="text" placeholder="Enter your username" required>
                                </div>

                            </div>
                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Age:</span>
                                    <input name="age" type="number" placeholder="Enter your age" required>
                                </div>
                                <div class="input-box">
                                    <span class="details">Phone Number:</span>
                                    <input name="phone" type="text" placeholder="Enter your number" required>
                                </div>

                            </div>

                            <div style="display:flex;flex-direction: row">

                                <div class="input-box">
                                    <span class="details">Email:</span>
                                    <input name="email" type="text" placeholder="Enter your email" required>
                                </div>
                                <div>
                                    <span>Category:</span>
                                    <select name="category">
                                        <option value="1">Admin</option>
                                        <option value="2">Staff</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div style="display: flex;flex-direction: row;margin-top:20px;justify-content: space-evenly ">
                            <input type="submit" value="Create"/>
                        </div>

                    </form>
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

    let addStaffModal = document.getElementById("addStaffModal");
    let addStaffBtn = document.getElementById("addStaffModalBtn");
    let addStaffClose = document.getElementById("addStaffModalClose");

    addStaffBtn.onclick = function () {
        addStaffModal.style.display = "block";
    }

    addStaffClose.onclick = function () {
        addStaffModal.style.display = "none";
    }


    window.onclick = function (event) {
        if (event.target == addStaffModal) {
            addStaffModal.style.display = "none";
        }
    }

</script>
