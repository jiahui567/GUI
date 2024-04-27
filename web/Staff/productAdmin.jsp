<!DOCTYPE html>
<%@page import="entity.*" %>
<%@page import="java.util.*"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
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
    position:relative;
    display:flex;
    flex-direction:column;
    width:600px;
    pointer-events:auto;
    background-color:#fff;
    background-clip:padding-box;
    border:1px solid rgba(0,0,0,.2);
    border-radius:.3rem;
    outline:0;
    padding:20;
}

.closeProdModal:hover{
    cursor:pointer;
}
      </style>
      <% List<Products> productList = (List) session.getAttribute("productList");%>
<body>
    
    <%@include file="adminNavBar.jsp" %>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <!--<img src="images/profile.jpg" alt="">-->
        </div>
  
        <div class="product_title">
            <h1>Product</h1>
        </div>
        <div style="margin-top:12%">
            <form action="<%= request.getContextPath()%>/Filter?action=Product" method="post" margin="0">
                <label>Category: </label>
                <select name="Product" id="Product" onchange="this.form.submit()">
                <option disabled selected>
                    All
                </option>
                <option value="1">
                    Furniture
                </option>
                <option value="2">
                    Bed
                </option>
                <option value="3">
                    Bathroom
                </option>
                <option value="4">
                    Kitchen
                </option>
            </select>
            </form>
            <button id="addProdModalBtn">Create Product</button>
            <button id="editProdModalBtn">Edit Product</button>


        </div>
        <table border-color="#CCC" class="staff-content" style="margin-top:5%">
            <tr>
                <th>Name</th>
                <th>Stock</th>
                <th>Price</th>
                <th>category</th>
                
            </tr>
            <% for(Products prod:productList){%>
            <tr>
                <td><%= prod.getProductName()%></td>
                <td><%= prod.getStockCount()%></td>
                <td><%= prod.getPrice()%></td>
                <td><%= prod.getCategoryId().getCatName()%></td>
                <td> <button/><a href="<%= request.getContextPath()%>/deleteProduct?prodID=<%= prod.getProductId()%>">Delete</a></td>
                <td> <button/><i class="uil uil-edit">Edit</i></td> 
                
            </tr>
            <%}%>
        </table>
        
<!--        <div class="first_product">
            <div class="product_bathroom">
                <img src="images/bathroom/shower_curtain.png"  height="300">
                <div class="layer">
                    <a href="#">Bathroom</a>
                </div>
            </div>   

            <div class="product_furniture">
                <img src="images/furniture/cabinet_with_sliding_doors.png"  height="300">
                <div class="layer">
                    <a href="#">Furniture</a>
                </div>
            </div> 
        </div>

        <div class="second_product">
            <div class="product_kitchen">
                <img src="images/kitchen/dish_drainer.png"  height="300">
                <div class="layer">
                    <a href="#">Kitchen</a>
                </div>
            </div>  

            <div class="product_bed">
                <img src="images/bed/bedframe_2.png"  height="300">
                <div class="layer">
                    <a href="#">Bed</a>
                </div>
            </div>  
        </div>-->
        <div id="addProdModal" class="modal">
            <div class="modal-content" style="width:600px;padding:20px ">
                <span class="closeProdModal" id="closeProdModal" style="align-self:flex-end;font-size: 36px">&times;</span>
                <div style="font-weight:900;font-size: 24px;text-align: center;padding-bottom: 10px">Create New Product</div>
                <form action="<%= request.getContextPath()%>/addProduct" method="post" enctype="multipart/form-data">
                    <div style="display: flex ;flex-direction: column">

                        <div>Product Name:</div>
                        <input type="text" required name="productName"/>

                        <div>Category:</div>
                        <select name="category" required >
                            <option>Select a category</option>
                            <option value="1">Furniture</option>
                        </select>

                        <div>Description:</div>
                        <input type="text" required name="productDescription"/>

                        <div>Price</div>
                        <input type="number" name="productPrice"/>

                        <div>Stock available:</div>
                        <input type="number" name="stockCount"/>

                        <div>Product Image</div>
                        <input type="file" name="imageFile" style="padding-top:10px">

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

let modal = document.getElementById("addProdModal");
let btn = document.getElementById("addProdModalBtn");
let close = document.getElementById("closeProdModal");

btn.onclick=function(){
    modal.style.display="block";
}

close.onclick=function(){
    modal.style.display="none";
}

window.onclick=function(e){
    if(e.target == modal){
        modal.style.display = "none";
    }
}
</script>