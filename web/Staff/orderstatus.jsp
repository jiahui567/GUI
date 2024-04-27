<!DOCTYPE html>
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
                <th>Name</th>
                <th>Email</th>
                <th>Age</th>
                <th>Address</th>
                <th>OrderStatus</th>
                <th>packaging</th>
                <th>shipping</th>
                <th>delivery</th>

                
            </tr>
            <tr>
                <td>{{name}}</td>
                <td>{{email}}</td>
                <td>{{age}}</td>
                <td>{{address}}</td>
                <td>
<!--                        <select>
                            <option id="pack" value="packaging" type="checkbox">packaging</option>
                            <option id="ship" value="shipping">shipping</option>
                            <option id="deli" value="delivery">delivery</option>
                        </select>-->
                            <input type="radio"></input>
                            <label>packaging</label>
                            <input type="radio"></input>
                            <label>shipping</label>
                            <input type="radio"></input>
                            <label>delivery</label>
                </td>
            </tr>
            <tr>
                <td>{{name}}</td>
                <td>{{email}}</td>
                <td>{{age}}</td>
                <td>{{address}}</td>
                <td>{{packaging,shipping,delivery}}</td>  
                <td><button color="light" style="color:black;box-shadow:0px 0px 5px 5px greenyellow ;border:1px solid grey">Pending</button></td>
                <td><button>shipping</button></td>
                <td><button>delivery</button></td>

            </tr>
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