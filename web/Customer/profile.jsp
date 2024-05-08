<jsp:useBean id="customer" scope="session" class="entity.Users"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="entity.*" %>
<% List<Payment> orderList = (List) request.getAttribute("customerOrderList");%>
<% List<Promotion> promoteList = (List) request.getAttribute("customerPromotion");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: row;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #f7f7f7;
            border: 1px solid #ccc;
            border-radius: 8px;
            overflow: hidden;
        }

        .sidebar {
            width: 250px;
            background-color: #f0f0f0;
            padding: 20px;
        }

        .sidebar h2 {
            margin-bottom: 20px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .tabcontent {
            display: none;
        }

        .tabcontent.active {
            display: block;
        }

        .profile-picture-container {
            text-align: center;
        }

        .profile-picture {
            background-color: black;
            display: inline-block;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-picture-actions {
            margin-top: 10px;
        }

        .change-photo-button,
        .delete-photo-button,
        #profile-image-upload{
            padding: 10px 15px;
            font-size: 13px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #04AA6D;
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px #999;
        }

        .change-photo-button:hover,
        .delete-photo-button:hover {
            background-color: #3e8e41;
        }

        .change-photo-button:active,
        .delete-photo-button:active {
            background-color: #3e8e41;
            box-shadow: 0 2px #666;
            transform: translateY(2px);
        }

        .profile-info label {
            font-weight: bold;
        }

        .profile-info input {
            width: calc(100% - 16px);
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            color: rgba(0, 0, 0, 0.5);
        }

        .btn-save {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-save:hover {
            background-color: #0056b3;
        }

        .order-history table {
            width: 100%;
            border-collapse: collapse;
            background-color: transparent;
        }

        .order-history th,
        .order-history td {
            padding: 8px;
            border-bottom: 1px solid transparent;
            text-align: left;
        }

        .order-history th {
            background-color: rgba(242, 242, 242, 0.5);
        }

        .view-button {
            transition: background-color 0.3s ease;
        }

        .view-button:hover {
            background-color: skyblue;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="sidebar">
            <h2>My Account</h2>
            <ul>
                <li><a href="#profile" onclick="openTab(event, 'profile')">Profile</a></li>
                <li><a href="#orders" onclick="openTab(event, 'orders')">Order History</a></li>
                <li><a href="#settings" onclick="openTab(event, 'settings')">Settings</a></li>
                <li><a href="#promotion" onclick="openTab(event, 'promotion')">Promotion</a></li>
                <li><a href="<%= request.getContextPath()%>/logout" onclick="logout()">Logout</a></li>
                <li><a href="<%= request.getContextPath()%>/Customer/home.jsp">Home</a></li>
            </ul>
        </div>
        <div class="content">
            <div id="profile" class="tabcontent">
                <h2>Profile Information</h2>
                
                <form action="<%= request.getContextPath()%>/updateProfile?action=profile" method="post" enctype="multipart/form-data">
                    <div class="profile-picture-container">
                        <% if(customer.getProfilePic() != null){%>
                          <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(customer.getProfilePic())%>" alt="Profile Picture" class="profile-picture" id="profile-picture">
                        <%}%>
                        <img>
                        <div class="profile-picture-actions">
                            <input name="profilePic" type="file">
                            <button class="delete-photo-button" onclick="deleteProfilePicture()">Delete Photo</button>
                        </div>
                    </div>
                
                    <div class="profile-info">
                        <label for="name">Name:</label>
                        <input type="text" name="fullname" id="name" value="<%= customer.getFullname()%>" required>
                        <label for="email">Email: </label>
                        <input type="email" name="email" id="email" value="<%= customer.getEmail()%>" required>
                        <label for="address">Address:</label>
                        <input type="text" name="address" id="address" value="<%= customer.getAddress()%>">
                        <label for="phoneNumber">Phone Number:</label>
                        <input type="text" name="contact" id="phoneNumber" value="<%= customer.getContactNumber()%>" required>
                    </div>
                    <input class="btn btn-save" type="submit" value="Save"></input>
                </form>
            </div>


            <div id="orders" class="tabcontent">
                <h2>Order History</h2>
                <div class="order-history">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(Payment order:orderList){%>
                            <tr>
                                <td><%=order.getOrderId().getAddress()%></td>
                                <td><%=order.getPaymentDate()%></td>
                                <td><%=order.getAmount()%></td>
                                <td><%=order.getOrderId().getStatus().getStatusType()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="promotion" class="tabcontent">
                <h2>Promotion</h2>
                <div class="order-history">
                    <table>
                        <thead>
                            <tr>
                                <th>Promote Code</th>
                                <th>Promotion Amount</th>
                                <th>Minimum Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(Promotion promote:promoteList){%>
                            <tr>
                                <td><%=promote.getPromoCode()%></td>
                                <td><%=promote.getAmount()%></td>
                                <td><%=promote.getMinAmount()%></td>
                                <td><%=promote.getStatus()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="settings" class="tabcontent">
                <h2>Change password</h2>

                    <form action="<%= request.getContextPath()%>/updateProfile?action=password" method="post" onsubmit="return validation()" >
                        <div>
                            <label for="password">Current Password:</label>
                            <input type="password" name="password" id="password" required>
                        </div>
                        <div>
                            <label for="newpassword">New Password : </label>
                            <input type="password" name="newpassword" id="newpassword" required>
                        </div>
                        <div>
                            <label for="confirmpassword">Confirm Password ：</label>
                            <input type="password" name="confirmpassword" id="confirmpassword" required >   
                        </div>

                        <div style="margin-top:20px;justify-content: space-evenly; width: 500px">
                            <input type="submit" value="Submit"/>
                        </div>

                      
                    </form>
            </div>

            <div id="logout" class="tabcontent">
                <h2>Logout</h2>
                <!-- Logout button or link goes here -->
            </div>
        </div>
    </div>

    <script>
        
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByTagName("a");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].classList.remove("active");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.classList.add("active");
        }    
        document.getElementsByTagName("a")[0].click();

        function viewOrder() {
             view.html
            window.location.href = "view.html";
        }

        function uploadProfilePicture(event) {
            var input = event.target;
            if (input.files.length > 0) {
                var file = input.files[0];
                if (file.type.match('image.*')) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('profile-picture').src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                } else {
                    alert('Please select an image file.');
                }
            }
        }

        function deleteProfilePicture() {
            document.getElementById('profile-picture').src = 'https://bootdey.com/img/Content/avatar/avatar1.png';
            document.getElementById('profile-image-upload').value = '';
        }

        function saveProfile() {
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var address = document.getElementById('address').value;
            var phoneNumber = document.getElementById('phoneNumber').value;
            var postcode = document.getElementById('postcode').value;

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var phonePattern = /^\d{3}-\d{7,10}$/;
            var postcodePattern = /^\d+$/;

            if (name.trim() === '' || address.trim() === '' || postcode.trim() === '') {
                alert('Please fill in all required fields.');
                return;
            }

            if (!emailPattern.test(email)) {
                alert('Please enter a valid email address.');
                return;
            }

            if (!phonePattern.test(phoneNumber)) {
                alert('Please enter a valid phone number in the format XXX-XXXXXXX or XXX-XXX-XXXX.');
                return;
            }

            if (!postcodePattern.test(postcode)) {
                alert('Please enter a valid postcode with numbers only.');
                return;
            }

            alert('Profile saved!');
        }
    </script>
</body>
</html>
