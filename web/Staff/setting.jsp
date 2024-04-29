<%-- 
    Document   : profile
    Created on : 19 Apr 2024, 10:09:42 AM
    Author     : User
--%>
<jsp:useBean id="staff" scope="session" class="entity.Users"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Staff Profile</title>
    
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;900&family=Nunito:wght@400;900&family=Roboto:wght@400;900&display=swap");

    body {
      background: linear-gradient(to right, #3fb6a8, #7ed386);
      overflow: hidden;
      box-sizing: border-box;
    }

    .container {
      background: #fff;
      width: 850px;
      height: 500px;
      margin: 0 auto;
      position: relative;
      margin-top: 10%;
      box-shadow: 2px 5px 20px rgba(119, 119, 119, 0.5);
    }

    .leftbox {
      float: left;
      top: -5%;
      left: 5%;
      position: absolute;
      width: 15%;
      height: 110%;
      background: #7ed386;
      box-shadow: 3px 3px 10px rgba(119, 119, 119, 0.5);
    }

    nav a {
      list-style: none;
      margin-top: 50px;
      padding: 20px;
      margin-left: 30px;
      color: #fff;
      font-size: 1.5em;
      display: block;
      transition: all 0.3s ease-in-out;
    }

    nav a:hover {
      color: #3fb6a8;
      transform: scale(1.2);
      cursor: pointer;
    }

    nav a:first-child {
      margin-top: 7px;
    }

    .rightbox {
      float: right;
      width: 60%;
      height: 100%;
    }
    
    .tabcontent {
        display: none;
    }

    .tabcontent.active {
        display: block;
    }

    .tabcontent {
      position: absolute;
      width: 70%;
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
            width: 540px;
        }

        .change-photo-button,
        .delete-photo-button,
        #profile-image-upload,
        .view-button{
            margin-top: 10px;
            padding: 10px 15px;
            font-size: 13px;
            text-align: center;
            cursor: pointer;
            outline: none;
            color: #fff;
            background-color: #7ed386;
            border: none;
            border-radius: 10px;
        }

        .change-photo-button:hover,
        .delete-photo-button:hover,
        .view-button:hover{
            background-color: #3e8e41;
        }

        .change-photo-button:active,
        .delete-photo-button:active,
        .view-button:active{
            background-color: #3e8e41;
            transform: translateY(2px);
        }

        .profile label {
            color: #777;
            font-family: "Roboto", sans-serif;
            width: 80%;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 1px;
            margin-left: 2px;
        }

        .profile input{
            border: 0;
            border-bottom: 1px solid #3fb6a8;
            width: 60%;
            font-family: "Montserrat", sans-serif;
            font-size: 13px;
            padding: 7px 0;
            color: #070707;
            outline: none;
        }
        

        .order-history table {
            width: 70%;
            border-collapse: collapse;
            background-color: transparent;
        }

        .order-history th,
        .order-history td {
            font-family: "Montserrat", sans-serif;
            color: #black;
            font-size: 12px;
            padding: 8px;
            border-bottom: 1px solid transparent;
            text-align: left;
        }

        .order-history th {
            background-color: rgba(242, 242, 242, 0.5);
        }
        
    h1 {
      font-family: "Montserrat", sans-serif;
      color: #7ed386;
      font-size: 1em;
      margin-top: 40px;
      margin-bottom: 35px;
    }
    
    .btn-update{
        font-family: "Montserrat", sans-serif;
        text-transform: uppercase;
        font-size: 13px;
        border-radius: 10px;
        border: none;
        color: #fff;
        background: #7ed386;
        padding: 7px 15px;
        box-shadow: 0px 2px 4px 0px;
        cursor: pointer;
        margin-top: 15px
    }
    </style>
</head>

<body>
    <div class="container">
        <div class="leftbox">
            <nav>
                <a href="#profile" onclick="openTab(event, 'profile')" class="fa-solid fa-user"></a>
                <a href="#orders" onclick="openTab(event, 'orders')" class="fa-solid fa-tasks"></a>
                <a href="#settings" onclick="openTab(event, 'settings')" class="fa-solid fa-gear"></a>
                <a href="<%= request.getContextPath()%>/logout" onclick="logout()" class="fa-solid fa-right-from-bracket"></a>
                <a href="<%= request.getContextPath()%>/Staff/dashboard.jsp" class="fa-solid fa-house"></a>
            </nav>
        </div>
            
        <div class="rightbox">
            <div id="profile" class="tabcontent">
                <h1>Profile Information</h1>
                
                <form action="<%= request.getContextPath()%>/updateStaffPassword?action=profile" method="post" enctype="multipart/form-data">
                    <div class="profile-picture-container">
                        <div class="profile-picture-actions">
                            <% if(staff.getProfilePic() != null){%>
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(staff.getProfilePic())%>" alt="Profile Picture" class="profile-picture" id="profile-picture">
                            <%}%>
                            <input class="file" name="profilePic" type="file">
                            <button class="delete-photo-button" onclick="deleteProfilePicture()">Delete Photo</button>
                        </div>
                    </div>
                
                    <div class="profile">
                        <label for="name">Name:</label>
                        <input type="text" name="fullname" id="name" value="<%= staff.getFullname()%>" required><br>
                        <label for="email">Email: </label>
                        <input type="email" name="email" id="email" value="<%= staff.getEmail()%>" required><br>
                        <label for="address">Address:</label>
                        <input type="text" name="address" id="address" value="<%= staff.getAddress()%>"><br>
                        <label for="phoneNumber">Phone Number:</label>
                        <input type="text" name="contact" id="phoneNumber" value="<%= staff.getContactNumber()%>" required><br>
                        <button class="btn-update" type="submit">Update</button>
                    </div>
                    
                </form>
            </div>


            <div id="orders" class="tabcontent">
                <h1>Order History</h1>
                <div class="order-history">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>001</td>
                                <td>2024-03-28</td>
                                <td>$50.00</td>
                                <td>Delivered</td>
                                <td><button class="view-button" onclick="viewOrder()">View</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="settings" class="tabcontent">
                <h2>Settings</h2>
                <h3>Change password</h3>
               
                <form action="<%= request.getContextPath()%>/updateStaffPassword?action=password" method="post" onsubmit="return validation()" >
                    <div class="profile-info">
                        <label for="password">Current Password:</label>
                        <input type="password" name="password" id="password" required>
                        <label for="newpassword">New Password </label>
                        <input type="password" name="newpassword" id="newpassword" required>
                        <label for="confirmpassword">Confirm Password</label>
                        <input type="password" name="confirmpassword" id="confirmpassword" required >
                    </div>
                    <input class="btn btn-save" type="submit" value="Save"></input>
                </form>
            </div>

            <div id="logout" class="tabcontent">
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