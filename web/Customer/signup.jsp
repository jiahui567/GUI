<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> Register Account </title>
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status")%>"/>
    <div class="container">
        <div class="title">Registration</div>
        <div class="content">
            <form action="<%= request.getContextPath()%>/register" method="post" onsubmit="return validation()" >
            <div class="user-details">
              <div class="input-box">
                <span class="details">Full Name</span>
                <input name="name" type="text" placeholder="Enter your name" required>
              </div>
              <div class="input-box">
                <span class="details">Username</span>
                <input name="username" type="text" placeholder="Enter your username" required>
              </div>
              <div class="input-box">
                <span class="details">Age</span>
                <input name="age" type="number" placeholder="Enter your age" required>
              </div>
              <div class="input-box">
                <span class="details">Phone Number</span>
                <input id="phone" name="phone" type="text" placeholder="Enter your number" required>
              </div>
              <div class="input-box">
                <span class="details">Password</span>
                <input id="password" name="password" type="password" placeholder="Enter your password" required>
              </div>
              <div class="input-box">
                <span class="details">Confirm Password</span>
                <input id="password2" name="password2" type="password" placeholder="Confirm your password" required>
              </div>
              <div class="input-box">
                <span class="details">Email</span>
                <input id="email" name="email" type="text" placeholder="Enter your email" required>
              </div>
              <div class="input-box">
                <span class="details">Delivery Address</span>
                <input name="address" type="text" placeholder="Enter your address" required>
              </div>
            </div>
            <div class="gender-details">
              <input type="radio" name="gender" value="male" id="dot-1">
              <input type="radio" name="gender" value="female" id="dot-2">
              <input type="radio" name="gender" value="others" id="dot-3">
              <span class="gender-title">Gender</span>
              <div name="gender" class="category">
                <label for="dot-1">
                <span class="dot one"></span>
                <span class="gender">Male</span>
              </label>
              <label for="dot-2" style="padding-left:20px">
                <span class="dot two" ></span>
                <span class="gender">Female</span>
              </label>
                  <label for="dot-3" style="padding-left:20px">
                <span class="dot three" ></span>
                <span class="gender">Others</span>
              </label>
              </div>
            </div>
            <div class="button">
              <input type="submit" value="Register">
            </div>
            <div class="login-link">Already a user? <a href="../index.jsp">Login Now</a></div>
          </form>
        </div>
    </div>
    <script>
        var status = document.getElementById("status").value;
        if(status=="success"){
            swal("congrats","account created successfully","success")
        }
        
    </script>
    <script>
        function validation(){
            let mail_regex = new RegExp("^[\\w-]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            let phone_regex = new RegExp("[\\d]{3}-{0,1}[\\d]{7,8}");
            let email = document.getElementById("email").value;
            let phone = document.getElementById("phone").value;
            let password = document.getElementById("password").value;
            let password2 = document.getElementById("password2").value;
            
            if(!mail_regex.test(email)){
                alert("Email format incorrect");
                return false;
            }
            
            if(!phone_regex.test(phone)){
                alert("Phone format incorrect");
                return false;
            }
            
            if(password.length<8){
                alert("Password must be longer than 8 character");
                return false;
            }
            if(password != password2){
                alert("Confirm password not match please check");
                return false;
            }
        
         }
     </script>

</body>
</html>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}
body{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background: #C499F3;
}
.container{
  max-width: 700px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: #A155B9;
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #9b59b6;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }  
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #9b59b6;
   border-color: #d9d9d9;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: #A155B9;
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: #5D3587;
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
form .login-link{
  text-align: center;
  margin-top: 20px;
  font-size: 17px;
}
form .login-link a{
  color: #A155B9;
  text-decoration: none;
}
form .login-link a:hover{
  text-decoration: underline;
}      
</style>